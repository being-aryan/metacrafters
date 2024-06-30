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

## Error Handling

- **`require()`**:
  - Validates input conditions. If the condition fails, it reverts the transaction and provides an error message.
  
- **`revert()`**:
  - Explicitly stops execution and reverts any state changes if certain conditions are not met, with a custom error message.
  
- **`assert()`**:
  - Used for internal checks that should never fail. If it fails, it indicates a critical issue in the contract logic.

## Usage

To use this contract, deploy it on a compatible Ethereum network and call the `setElectricityBill` function with the appropriate parameters:

```solidity
setElectricityBill(150, true);

