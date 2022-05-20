pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Employer is Ownable {
    string employerName;
    address employerAddress;
    address[] employees;
    mapping(address => uint256) salaries;

    mapping(address => uint8) hasSignedUp;

    constructor(string memory _employerName, address _employerAddress) {
        employerName = _employerName;
        employerAddress = _employerAddress;
    }

    function addEmployee(address _toAdd, uint256 _salary) public onlyOwner {
        //Check employee not in array
        //Check employee not alreardy enrolled.
        require(hasSignedUp[_toAdd] == 0, "Employee has already enrolled");
        employees.push(_toAdd);
        salaries[_toAdd] = _salary;
        hasSignedUp[_toAdd] = 1;
    }

    function updateSalary(address _employee, uint256 _salary) public onlyOwner {
        salaries[_employee] = _salary;
    }

    function getSalary(address employee) public view returns (uint256) {
        return salaries[employee];
    }

    function getEmployees() public view returns (address[]) {
        return employees;
    }

    function updateEmployeeStatus(address _employeeAddress) public {
        hasSignedUp[_employeeAddress] = 2;
    }
}
