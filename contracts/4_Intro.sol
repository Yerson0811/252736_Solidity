// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts@4.9.3/utils/Counters.sol";

contract Intro{

    uint256 private amount;
    string public name = "Blockchain";

    constructor (uint256 _amountValue){
        amount = _amountValue;
    }

    function setAmount(uint256 _amount) public{
        amount = _amount;
    }

    function getAmount() public view returns (uint256){
        return  amount;
    }

    function getSum(uint256 _a, uint256 _b) public pure returns (uint256){
        return _a + _b;
    }
}