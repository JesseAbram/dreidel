pragma solidity ^0.5.1;
import './ERC20.sol';

contract dreidel {
    
    address owner; 
    address winHalf;
    address winAll;
    uint spinResult;
    uint anti = 2; 
   
    ExampleToken public token;

    constructor (ExampleToken _token) public {
        token = _token;
    }
    
    function play() external returns (uint) {
      token.transferFrom(msg.sender, address(this), anti);
      spinResult = result();
        if (spinResult == 0) {
            token.transfer(msg.sender, token.balanceOf(address(this)));
        
      }
        if (spinResult == 1) {
            token.transfer(msg.sender, (token.balanceOf(address(this))/2));
      }
        if (spinResult == 2) {
            token.transferFrom(msg.sender, address(this), anti);
      }
    }
    
    function result() private view returns (uint) {
        return uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%3);

    }
    function getSpin() public view returns (uint) {
        return spinResult;
    }
    
}