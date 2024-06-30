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
