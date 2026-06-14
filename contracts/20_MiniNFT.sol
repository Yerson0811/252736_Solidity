// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MiniNFT is ERC721,  Ownable{

    uint256 private _counterId = 1;

    constructor ()
        ERC721("Art Gallery", "ART")
        Ownable(msg.sender)
    {

    }

    function mint(address to) public onlyOwner {
        _safeMint(to, _counterId++);
    }
}