// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//Buy with BFT
contract BallenitaNFT is ERC721,  Ownable{

    uint256 private _counterId = 1;

    IERC20 public tokenBFT;

    constructor (address _addressTokenNFT)
        ERC721("Ballenita Poster Token - NFT", "BPT")
        Ownable(msg.sender)
    {
        tokenBFT = IERC20(_addressTokenNFT);
    }

    struct Poster {
        uint256 id;
        string name;
        uint256 level;
        uint256 rarity;
        uint256 price;
    }

    mapping(uint256 => Poster) private posters;

    function mint(string memory _name, uint256 _level, uint256 _rarity, uint256 _price) public onlyOwner {
        uint256 posterId = _counterId;
        posters[posterId] = Poster(posterId, _name, _level, _rarity, _price);
        _mint(address(this), _counterId);
        _counterId++;
    }

    function showPoster(uint256 tokenId) public view returns (uint256, string memory, uint256, uint256, uint256) {
        Poster memory poster = posters[tokenId];
        return (poster.id, poster.name, poster.level, poster.rarity, poster.price);
    }

    function showPostersProp(address owner) public view returns (Poster[] memory) {
        uint256 posterAmount = balanceOf(owner);
        Poster[] memory result = new Poster[](posterAmount);
        uint256 counter = 0;
        for(uint256 tokenId = 1; tokenId < _counterId; tokenId++ ) {
            
            if(ownerOf(tokenId) == owner) {
                result[counter] = posters[tokenId];
                counter++;
            }
        }
        return result;
    }

    function buyPoster (uint256 tokenId) public payable {
        require(ownerOf(tokenId) == address(this), "El poster no esta disponible");
        require(tokenBFT.balanceOf(msg.sender) > 0, "Solo disponible para socios");
        Poster memory poster = posters[tokenId];
        require(msg.value >= poster.price, "ETH Insuficiente ");
        _transfer(address(this), msg.sender, tokenId);
    }

    function buyPosterWithBFT (uint256 tokenId) public payable {
        require(ownerOf(tokenId) == address(this), "El poster no esta disponible");
        Poster memory poster = posters[tokenId];
        require(tokenBFT.balanceOf(msg.sender) >= poster.price, "BFT Insuficiente ");
        tokenBFT.transferFrom(msg.sender, owner(), poster.price);
        _transfer(address(this), msg.sender, tokenId);
    }

    function withdraw() public onlyOwner {
        payable (owner()).transfer(address(this).balance);
    }
}