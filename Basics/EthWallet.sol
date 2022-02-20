pragma solidity ^0.8.11;
// SPDX-License-Identifier: MIT

contract EthWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}                         // Used for transact  

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "You are not owner");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {  // gives the smart contracts
        return address(this).balance;                     // balance i.e. Wallet in this case
    }

}
