// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";ライブラリかにより不要
import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;//ライブラリを利用する

    uint256 public minimumUsd = 50 * 1e18; //msg.valueは1e18を掛けられた桁数値が返ってくるので、msg.valueと桁数を合わせる。

    address[] public funders;//資金提供者を記録するための配列型の変数

    mapping(address => uint256) public addressToAmountFunded;//資金提供者のアドレスと送金額を紐つけ、アドレスから送金額を得る変数

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts
        //msg.value.getConversionRate();getConversionRate(msg.value)と同じ意味らしい
        //getConversionRate(msg.value);msg.value.getConversionRate()と同じ意味

        require(msg.value.getConversionRate() >= minimumUsd, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // https://api
        // 18 decimals
        funders.push(msg.sender);//requireを満たしたら、そのアドレスをfunderに追加していく
        addressToAmountFunded[msg.sender] = msg.value;//msg.senderを入れると、それに対応するmsg.valueが出力される

    } 

    function withdraw() public {
        // For loop
        // 配列[a, b, c, d] この場合ループさせるインデックスは0, 1, 2, 3
        //for(/* starting index, ending index, step amount*/)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            //code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        // actually withdraw the funds

    }
}