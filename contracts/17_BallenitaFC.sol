// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BallenitaFCToken is ERC20{

    address public owner = msg.sender;

    constructor () ERC20("Ballenita Futbol Club Token", "BFC") {
        owner = msg.sender;
        _mint(owner, 1000);
    }

    modifier isOwner(){
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function isPartner(address account) public view returns (bool){
        return balanceOf(account) > 0;
    }
}