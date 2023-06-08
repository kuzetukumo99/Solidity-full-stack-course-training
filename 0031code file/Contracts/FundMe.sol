// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

    interface AggregatorV3Interface {
    function decimals() external view returns (uint8);

    function description() external view returns (string memory);

    function version() external view returns (uint256);

    function getRoundData(
        uint80 _roundId
    ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
    }

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