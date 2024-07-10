
# MyToken Smart Contract

MyToken is a simple Ethereum smart contract that demonstrates basic functionalities such as depositing, withdrawing, and transferring tokens, with additional constraints on transaction amounts.

## Contract Details

- **Total Supply**: Tracks the total supply of tokens.
- **Max Transaction**: Maximum amount that can be withdrawn in a single transaction.
- **Owner**: The address of the contract owner (the one who deployed the contract).
- **Balance**: A mapping to track the balance of each address.

## Functions

### deposit

```solidity
function deposit(address _address, uint _number) public
```

Deposits a specified number of tokens to a given address.

- `_address`: The address to which tokens will be deposited.
- `_number`: The number of tokens to deposit. Must be greater than 0.

### withdraw

```solidity
function withdraw(address _address, uint _number) public
```

Withdraws a specified number of tokens from a given address.

- `_address`: The address from which tokens will be withdrawn.
- `_number`: The number of tokens to withdraw. Must not exceed the balance of the address and must not exceed the maximum transaction limit.

### transfer

```solidity
function transfer(address _to, uint _amount) public
```

Transfers a specified number of tokens from the caller's address to another address.

- `_to`: The address to which tokens will be transferred.
- `_amount`: The number of tokens to transfer. Must be greater than 0 and must not exceed the caller's balance.

### changeMaxTransaction

```solidity
function changeMaxTransaction(uint _newMax) public onlyOwner
```

Changes the maximum transaction limit. Can only be called by the contract owner.

- `_newMax`: The new maximum transaction limit.

## Modifiers

### onlyOwner

Ensures that a function can only be called by the contract owner.

## Error Handling

The contract uses `require()`, `assert()`, and `revert()` statements for error handling:

- `require()`: Checks for conditions that must be met. If not, the transaction is reverted with an error message.
- `revert()`: Reverts the transaction with a specific error message.
- `assert()`: Ensures certain conditions are true. Used to check for conditions that should never be false.

## Usage

1. **Deploy the Contract**: Deploy the contract to an Ethereum network using your preferred development environment (e.g., Remix, Truffle).
2. **Interact with the Contract**: Use the functions provided to deposit, withdraw, transfer tokens, and change the maximum transaction limit.

