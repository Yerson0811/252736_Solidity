// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Calculator{
    function calculateFinalGrade(uint256 teo, uint256 pra, uint256 lab) public pure returns(uint){
        uint256 FG = (teo * 30 + pra * 30 + lab * 40) / 100;
        //uint256 FG = (teo * 10 + pra * 10 + lab * 80) / 100;
        return FG;
    }
}

contract RecordGrades is Ownable{

    address public  addressCalculator;

    mapping (address => uint256) public studentGrades;

    constructor (address _addressCalculator) Ownable(msg.sender){
        addressCalculator = _addressCalculator;
    }

    function updateCalculator (address _addressCalculator) public onlyOwner{
        addressCalculator = _addressCalculator;
    }

    function recordGrades(address _dirStudent, uint256 _teo, uint256 _pra, uint256 _lab) public onlyOwner {
        Calculator calculator = Calculator(addressCalculator);
        uint256 FG = calculator.calculateFinalGrade(_teo, _pra, _lab);
        studentGrades[_dirStudent] = FG;
    }

    function testCalculator() public view returns(uint256) {
    Calculator calculator = Calculator(addressCalculator);
    return calculator.calculateFinalGrade(10, 10, 10);
}

    function viewGrade() public view returns(uint256){
        return studentGrades[msg.sender];
    }
}