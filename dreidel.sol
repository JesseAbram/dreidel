pragma solidity ^0.5.1;

contract dreidel {
    
    address owner; 
    address winHalf;
    address winAll;
   
    
    modifier IsOwner()  {
        require(msg.sender == owner);
        _;
    }
    
    constructor () public {
        owner = msg.sender;
    }
    function () external payable {
        
    }
    
    
    function Winhalf (address _winHalf) IsOwner public {
        winHalf = _winHalf;
    }
    
    function WithdrawHalf() public {
        require(msg.sender == winHalf);
        winHalf = 0x0000000000000000000000000000000000000000;
        uint balance = address(this).balance /2;
        msg.sender.transfer(balance);
    }
    
     function Winall (address _winAll) IsOwner public {
        winAll = _winAll;
    }
    
    function WithdrawAll() public {
        require(msg.sender == winAll);
        winAll = 0x0000000000000000000000000000000000000000;
        uint balance = address(this).balance;
        msg.sender.transfer(balance);
    }
    
}