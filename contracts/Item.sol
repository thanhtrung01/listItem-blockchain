pragma solidity ^0.6.0;

import "./ItemManager.sol";

contract Item {
    uint public priceInWei;
    uint public pricePaid;
    uint public index;
    ItemManager parentContract;
    
    constructor(ItemManager _parentContract, uint _priceInWei, uint _indedx) public {
        priceInWei = _priceInWei;
        index = _indedx;
        parentContract = _parentContract;
    }
    
    receive() external payable {
        require(pricePaid ==0, "Mục được trả rồi!");
        require(priceInWei == msg.value, "Chỉ thanh toán đầy đủ cho phép");
        pricePaid+= msg.value;
        (bool success,) = address(parentContract).call.value(msg.value)(abi.encodeWithSignature("triggerPayment(uint256)",index));
        require(success,"The transaction wasn't successfull, cancelling");
    }
    
    fallback() external {
        
    }
}