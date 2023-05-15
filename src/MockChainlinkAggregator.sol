// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "chainlink-contracts/v0.8/interfaces/AggregatorV3Interface.sol";

contract MockChainlinkAggregator is AggregatorV3Interface {
    int private price;
    uint80 private roundId;

    constructor(int _price) {
        price = _price;
        roundId = 1;
    }

    function decimals() external pure override returns (uint8) {
        return 8;
    }

    function description() external pure override returns (string memory) {
        return "Mock Chainlink Aggregator";
    }

    function version() external pure override returns (uint) {
        return 1;
    }
}
