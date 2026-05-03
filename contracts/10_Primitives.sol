// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Primitives{
    bool public paused;

    bytes32 public greeting = hex"486F6C61";

    bytes32 public key;

    function pause(bool _option) public {
        paused = _option;
    }

    function sum(uint256 _a, uint256 _b) public view returns (uint256){
        require(paused == false, "El contrato esta pausado");
        return _a + _b;
    }

    function greetHex() public view returns(bytes32){
        return greeting;
    }

    function generateKey(string memory text) public {
        key = keccak256(abi.encodePacked(text));
    }
}