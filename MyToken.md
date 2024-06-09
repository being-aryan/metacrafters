# MyToken Smart Contract 

This Solidity program is a simple "MyToken Smart Contract" program that demonstrates the Data Types,Mapping in Solidity,Conditional Statements and functionality of minting and burning of tokens from users account.

## Contract Overview
The contract includes the following features:

1. Public variables to store token details (name, symbol, and total supply)

2. A mapping to store balances of addresses

3. A mint function to create new tokens and assign them to an address

4. A burn function to destroy tokens from an address with balance checks

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.,MyToken.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/
contract MyToken {
    // public variables here
    string public name = "brave" ;
    string public symbol="$$" ;
    uint public totalSupply=0 ;
    // mapping variable here
    mapping(address=>uint) public balances ;
    // mint function
    function mint(address sender, uint value) public {
        totalSupply += value;
        balances[sender] += value;
    }
    // burn function
    function burn(address sender, uint value) public {
        if(balances[sender]>= value){
        totalSupply -= value;
        balances[sender]-= value;
        }
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the functions. 

## Authors
aryan09


## License

MIT License

