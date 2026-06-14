// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BallenitaNFT is ERC721,  Ownable{

    uint256 private _counterId = 1;

    constructor ()
        ERC721("Ballenita Poster Token - NFT", "BPT")
        Ownable(msg.sender)
    {

    }

    struct Poster {
        uint256 id;
        string name;
        uint256 level;
        uint256 rarity;
    }

    mapping(uint256 => Poster) private posters;

    function mint(address to, string memory _name, uint256 _level, uint256 _rarity) public onlyOwner {
        uint256 posterId = _counterId;
        posters[posterId] = Poster(posterId, _name, _level, _rarity);
        _safeMint(to, _counterId);
        _counterId++;
    }

    function showPoster(uint256 tokenId) public view returns (uint256, string memory, uint256, uint256){
        Poster memory poster = posters[tokenId];
        return (poster.id, poster.name, poster.level, poster.rarity);
    }
}