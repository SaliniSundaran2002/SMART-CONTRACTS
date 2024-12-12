// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBank{

    mapping (address=>uint) balanceLedger;
    address public admin;
    constructor(){
        admin = msg.sender;
    }
    modifier balanceCheck(uint amount) {
        require(balanceLedger[msg.sender] >= amount, "Insufficient Balance");
        _;
    }
    
    // function ethToWei(uint val) public pure returns (uint){
    //     return (val*1000000000000000000);
    // }

    function getBalance() public view returns(uint){
        return balanceLedger[msg.sender];
    }

    function deposit() public payable {
        balanceLedger[msg.sender] = balanceLedger[msg.sender]+ msg.value;
    }

    function withdraw(uint amount) public balanceCheck(amount) {
        // require(balanceLedger[msg.sender] >= amount, "Insufficient Balance");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - amount;
        payable (msg.sender).transfer(amount);
    }

    function transferTo(uint amount, address toAddress) public balanceCheck(amount) {
        // require(balanceLedger[msg.sender] >= amount, "Insufficient Balance");
        balanceLedger[msg.sender] = balanceLedger[msg.sender] - amount;
        payable (msg.sender).transfer(amount);
        balanceLedger[msg.sender] = balanceLedger[msg.sender] + amount;
        payable (toAddress).transfer(amount);

   }
}

// sender
// 0xdD870fA1b7C4700F2BD7f44238821C26f7392148

// to
// 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC