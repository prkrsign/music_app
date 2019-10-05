pragma solidity ^0.4.24;

contract HelloWorld {
    string public greeting;
    address public owner;

    function HelloWorld(string _greeting) {
        greeting = _greeting;
        owner = msg.sender;
    }

    function greet() constant public returns (string) {
        return greeting;
    }

    function getBalance() constant public returns (uint balance) {
        return owner.balance;
    }

    function getAddress() constant public returns (address) {
        return owner;
    }
}