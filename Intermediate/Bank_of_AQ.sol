pragma solidity ^0.8.10;

//SPDX-License-Identifier: MIT

contract Bank_of_AQ{

    address payable Bank_Owner;
    constructor() {
        Bank_Owner = payable(msg.sender);
    }

    modifier OnlyOwner(){
        require(msg.sender == Bank_Owner, "Caller is not Bank owner");
        _;
    }

// Only Bank owner can add money to contract using transact this is only gave to ppl as interest
    receive() external payable OnlyOwner{}  

// Only Bank owner can view contract Balance i.e. the total amount in Bank $$
    function getContractBalance() public view OnlyOwner returns(uint){
        return  address(this).balance;
    }
    
    mapping(address => uint) balances;
    mapping(address => uint) depositTimestamps;

//After deposit returns the balance 
    function Deposit() public payable returns(uint){
        balances[msg.sender] += msg.value;
        depositTimestamps[msg.sender] = block.timestamp;

        return CheckBalance();
    }

//Can withdraw the money you have inside the bank and returns the balance after withdrawing
    function withdraw(uint _amount) public payable returns(uint){
        require(_amount <= balances[msg.sender], "Can't withdraw more than you owe -_-");
        payable(msg.sender).transfer(_amount);
        balances[msg.sender] -= _amount;

        return CheckBalance();
    } 

//Checks the balance after adding the interest
    function CheckBalance() public returns(uint) {
        uint principal = balances[msg.sender];
        uint timeElapsed = block.timestamp - depositTimestamps[msg.sender]; //seconds
        balances[msg.sender] = principal + uint((principal * 7 * timeElapsed) / (10 * 365 * 24 * 60 * 60)); //simple interest of 0.7%  per year
        return balances[msg.sender];
    }
    
}
