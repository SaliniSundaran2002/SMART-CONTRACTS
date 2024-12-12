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
   function getBooks(uint index) public view   returns(string memory, uint){
        require(index < books.length ,"No books added");
        Book memory book = books[index];
        return (book.title, book.price);
   } 


}