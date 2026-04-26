// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Senders{

    uint256 private amount;
    address public initAccount;

    constructor (uint256 _amountValue){
        amount = _amountValue;
        initAccount = msg.sender;
    }

    function getAmount() public view returns (uint256){
        return  amount;
    }

}
