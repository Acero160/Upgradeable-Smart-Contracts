// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {UUPSContract1} from "../src/UpgradeableContract1.sol";

contract UpgradeContracts is Script {

    function upgradeContract(address proxyAddress, address newContract) public returns(address) {
        
        UUPSContract1 proxy = UUPSContract1(proxyAddress);
        proxy.upgradeToAndCall(address(newContract), "");
        return address(proxy);
    }
}