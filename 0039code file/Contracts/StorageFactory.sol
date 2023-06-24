// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";//別ファイルをインポートする。コードの直張りと同じ

contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;//SimpleStorrageという型の変数simpleStorageを作成

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();//関数内でSimpleStorageコントラクトを作成して、変数simpleStorageに代入する
        //↑simpleStorageをメモリ変数として保存する

        simpleStorageArray.push(simpleStorage);//上で出来上がったsimpleStorageをsimpleStorageArrayに保存していく
    }

    //StorageFactoryから全てのSimpleStorage.solに対してstore関数を呼び出すことができるようにしたい。
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {//storage factory storeの略。
        //address
        //ABI - Application Binery Interface
        //SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];下に簡略化
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
        //simpleStorage.store(_simpleStorageNumber);上に簡略化
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        //SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];下に簡略化したのでコメントアウト
        return simpleStorageArray[_simpleStorageIndex].retrieve();
        //return simpleStorage.retrieve();//上に簡略化したのでコメントアウト
    }
}