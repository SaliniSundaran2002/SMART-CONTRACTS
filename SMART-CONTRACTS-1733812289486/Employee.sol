// SPDX-License-Identifier: MIT
import "./Person.sol";
pragma solidity 0.8.28;

contract Employee is Person{

    uint empId;

    function setEmployee(string memory _name, uint _age,uint _empId) public{
        setPerson(_name, _age);
        empId = _empId;
    }

    function getDetails() public override view returns(string memory, uint){
        return (name,age);
        // super.getDetails();
    }
}