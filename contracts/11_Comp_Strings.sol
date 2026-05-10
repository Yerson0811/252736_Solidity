// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CompString{
    string private greeting = "Hola ";

    function setGreeting(string memory text) public{
        greeting = text;
    }

    function greet() public view returns(string memory){
        return greeting;
    }

    function sum(string memory name) public view returns (string memory){
        return string.concat(greeting, name);
        //return string(abi.encodePacked(greeting, name));
    }

    function greetEveryone(string[] memory names) public view returns (string memory) {
        string memory result = "";

        for (uint i = 0; i < names.length; i++) {
            result = string.concat(result, greeting, names[i]);

            if (i < names.length - 1) {
                result = string.concat(result, ", ");
            }
        }

        return result;
    }
}
