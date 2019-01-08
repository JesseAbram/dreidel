pragma solidity ^0.4.24;

contract dreidel {
    
    address owner; 
    address winHalf;
    address winAll;
    uint spinResult;
   
    
    modifier IsOwner()  {
        require(msg.sender == owner);
        _;
    }
    
    constructor () public {
        owner = msg.sender;
    }
    function () external payable {
        
    }
    
    function spin() external {
      spinResult = result();

    }
    
    function result() private view returns (uint) {
    return uint8(uint256(keccak256(block.timestamp, block.difficulty))%3);

    }
    function getSpin() public view returns (uint) {
        return spinResult;
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