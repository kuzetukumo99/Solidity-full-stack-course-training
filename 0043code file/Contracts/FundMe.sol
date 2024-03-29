// Get funds from users
// Withdraw funds
// Set a minimum funding values in USD

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";ライブラリかにより不要
import "./PriceConverter.sol";

// constant, immutable
// 794,953
// 775,363

error NotOwner();

contract FundMe {

    using PriceConverter for uint256;//ライブラリを利用する

    uint256 public constant MINIMUM_USD = 50 * 1e18; //msg.valueは1e18を掛けられた桁数値が返ってくるので、msg.valueと桁数を合わせる。constantの命名規則によりMINIMUM_USDとなる
    // 351 gas ~ constant
    // 2,451 gas ~ non-constant
    // 351*26000000000 = 9,126,000,000,000 wei = 0.000009126 ETH = 0.017 USD
    // 2451*26000000000 = 63,726,000,000,000 wei = 0.000063726 ETH = 0.12 USD

    address[] public funders;//資金提供者を記録するための配列型の変数

    mapping(address => uint256) public addressToAmountFunded;//資金提供者のアドレスと送金額を紐つけ、アドレスから送金額を得る変数


    address public i_owner;

    //function callMeRightAway() {} ２回分トランザクションが必要になるので、constructorを使う
    constructor () {
        i_owner = msg.sender;//コンストラクタでのmsg.senderは、このコントラクトをデプロイしている人になる
    }

    function fund() public payable {
        // Want to be able to set minimum amount in USD
        // 1. How do we send ETH to this contracts
        //msg.value.getConversionRate();getConversionRate(msg.value)と同じ意味らしい
        //getConversionRate(msg.value);msg.value.getConversionRate()と同じ意味

        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough"); // 1e18 = 1000000000000000000(wei) = 1(ETH)
        // https://api
        // 18 decimals
        funders.push(msg.sender);//requireを満たしたら、そのアドレスをfunderに追加していく
        addressToAmountFunded[msg.sender] = msg.value;//msg.senderを入れると、それに対応するmsg.valueが出力される

    } 

    function withdraw() public onlyOwner {

        //require(msg.sender == owner, "Sender is not owner!");//オーナーだけがこの関数を呼び出せるようにする。modifierを使うのでこれは不要となる

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

        //msg.sender = address
        //payable(msg.sender) = payable address
        //transer
        //payable(msg.sender).transfer(address(this).balance);//ガス代が2300を超えるとエラーになる
        //send
        //bool sendSuccess = payable(msg.sender).send(address(this).balance);//ガス代が2300を超えるとブール池が返ってくる
        //require(sendSuccess, "Send failed");
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
        revert();
    }

    modifier onlyOwner {
        //require(msg.sender == i_owner, NotOwner());
        if(msg.sender != i_owner)
            revert NotOwner(); //!=は等しくない場合を指す 
            _;//以降のコードを順番にこなす。
    }

    //What happens if someone send this contract ETH without calling the fund function

    receive() external payable {
        fund();
    }
    fallback() external payable {
        fund();
    }


}