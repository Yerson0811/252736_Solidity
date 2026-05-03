// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Complex1{
    string private greeting = "Hola";

    function setGreeting(string memory _greeting) public{
        greeting = _greeting;
    }

    function greet() public view returns(string memory){
        return greeting;
    }
}