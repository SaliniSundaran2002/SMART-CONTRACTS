// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBook{
    string public  title;
    uint16 public  price;

    function getBookDetails() public  view returns (string memory, uint16){
        return (title,price);

    }
    function setBook(string memory _title, uint16 _price) public {
        title = _title;
        price = _price;

    }
}