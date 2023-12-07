// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";


contract SbtToken is ERC1155 {
    address owner;

    constructor() ERC20("Aliflex", "AFX"){
        owner = msg.sender;
    }

    //Token cannot be transferred once minted
    
   function transferFrom(address from, address to, uint256 value) public virtual override returns (bool) {
        // address spender = _msgSender();
        // _spendAllowance(from, spender, value);
        // _transfer(from, to, value);
        return false;
    }

      function transfer(address to, uint256 value) public virtual override returns (bool) {
        // address owner = _msgSender();
        // _transfer(owner, to, value);
        return false;
    }

}

