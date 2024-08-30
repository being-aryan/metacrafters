# DegenToken Smart Contract

`DegenToken` is a custom ERC20 token for an in-game economy, allowing users to mint, transfer, redeem, and burn tokens.

## Overview

- **Token Name**: Degen
- **Token Symbol**: DKN
- **Decimals**: 0 (whole tokens only)

## Features

1. **Minting Tokens**: Only the owner can mint new tokens to reward players.
2. **Transferring Tokens**: Players can transfer tokens to other players.
3. **Redeeming Tokens**: Players can redeem tokens for in-game items.
4. **Checking Balance**: Players can check their token balance at any time.
5. **Burning Tokens**: Players can burn tokens they own if they are no longer needed.

## Contract Details

### State Variables

- `store[] public Store`: Array of available items for redemption.
- `mapping(address => uint256)`: Inherited from `ERC20` to track balances.

### Structs

- `store`: Represents an in-game item with `id`, `name`, and `price`.

### Modifiers

- `check(uint256 amount)`: Ensures that a transaction amount is greater than zero and that the sender has enough balance.

## Functions

### `constructor()`

Initializes the token with the name "Degen" and symbol "DKN". Also adds predefined items to the in-game store:

- GOLD_COIN: 10 DKN
- SILVER_COIN: 20 DKN
- GEM: 50 DKN

### `mint(address to, uint256 amount)`

- **Description**: Mints new tokens and assigns them to a specified address.
- **Access**: `onlyOwner`
- **Parameters**:
  - `to`: Address to receive the tokens.
  - `amount`: Number of tokens to mint.

### `transferTokens(address to, uint256 amount)`

- **Description**: Transfers tokens from the caller to another address.
- **Parameters**:
  - `to`: Address of the recipient.
  - `amount`: Number of tokens to transfer.

### `burnTokens(uint256 amount)`

- **Description**: Burns a specified number of tokens from the caller's balance.
- **Parameters**:
  - `amount`: Number of tokens to burn.

### `checkTokenBalance(address account)`

- **Description**: Returns the token balance of a specified address.
- **Parameters**:
  - `account`: Address to check balance.
- **Returns**: Token balance of the account.

### `redeemTokens(uint256 itemId)`

- **Description**: Redeems tokens for an item in the in-game store.
- **Parameters**:
  - `itemId`: ID of the item to redeem.
- **Requirements**: Caller must have sufficient balance.

## Usage

- **Mint Tokens**: (Owner only)
  ```solidity
  mint(address_to, amount);
## License
[MIT License](../../LICENSE)

