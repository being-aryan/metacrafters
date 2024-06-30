// SPDX-License-Identifier: MIT

/*
Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
*/
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable(msg.sender) {
   
    struct store {
        uint256 id;
        string name;
        uint256 price;
    }

    store[] public Store; 

    constructor() ERC20("Degen", "DKN") {
        Store.push(store(1, "grenade", 10));
        Store.push(store(2, "landmine", 20));
        Store.push(store(3, "pistol", 50));
    }

    modifier check(uint256 amount){
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _;
    }

    function decimals() override public pure returns (uint8){
        return 0;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

  
    function transferTokens(address to, uint256 amount) public check(amount) {
        _transfer(msg.sender, to, amount);
    }   

    function burnTokens(uint256 amount) public check(amount) {
        _burn(msg.sender, amount);
    }

    function checkTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function redeemTokens(uint256 itemId) public {
        require(itemId < Store.length, "Invalid item ID");

        store storage item = Store[itemId-1];
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance");

        _burn(msg.sender, item.price);
    }
   
}
