// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";//別ファイルをインポートする。コードの直張りと同じ

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;//SimpleStorageという型の変数simpleStorageを作成

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();//関数内でSimpleStorageコントラクトを作成して、変数simpleStorageに代入する
        //↑simpleStorageをメモリ変数として保存する

        simpleStorageArray.push(simpleStorage);//上で出来上がったsimpleStorageをsimpleStorageArrayに保存していく
    }
}