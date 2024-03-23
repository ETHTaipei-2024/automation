// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Automation is Ownable {
    event Requested(uint256 indexed id, string fhe);

    uint256 public requestId;

    mapping(uint256 => bool) public requestResult;

    address public callback;

    constructor() Ownable(msg.sender) {}

    modifier onlyCallback() {
        require(msg.sender == callback);
        _;
    }

    function request(string calldata _fhe) external returns (bool) {
        uint256 id;
        unchecked {
            id = ++requestId;
        }
        emit Requested(id, _fhe);
        return true;
    }

    function fulfill(uint256 _id, bool _result) external onlyCallback {
        requestResult[_id] = _result;
    }

    function setCallback(address _callback) public onlyOwner {
        callback = _callback;
    }
}
