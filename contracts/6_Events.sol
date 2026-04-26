// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Events{

    uint256 private amount =10;
    
    event setAmountValue(address account, uint256 newValue); //event declaration

    function setAmount(uint256 _amount) public{
        amount = _amount;
        emit setAmountValue(msg.sender, _amount); //event emitted
    }

    function getAmount() public view returns (uint256){
        return  amount;
    }
}
