pragma solidity >=0.4.16 <0.9.0;

contract BankAccount {
    uint checkingAccount;

    function set(uint x) public {
        checkingAccount = x;
    }

    function get() public returns (uint) {
        return checkingAccount;
    }

    function withdrawl(uint x) public {
        checkingAccount -= x;
    }

    function deposit(uint x) public {
        checkingAccount += x;
    }
}