# SimpleStaking

A simple staking smart contract written in Solidity that allows users to deposit and withdraw Ethereum (ETH). The contract tracks the staked balances of users and ensures secure deposits and withdrawals.

## Features
- **Deposit ETH**: Users can deposit ETH into the contract, and their staked balance is recorded.
- **Withdraw ETH**: Users can withdraw their staked balance at any time, provided the balance is sufficient.
- **Safe Withdrawals**: The contract prevents reentrancy attacks by updating balances before making external calls.

## Getting Started

### Prerequisites
- **Solidity**: The contract is written in Solidity and is compatible with version `^0.8.0`.
- **Foundry**: To test and deploy the contract, [Foundry](https://github.com/foundry-rs/foundry) is used as the testing framework.

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Alhanafy01/SimpleStaking.git
   cd SimpleStaking
