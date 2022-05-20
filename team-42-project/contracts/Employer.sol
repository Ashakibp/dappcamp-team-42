pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Employer is Ownable{
    string employerName;
    address employerAddress;
    address[] employees;
    mapping(address => uint256) salaries;


    constructor(string memory _employerName, address _employerAddress) {
        employerName = _employerName;
        employerAddress = _employerAddress;
    }

    function addEmployee(address toAdd, uint256 salary) public onlyOwner {
        //Check employee not in array
        //Check employee not alreardy enrolled.
        employees.push(toAdd);
        salaries[toAdd] = salary;
    }

    function updateSalary(address employee, uint256 salary) public onlyOwner {
        salaries[employee] = salary;
    }

    function getSalary(address employee) public view returns(uint256) {
        return salaries[employee];
    }

    function getEmployees() public view returns (address[] memory){
        return employees;
    }
}