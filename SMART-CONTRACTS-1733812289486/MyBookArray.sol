// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MyBookArray{
    struct Book{
        string title;
        uint price;
    }

    Book[] public  books;

   function addBooks( string memory _title, uint _price) public {
    books.push(Book(_title,_price));
   }


}