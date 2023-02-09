pragma solidity ^0.5.0;

contract Migration {
    uint public version;

    constructor() public {
        version = 1;
    }

    function setCompleted(uint _version) public {
        require(version < _version, "New version must be greater than current version.");
        version = _version;
    }
}
