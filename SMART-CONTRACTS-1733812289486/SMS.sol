// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

// Write a smart contract to represent a student management system. It should have the below features.
// Store Student data: name, sem, dept (can be CS, EC, ME), CGPA, roll no
// Student data should be arranged as a list
// Only staffadvisor can add or edit student details.
// Students have the option to edit their names.
// Edit option for other details is available only for staff advisor.
// Staff advisor can see the details of any student.

contract SMS{
    struct studentData{
        string name;
        string sem;
        string dept;
        uint256 CGPA;
        uint256 rollNo;
    }

    address staffAdvisor;

    modifier onlyStaffAdvisor{
        require(msg.sender == staffAdvisor,"Unauthorised acces");
        _;
    }

    constructor(){
        staffAdvisor =  msg.sender;
    }

    mapping (uint256 => studentData) public  studData;
    

    function setStudentDetails(uint256 _id, string memory _name, string memory _sem, string memory _dept, uint256 _CGPA, uint256 _rollNo) public onlyStaffAdvisor{
            studData[_id] = studentData(_name,_sem,_dept,_CGPA,_rollNo);
    }
}