// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Payable{
    address public owner;

    constructor () {
        owner = msg.sender;
    }
    
    modifier isOwner() {
        require(msg.sender == owner, "No eres el propietario");
        _;
    }

    function deposit() public  payable {

    }

    function withdraw() public  isOwner {
        payable (owner).transfer(address(this).balance);
    }
}