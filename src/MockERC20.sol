// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(
        string memory name,
        string memory symbol,
        uint initalSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, initalSupply);
    }

    function mint(address to, uint amount) public {
        _mint(to, amount);
    }
}
