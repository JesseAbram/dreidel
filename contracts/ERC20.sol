import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

pragma solidity ^0.5.8;

contract ExampleToken is ERC20, Ownable {
 
  string public name;
  string public symbol;
  uint public decimals;

  constructor(string memory _name, string memory _symbol, uint _decimals) public {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
  }

  function mint(address to, uint amount) public onlyOwner {
    _mint(to, amount);
  }
}