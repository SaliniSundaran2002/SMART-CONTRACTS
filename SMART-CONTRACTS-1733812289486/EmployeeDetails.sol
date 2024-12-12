// SPDX-License-Identifier: MIT

// Create a smart contract to store an employee record which includes, name, department, designation, salary. Write unnecessary functions to set employee details, read employee details, pay the employee.


pragma solidity 0.8.28;

contract EmployeeDetails{
    string name;
    string department;
    string designation;
    uint16 salary;
    address owner = msg.sender;
    
    function getEmployees() public view returns (string memory,string memory, string memory, uint16, address){
        return (name, department, designation, salary, owner);
    }

    function setEmployees(string memory _name, string memory _department, string memory _designation, uint16 _salary) public {
        name = _name;
        department = _department;
        designation = _designation;
        salary = _salary;
    }

    function ethToWei(uint eval) public pure returns (uint){
        return (eval * 1000000000000000000);
    }

    function addSalary() public  payable{
        require(msg.value >= ethToWei(salary), "Insufficient salary");
        payable (owner).transfer(ethToWei(salary));
        uint bal = msg.value - ethToWei(salary);
        if(bal > 0){
            payable (msg.sender).transfer(ethToWei(bal));
        }
        // return "";
    }


    
}