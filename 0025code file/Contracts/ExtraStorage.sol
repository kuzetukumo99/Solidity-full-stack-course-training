// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";//別ファイルをインポートする。コードの直張りと同じ

//継承。ExtraStorageをSimpleStorageの子コントラクトとする。
contract ExtraStorage is SimpleStorage {
    // + 5
    // override
    // virtual override
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}
