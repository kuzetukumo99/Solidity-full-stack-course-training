// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {

    //uint256 public number;

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts
        //number = 5;//revertより前にあるので返ってこない
        require(msg.value > 1e18, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // tons of data here　ここにもし膨大なデータがあっても、revertされたらこのデータ部分のガス代は返ってくる。

        // What is reverting?
        // undo any action before and send remaining gas back
    } 

    //function withdraw() {}
}