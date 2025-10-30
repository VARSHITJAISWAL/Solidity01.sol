
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract hotelRoom{
    enum statuses {
        vacant,occupied
    }
    statuses public currentStatus;


    event occupy(address _occupent,uint _value);


    address payable public  owner;
    constructor (){
        owner =payable (msg.sender);
        currentStatus=statuses.vacant;
    }
    modifier onlyWhileVacant{
        require(currentStatus==statuses.vacant,"Room is not vacant");
        _;
    }
    modifier cost(uint _amount){
        require(msg.value>=_amount,"Not enough ether");
    _;
    }
    function book()public payable onlyWhileVacant cost(3 ether){
        currentStatus=statuses.occupied;

        (bool sent , bytes memory data)=owner.call{value:msg.value}("");

        emit occupy(msg.sender  , msg.value);
    }
}

