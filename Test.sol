pragma solidity ^0.8.4;

contract Withdraw {
    address public richest;
    uint public mostSent;

    mapping (address => uint) pendingWithdrawls;

    error NotEnoughEther();

    constructor() payable {
        richest = msg.sender;
        mostSent = msg.value;
    }

    function becomeRichest() public payable {
        if (msg.value <= mostSent) revert NotEnoughEther();
        pendingWithdrawls[richest] += msg.value;
        richest = msg.sender;
        mostSent = msg.value;
    }

    function withdraw() public {
        uint amount = pendingWithdrawls[msg.sender];
        pendingWithdrawls[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}