// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract SimpleStorage {
    
    uint256 favoriteNumber;// ０に初期化する。uint256 favoriteNumber == 0と等しい。
    //visibility(アクセス件) public:全員見れるようにする
    //favoriteNumberはグローバルスコープ
    //ストレージスロット0に保存される

    //構造体を作る。uint256, boolean, stringと同じ"型"を作った事になる。
    struct People {
        uint256 favoriteNumber;//インデックス0
        string name;//インデックス1

    }

    //uint256[] public favoriteNumbersList;
    People[] public people;
    //0: 2, Patrick, 1: 7, Jon

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    //view, pure
    function retrieve () public view returns(uint256) {
        return favoriteNumber;
    }

    //calldata, memory, storage 
    //文字列や配列、マッピング、構造体には保存場所を指定する必要があるので、memoryまたはcalldataが必要
    //関数内では、_name変数はどこにも保存されないことをSolidityが知っているので、storageは使えず、memoryとcalldataのみ指定できる
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        //people.push(People(_favoriteNumber, _name));　一つ目の方法
        //People memory newPerson = People(_favoriteNumber, _name);newPersonに保存する必要もないので削除し、右辺をコピーしておく。
        //people.push(newPerson);上の右辺をnewPersonと置き換えると下になる
        people.push(People(_favoriteNumber, _name));
    }

}