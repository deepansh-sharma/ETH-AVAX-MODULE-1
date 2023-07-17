// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18;

contract wallet{

    uint public totalAmount;
    address public owner;

    constructor(uint _totalAmount){
        totalAmount = _totalAmount;

        owner = msg.sender;
    }

    function transfer(uint amount, uint tax, address sendTo) public{
        uint amountTOBeDeducted = amount + tax;
        totalAmount -= amountTOBeDeducted;
        if(amount < tax){
            revert("tax should be less than amount to be transfer");
        }        
        require(amountTOBeDeducted < totalAmount,"amount + tax should less than current balance");  
        assert(owner != sendTo);       
    }

    function getamount() public view returns(uint){
        return totalAmount;
    }

}
