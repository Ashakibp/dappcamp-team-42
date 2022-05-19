pragma solidity ^0.8.4;

contract Employer {
    // address[] employers;

    string employerName;
    address employerAddress;
    address[] employees;

    constructor(string memory _employerName, address _employerAddress) {
        employerName = _employerName;
        employerAddress = _employerAddress;
    }

    function addEmployee(address toAdd) public {
        employees.push(toAdd);
    }
}
