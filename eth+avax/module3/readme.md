# MyToken Smart Contract

`MyToken` is a simple ERC20-like smart contract implementing basic functionalities such as minting, transferring, and burning tokens. The contract includes restrictions to ensure only the owner can mint tokens, while any user can transfer or burn their tokens.

## Contract Overview

### State Variables

- `string public name`: The name of the token (e.g., "myToken").
- `string public symbol`: The symbol of the token (e.g., "MTKN").
- `address public owner`: The address of the contract owner.
- `uint public totalSupply`: The total supply of tokens in circulation.

### Mappings

- `mapping(address => uint) public balanceOf`: Keeps track of the balance of tokens for each address.

### Constructor

- Sets the name and symbol of our token we created.

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
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract myToken is ERC20, Ownable {

// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn tokens

    event TokensBurned(address indexed user, uint amount);
    event TokensMinted(address indexed user, uint amount);

    constructor() ERC20("myToken", "MTKN") Ownable(msg.sender) {
        _mint(msg.sender,  1000); 
        
    }

    function mintTokens(address to, uint amount) external onlyOwner {
        _mint(to, amount);
        emit TokensMinted(msg.sender, amount);
    }

    function burnTokens(uint amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }


    function transferTo(address to, uint amount) external {
        transfer(to, amount);  
    }
}
```
### License
[MIT License](../LICENSE)
