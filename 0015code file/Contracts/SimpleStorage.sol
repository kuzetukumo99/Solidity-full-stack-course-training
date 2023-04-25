// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //0.8.18　ダブルスラッシュはコメント機能

contract SimpleStorage {
    
    uint256 public favoriteNumber;// ０に初期化する。uint256 favoriteNumber == 0と等しい。
    //visibility(アクセス件) public:全員見れるようにする
    //favoriteNumberはグローバルスコープ

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //function something() public{
    //    testVar = 6; //??
    //}

    //view, pure
    function retrieve () public view returns(uint256) {
        return favoriteNumber;
    }

}

//0xd9145CCE52D386f254917e481eB44e9943F39138