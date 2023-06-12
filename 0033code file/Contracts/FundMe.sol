// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumUsd = 50 * 1e18; //msg.valueは1e18を掛けられた桁数値が返ってくるので、msg.valueと桁数を合わせる。

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts

        require(getConversionRate(msg.value) >= minimumUsd, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // https://api
        // 18 decimals

    } 

    //イーサリアムの価格を米ドルで取得するための関数
    function getPrice() public view returns(uint256) {
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
        // AggregatorV3Interfaceという型のpriceFeedという変数を作成し、それに右辺のAggregatorV3Interface(対話先のアドレス)の値を代入する
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000.00000000
        return uint256(answer * 1e10);//msg.valueと桁数を合わせ、かつint256をタイプキャストしてuint256に換算する
    }

    function getVersion() public view returns (uint256) {
        //AggregatorV3Interface型の変数priceFeedを作成
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    //価格を換算する関数
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        // 3000_000000000000000000 ETH / USD price
        // 1_000000000000000000 ETH
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
        // 2999.999999999999999999　計算機で膨大な桁数の計算させると、仕様によっては左の値のように値が変わってしまう
    }

    //function withdraw() {}
}