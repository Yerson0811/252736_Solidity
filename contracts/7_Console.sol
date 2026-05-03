// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Console{

    //event Debug(string message, address sender);

    uint256 private amount = 252736;

    function setAmount(uint256 _amount) public{
        console.log("Actualizado por: ", msg.sender);
        console.log("Valor anterior: ", amount);
        console.log("Valor nuevo: ", _amount);
        amount = _amount;
    }

    function getAmount() public view returns (uint256){
        console.log("Consultado por: ", msg.sender);
        //emit Debug("Consultado por: ", msg.sender);
        return  amount;
    }
}