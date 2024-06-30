# ErrorHandling Smart Contract

This Solidity smart contract demonstrates error handling using `require()`, `revert()`, and `assert()` statements. It manages the payment status of an electricity bill based on the number of units consumed.

## Contract Overview

### State Variables

- `uint public unit`: Stores the number of electricity units consumed.
- `bool public isBillPaid`: Indicates whether the electricity bill has been paid.

### Functions

#### `setElectricityBill(uint _unit, bool _isBillPaid)`

This function sets the number of electricity units and updates the payment status.

- **Parameters**:
  - `_unit`: The number of electricity units consumed.
  - `_isBillPaid`: A boolean indicating if the bill is paid.

- **Logic**:
  - **`require(_unit > 100, "Unit must be greater than 100")`**:
    - Ensures that the number of units is greater than 100.
    - If not, it reverts the transaction with the message "Unit must be greater than 100".
    
  - **`if (!_isBillPaid) revert("Kindly pay the electricity bill")`**:
    - Checks if the bill is unpaid.
    - If true, it reverts the transaction with the message "Kindly pay the electricity bill".
    
  - **`assert(_isBillPaid == true)`**:
    - Asserts that the bill is paid.
    - Used as a sanity check to confirm the expected condition.

  - Updates the `unit` and `isBillPaid` state variables if all checks pass.

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.,MyToken.sol). Copy and paste the following code into the file:

```solidity
// SPDX-License-Identifier: MIT

/*
REQUIREMENTS
Contract successfully uses require()
Contract successfully uses assert()
Contract successfully uses revert() statements
*/
pragma solidity ^0.8.20;

contract ErrorHandling {
    uint public unit;
    bool public isBillPaid;
//function to set Electricitybill with a require statement
    function setElectricityBill(uint _unit, bool _isBillPaid) public {
        require(_unit > 100, "Unit must be greater than 100");
// revert function is used 
        if (!_isBillPaid) {
            revert("Kindly pay the electricity bill");
        }
//assert function is used 
        assert(_isBillPaid == true);

        unit = _unit;
        isBillPaid = _isBillPaid;
    }
}
```
### License
[MIT License](../LICENSE)



