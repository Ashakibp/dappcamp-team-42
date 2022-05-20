/*

interface
    -Employer
        -getSalary

constructor
    -name
    -employee address
    -employer address
    -have a require statement that checks the msg.sender is inside of the employeers array in Employer
    -pool schedule

global variables
    -name
    -employee address
    -employer address

functions
    -getSalary
    -withdrawl
    -getBalance



*/
pragma solidity ^0.8.0;

interface Employer {
    function getSalary(address employee) external view returns (uint256);

    // function checkEmployeeStatus(address employee)
    //     external
    //     view
    //     returns (uint8);

    function updateEmployeeStatus(address employee) external view;
}

interface Pool {
    function getBalance() external view returns (uint256);

    function withdraw(uint256 _amount) external;
}

contract Employee {
    address employeeAddress;
    address employerAddress;
    string name;
    address employerSmartContractAddress =
        0x91c6B8b3B118d42A9a558FF5FdC29447E02f51Ae; //dummy
    address poolSmartContractAddress =
        0x91c6B8b3B118d42A9a558FF5FdC29447E02f51Ae; //dummy

    constructor(
        string memory _name,
        address _employee,
        address _employer
    ) {
        name = _name;
        employeeAddress = _employee;
        employerAddress = _employer;
        Employer(employerSmartContractAddress).updateEmployeeStatus(_employee);
    }

    function getSalary() public view returns (uint256) {
        return
            Employer(employerSmartContractAddress).getSalary(employeeAddress);
    }

    function getBalance(address _employee) public view returns (uint256) {
        // Returns balance by calling Pool getBalance func
        return Pool(poolSmartContractAddress).getBalance();
    }

    function withdraw(uint256 _amount) public view {
        // Call withdraw function in Pool
    }
}

/*

interface

constructor
    -employee address
    -employer address
    -monthly amount

global variables
    -balance
    -employee addresss
    -employer address
    -monthly amount

functions
    -withdraw
    -calculate max withdraw
    -deposit
    -getBalance



*/
