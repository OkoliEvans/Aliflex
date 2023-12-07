
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";

contract AlifLex is ERC1155 {
    uint public meta = 1;
    uint public guardian = 2;
    mapping(uint id => bool) is_soulbound;
    // uint[] Ids;
    // mapping(ids => bool) is_soulbound_batch;

    constructor() ERC1155("https://ipfs.filebase.io/ipfs/QmRZK4W2QT7oEaZNRY4LtK4RmQcJ5S1sArJWASUHcXxUgi/{id}.json") {
        is_soulbound[meta] = true;
        is_soulbound[guardian] = false;
        _mint(msg.sender, meta, 1, ""); //soulbound
        _mint(msg.sender, guardian, 1, "");
    }

      /**
     * @dev See {IERC1155-safeTransferFrom}.
     */
    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes memory data) public override {
        address sender = _msgSender();
        if (from != sender && !isApprovedForAll(from, sender)) {
            revert ERC1155MissingApprovalForAll(sender, from);
        }
        if (is_soulbound[id] == false) {
            _safeTransferFrom(from, to, id, value, data);
        }
    }

    /**
     * @dev See {IERC1155-safeBatchTransferFrom: no transfer for soulbound token}.
     */
    function safeBatchTransferFrom(
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory values,
        bytes memory data
    ) public override {
        address sender = _msgSender();
        if (from != sender && !isApprovedForAll(from, sender)) {
            revert ERC1155MissingApprovalForAll(sender, from);
        }

        // if (is_soulbound_batch[ids] == false ) {
        //  _safeBatchTransferFrom(from, to, ids, values, data);
        // }
    }

}