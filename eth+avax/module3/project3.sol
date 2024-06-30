// SPDX-License-Identifier:MIT

/*
REQUIREMENTS
1.Only contract owner should be able to mint tokens
2.Any user can transfer tokens
3.Any user can burn tokens
*/

pragma solidity ^0.8.20; 

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
