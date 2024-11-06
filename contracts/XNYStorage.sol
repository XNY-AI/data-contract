//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract XNYStorage{

    struct Meta {
        string c_type;
        string pub_k;
        string s_type;
        string bounty; 
    }

    Meta meta;
    address creator;
    mapping (uint256 => string) public data;
    uint256 d_ix;

    constructor(string memory _ctype,string memory _pubk,string memory _stype,string memory _bounty){
        meta.c_type = _ctype;
        meta.pub_k = _pubk;
        meta.s_type = _stype;
        meta.bounty = _bounty;
        creator = msg.sender;
        d_ix = 0;
    } 

    function getPubKey()external view returns(string memory){
        return meta.pub_k;
    }

    function sendStorage(string memory body)  public returns (uint256) {
        d_ix += 1;
        data[d_ix] = body;
        return d_ix;
    }

    receive() external payable {
    }
}