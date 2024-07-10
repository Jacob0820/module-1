// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract MyToken {

    uint public totalSupply = 0;
    uint public maxTransaction = 800;
    address public owner;

    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender; // Contract deployer is the owner
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    function deposit(address _address, uint _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        totalSupply += _amount;
        balances[_address] += _amount;
    }

    function withdraw(address _address, uint _amount) public {
        require(balances[_address] >= _amount, "Insufficient balance");

        if (_amount > maxTransaction) {
            revert("Transaction amount exceeds maximum allowed");
        }

        totalSupply -= _amount;
        balances[_address] -= _amount;

        assert(totalSupply >= 0);
    }

    function transfer(address _to, uint _amount) public {
        require(_amount > 0, "Amount must be greater than 0");
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function changeMaxTransaction(uint _newMax) public onlyOwner {
        maxTransaction = _newMax;
    }
}
