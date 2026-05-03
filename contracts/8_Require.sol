// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Require{
    uint256 public number = 252736;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    function setNumber(uint256 _number) public{
        //require(owner == msg.sender,"No eres el propietario");
        require(_number > number, "El nuevo numero debe ser mayor que el numero anterior.");
        number = _number;
    }

    function getNumber() public view returns(uint256){
        return number;
    }
}