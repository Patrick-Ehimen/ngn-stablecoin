// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "openzeppelin-contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/token/ERC20/utils/SafeERC20.sol";
import "openzeppelin-contracts/utils/math/SafeMath.sol";
import "../src/MockERC20.sol";

contract MockERC20Test {
    using SafeERC20 for IERC20;
    using SafeMath for uint256;

    MockERC20 public token;

    function beforeEach() public {
        token = new MockERC20("Mock Token", "MTK", 1000);
    }

    function testInitialBalance() public view {
        uint256 balance = token.balanceOf(address(this));
        assert(balance == 0);
    }

    function testMint() public {
        uint256 amount = 100;
        token.mint(address(this), amount);
        uint256 balance = token.balanceOf(address(this));
        // assert(balance == amount);
    }

    function testTransfer() public {
        uint256 amount = 100;
        token.mint(address(this), amount);
        token.transfer(msg.sender, amount);
        uint256 balance = token.balanceOf(address(this));
        assert(balance == 0);
        balance = token.balanceOf(msg.sender);
        assert(balance == amount);
    }
}
