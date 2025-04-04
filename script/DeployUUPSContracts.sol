//SPDX-License-Identifier: MIT

import{Script} from "forge-std/Script.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {UUPSContract1} from "../src/UpgradeableContract1.sol";

pragma solidity ^0.8.20;



contract DeployUUPSContracts is Script {


    function run () external returns (address) {
        address proxy = deployUUPSContract();
        return proxy;
    }


    function deployUUPSContract () public returns (address) {

        //Deploy UUPSContract1
        vm.startBroadcast();
        UUPSContract1 uupsContract = new UUPSContract1();

        //Deploy UUPSContract2
        ERC1967Proxy proxy = new ERC1967Proxy(address(uupsContract), "");
        vm.stopBroadcast();

        return address(proxy);
    }
}
