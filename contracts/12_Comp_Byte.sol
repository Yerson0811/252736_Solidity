// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract CompByte{
    bytes private data;

    function setData(bytes memory _data) public{
        data = _data;
    }

    function getData() public view returns(bytes memory){
        return data;
    }

    function addData(bytes memory _data) public{
        data = bytes.concat(data, _data);
    }

    function setDataString(string memory _data) public{
        data = bytes(_data);
    }

    function getDataString() public view returns(string memory){
        return string(data);
    }

    function addDataString(string memory _data) public{
        data = bytes.concat(data, bytes(_data));
    }
}
