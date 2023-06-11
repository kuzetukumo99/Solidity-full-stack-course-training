// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUSD = 50;

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts

        require(msg.value >= minimumUSD, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // https://api

    } 

    //イーサリアムの価格を米ドルで取得するための関数
    function getPrice() public {
    // ABI
    // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
    //AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getVersion() public view returns (uint256) {
        //AggregatorV3Interface型の変数priceFeedを作成
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    //価格を換算する関数
    function getConversionRate() public {}

    //function withdraw() {}
}