
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Varshit {
    mapping(uint => string) public data;
    mapping(uint => Book) public books;

    struct Book {
        string author;
        string tittle;
    }

    mapping(address => mapping(uint => Book)) public myBooks;

    constructor() {
        data[152] = "Shubham";
        data[155] = "Siddhant";
        data[172] = "Ujjwal";
        data[175] = "Varshit";
    }

    function addBook(uint _id, string memory _author, string memory _tittle) public {
        books[_id] = Book(_author, _tittle);
    }

    function addMyBook(uint _id, string memory _author, string memory _tittle) public {
        myBooks[msg.sender][_id] = Book(_author, _tittle);
    }
}
