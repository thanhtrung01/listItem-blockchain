pragma solidity ^0.6.0;

contract Ownable {
    address payable _owner;
    
    constructor() public {
        _owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(isOwner(), "Bạn không phải là chủ sở hữu");
        _;
    }
    
    function isOwner() public view returns(bool) {
        return(msg.sender == _owner);
    }
}