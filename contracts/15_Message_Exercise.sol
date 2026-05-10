// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

contract MessagingExercise {

    address public owner;

    struct Message {
        address from;
        address to;
        string content;
        uint256 timestamp;
    }

    Message[] public messageHistory;

    event NewMessage(address indexed from, address indexed to, string content, uint256 timestamp);

    constructor() {
        owner = msg.sender;
    }

    function sendMessage(address _to, string memory _content) public {

        require(msg.sender == owner, "Solo el propietario puede enviar mensajes");

        Message memory messageToSave = Message({
            from: msg.sender,
            to: _to,
            content: _content,
            timestamp: block.timestamp
        });

        messageHistory.push(messageToSave);

        emit NewMessage(msg.sender, _to, _content, block.timestamp);
    }

    function getMessageCount() public view returns (uint256){
        return messageHistory.length;
    }

    function getMessage(uint256 index) public view returns (address from, address to, string memory content, uint256 timestamp){
        require(index < messageHistory.length, "Indice fuera de rango");

        Message memory m = messageHistory[index];

        return (m.from, m.to, m.content, m.timestamp
        );
    }
}