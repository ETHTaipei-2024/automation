// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {Automation} from "../contract/Automation.sol";

contract AutomationDeployment is Script {
    uint256 private deployerPrivateKey;
    Automation private automation;

    function setUp() external {
        deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    }

    function run() external {
        vm.createSelectFork("sepolia");
        vm.startBroadcast(deployerPrivateKey);
        automation = new Automation();
        vm.stopBroadcast();
    }
}
