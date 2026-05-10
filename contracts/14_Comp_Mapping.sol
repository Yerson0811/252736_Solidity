// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CompMapping{

    uint256 seq=100;

    //Struct
    struct Employee{
        string name;
        uint age;
    }

    /*struct Account{
        address account;
        uint balance;
    }*/

    //key => value
    mapping(uint => Employee) private employees;

    function addEmployee(uint _id, string memory _name, uint _age) public{
        employees[_id] = Employee(_name, _age);
    }

    function addEmployeeSequential(string memory _name, uint _age) public{
        employees[seq] = Employee(_name, _age);
        seq++;
    }
    
    function getEmployee(uint _id) public view returns(string memory, uint){
        Employee storage emp = employees[_id];
        return (emp.name, emp.age);
    }
}
