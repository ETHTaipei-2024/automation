// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../contract/Automation.sol";

contract TestAutomation is Test {
    Automation private instance;

    event Requested(uint256 indexed id, string fhe);

    function setUp() external {
        instance = new Automation();
    }

    function test_request() external {
        string memory fhe = "foo bar";
        vm.expectEmit(true, true, true, true);
        emit Requested(1, fhe);
        instance.request(fhe);
    }
}
