// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/NGNStablecoin.sol";
import "openzeppelin-contracts/token/ERC20/IERC20.sol";
import "../src/MockChainlinkAggregator.sol";
import "../src/MockERC20.sol";
import "openzeppelin-contracts/utils/math/SafeMath.sol";

contract StablecoinTest is Test {
    using SafeMath for uint256;
    NGNStablecoin stablecoin;
    MockERC20 collateralToken;
    MockChainlinkAggregator mockPriceFeed;

    function setUp() public {
        collateralToken = new MockERC20("Mock Token", "MCK", 1e24);
        mockPriceFeed = new MockChainlinkAggregator(1e18);

        stablecoin = new NGNStablecoin(
            address(collateralToken),
            address(mockPriceFeed)
        );
    }

    function oneDollarOfCollateralMintsOneDollarWorthOfStableCoin() public {
        uint collateralAmount = 1e18;
        uint collateralPrice = stablecoin.getCollateralPrice();
        uint expectedStablecoinAmount = collateralAmount.mul(1e18).div(
            collateralPrice
        );

        collateralToken.approve(address(stablecoin), type(uint256).max); // Approve the SimpleStablecoin contract to spend the collateral tokens
        collateralToken.mint(msg.sender, expectedStablecoinAmount);
        uint256 initialStablecoinBalance = stablecoin.balanceOf(address(this));
        stablecoin.mint(expectedStablecoinAmount);
        uint256 finalStablecoinBalance = stablecoin.balanceOf(address(this));

        assertEq(
            finalStablecoinBalance.sub(initialStablecoinBalance),
            expectedStablecoinAmount,
            "Minted stablecoin amount does not match the expected amount"
        );
        ///////////////////
    }
}
