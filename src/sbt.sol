// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";


contract SbtToken is ERC20 {
    address owner;

    constructor() ERC20("Aliflex", "AFX"){
        owner = msg.sender;
    }

    
    function _transfer(address from, address to, uint256 value) internal override(ERC20) {
        if (from == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        if (to == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        // _update(from, to, value);
    }

}


contract SBT {
   
}
