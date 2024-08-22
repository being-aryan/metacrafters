# MyToken Smart Contract

`MyToken` is a simple ERC20-like smart contract implementing basic functionalities such as minting, transferring, and burning tokens. The contract includes restrictions to ensure only the owner can mint tokens, while any user can transfer or burn their tokens.

## Contract Overview

### State Variables

- `string public name`: The name of the token (e.g., "Brave").
- `string public symbol`: The symbol of the token (e.g., "$$").
- `address public owner`: The address of the contract owner.
- `uint public totalSupply`: The total supply of tokens in circulation.

### Mappings

- `mapping(address => uint) public balanceOf`: Keeps track of the balance of tokens for each address.

### Constructor

- Sets the contract deployer as the owner.

### Modifiers

- `onlyOwner`: Restricts function access to the owner of the contract.

## Functions

### `mint(address to, uint _value)`

- **Description**: Mints new tokens and assigns them to the specified address.
- **Parameters**:
  - `to`: Address to receive the minted tokens.
  - `_value`: Amount of tokens to mint.
- **Requirements**:
  - Only the contract owner can call this function.
- **Returns**: `bool` indicating success.

### `transfer(address to, uint _value)`

- **Description**: Transfers tokens from the caller's address to the specified address.
- **Parameters**:
  - `to`: Address to receive the tokens.
  - `_value`: Amount of tokens to transfer.
- **Requirements**:
  - Caller must have a sufficient balance.
- **Returns**: `bool` indicating success.

### `burn(uint _value)`

- **Description**: Burns the specified amount of tokens from the caller's balance, reducing the total supply.
- **Parameters**:
  - `_value`: Amount of tokens to burn.
- **Requirements**:
  - Caller must have a sufficient balance.
- **Returns**: `bool` indicating success.

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.,MyToken.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier:MIT

/*
REQUIREMENTS
1.Only contract owner should be able to mint tokens
2.Any user can transfer tokens
3.Any user can burn tokens
*/

pragma solidity ^0.8.20; 

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract MyToken {
    string public name = "Brave";
    string public symbol = "$$";
    address public owner;
     uint public totalSupply;

      constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public balanceOf;
    
    modifier onlyOwner() {
        require(msg.sender == owner, "owner is not caller");
        _;
    }
    function mint(address to, uint _value) public onlyOwner returns (bool) {
        totalSupply += _value;
        balanceOf[to] += _value;
        return true;
    }
    function transfer(address to, uint _value) public returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[to] += _value;
        return true;
    }
    function burn(uint _value) public returns (bool) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        return true;
    }
}
```
### License
[MIT License](../LICENSE)
