// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Require{
    uint256 private funds = 0;
    address private owner;

    constructor(){
        owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender == owner, "No eres el propietario.");
        _;
    }

    modifier notZero(){
        require( funds > 0, "No hay fondos.");
        _;
    }

    function setFunds(uint256 amount) public{
        funds = funds + amount; //funds = +=amount;
    }

    function withdrawFunds(uint256 amount) public isOwner notZero {
        //require(msg.sender == owner, "No eres el propietario.");
        require(funds >= amount, "Fondos insuficientes.");
        funds = funds - amount; //funds = -=amount;
    }

    function cleanFunds() public isOwner {
        //require(msg.sender == owner, "No eres el propietario.");
        funds = 0;
    }

    function getFunds() public view isOwner returns(uint256){
        //require(msg.sender == owner, "No eres el propietario.");
        return funds;
    }
}