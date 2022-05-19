pragma solidity ^0.8.4;

import "./Paid.sol";

contract Unlock {
    //who can withdraw
    //how much is unlocked
    address employeeId;
    uint256 monthlyAmount;

    constructor(address _employeeId, uint256 _monthlyAmount) public {
        employeeId = _employeeId;
        monthlyAmount = _monthlyAmount;
    }
}
