// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "openzeppelin-contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/utils/math/SafeMath.sol";
import "chainlink-contracts/v0.8/interfaces/AggregatorV3Interface.sol";

contract NGNStablecoin is ERC20 {
    using SafeMath for uint256;

    address public admin;
    IERC20 public collateralToken;
    AggregatorV3Interface public priceFeed;

    constructor(
        address _collateralToken,
        address _pricefeed
    ) ERC20("Nigeria Coin", "NGNC") {}
}
