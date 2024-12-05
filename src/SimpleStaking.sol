// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SimpleStaking {
    mapping(address => uint256) public balances;

    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "You need to stake some ETH!");
        balances[msg.sender] += msg.value; // Update user's balance
    }

    // Withdraw function with reentrancy protection
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        // Update balance before transferring to prevent reentrancy
        balances[msg.sender] -= amount;

        // Transfer ETH back to the user
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    // Check contract's balance
    function contractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
