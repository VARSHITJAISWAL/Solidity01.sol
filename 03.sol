
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract secondContract {
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }

    constructor(string memory _secret) {
        owner = msg.sender;
    }
}

contract newContract is secondContract {
    string private secret;

    constructor(string memory _secret) secondContract(_secret) {
        secret = _secret;
    }

    function getSecret() public view onlyOwner returns (string memory) {
        return secret;
    }
}

contract selfContract is secondContract {
    address private secretvault;

    constructor(string memory _secret) secondContract(_secret) {
        newContract vault = new newContract(_secret);
        secretvault = address(vault);
    }

    function showString() public view onlyOwner returns (string memory) {
        return newContract(secretvault).getSecret();
    }
}
