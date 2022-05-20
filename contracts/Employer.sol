pragma solidity ^0.8.4;

contract Employer {
    // address[] employers;

    string employerName;
    address employerAddress;
    address[] employees;
    address[] employers;
    mapping(address => string) mapOfEmployers;

    constructor(string memory _employerName, address _employerAddress) {
        employerName = _employerName;
        employerAddress = _employerAddress;
        mapOfEmployers[employerAddress] = employerName;
        employers.push(employerAddress);
    }

    function addEmployee(address toAdd) public {
        employees.push(toAdd);
    }
}
