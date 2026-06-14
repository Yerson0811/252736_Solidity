// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BallenitaFCToken is ERC20,  Ownable{

    uint256 public tokenPrice = 0.001 ether;

    constructor () ERC20("Ballenita Futbol Club Token", "BFC") Ownable(msg.sender){
        _mint(owner(), 1000 * 10**18);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 10 ** 18);
    }

    function isPartner(address account) public view returns (bool){
        return balanceOf(account) > 0;
    }

    function balanceOfBFT(address account) public view returns (uint256){
        return balanceOf(account) / 10**18;
    }

    function buyTokens() public  payable {
        require(msg.value>0, "Debes enviar un valor minimo de ETH");
        uint256 amountBFT = msg.value / tokenPrice;
        require(amountBFT>0, "El ETH enviado es insuficiente");
        mint(msg.sender, amountBFT);
    }

    function withdraw() public onlyOwner {
        payable (owner()).transfer(address(this).balance);
    }
}