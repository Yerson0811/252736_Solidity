// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CompArray{
    //Struct
    struct Student{
        string name;
        uint age;
    }

    uint256[] public num;

    Student[] public students;

    function setNum(uint _num) public{
        num.push(_num);
    }

    function getNum() public view returns(uint256[] memory){
        return num;
    }

    function getNumLength() public view returns(uint){
        return num.length;
    }

    //function num(uint256 index) public view returns(uint) -> From compilator
     function addStudent(string memory _name, uint _age) public{
        students.push(Student(_name, _age));
     }

     function getStudent(uint256 i) public view returns(string memory, uint){
        //version 1
        Student memory a = students[i];
        return (a.name, a.age);
        
        //version 2
        //return (students[i].name, students[i].age);
     }
}
