// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SimpleStaking.sol";

contract SimpleStakingTest is Test {
    SimpleStaking public staking;

    function setUp() public {
        staking = new SimpleStaking();
    }

    function testDeposit() public {
        // Simulate deposit
        uint256 depositAmount = 1 ether;
        // Send ETH to the staking contract
        staking.deposit{value: depositAmount}();

        // Assert the balance is updated correctly
        uint256 userBalance = staking.balances(address(this));
        assertEq(userBalance, depositAmount, "Balance mismatch!");
    }
    function testContractBalance() public {
    // Arrange: Set up a deposit amount
    uint256 depositAmount = 1 ether;

    // Act: Send ETH to the staking contract
    staking.deposit{value: depositAmount}();

    // Assert 1: Check the user's staked balance in the contract
    uint256 userStakedBalance = staking.balances(address(this));
    assertEq(userStakedBalance, depositAmount, "Staked balance mismatch!");

    // Assert 2: Check the contract's total ETH balance
    uint256 contractTotalBalance = address(staking).balance;
    assertEq(contractTotalBalance, depositAmount, "Contract balance mismatch!");
}
function testSuccessfulWithdrawal() public {
    // Arrange: Set up a deposit amount and deposit ETH
    uint256 depositAmount = 1 ether;
    staking.deposit{value: depositAmount}();

    // Act: Withdraw the same amount
    uint256 userBalanceBefore = staking.balances(address(this));
    uint256 contractBalanceBefore = address(staking).balance;

    staking.withdraw(depositAmount);

    // Assert: Verify the user's staked balance is updated
    uint256 userBalanceAfter = staking.balances(address(this));
    assertEq(userBalanceAfter, 0, "User balance should be zero after withdrawal");

    // Assert: Verify the contract's balance decreases
    uint256 contractBalanceAfter = address(staking).balance;
    assertEq(contractBalanceAfter, contractBalanceBefore - depositAmount, "Contract balance should decrease by the withdrawn amount");
}


}
