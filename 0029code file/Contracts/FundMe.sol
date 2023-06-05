// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FundMe {

    uint256 public minimumUSD = 50;

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts

        require(msg.value >= minimumUSD, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // https://api

    } 

    //function withdraw() {}
}