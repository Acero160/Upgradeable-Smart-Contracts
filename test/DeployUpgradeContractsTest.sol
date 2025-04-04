// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import {UUPSContract1} from "../src/UpgradeableContract1.sol";
import {DeployUUPSContracts} from "../script/DeployUUPSContracts.sol";
import {UpgradeContracts} from "../script/UpgradeContracts.sol";
import {UUPSContract2} from "../src/UpgradeableContract2.sol";

contract DeployUpgradeContractsTest is Test {
    DeployUUPSContracts public deployer;
    UpgradeContracts public upgradeContracts;

    address public proxy;

    function setUp() public {
        deployer = new DeployUUPSContracts();
        upgradeContracts = new UpgradeContracts();

        proxy = deployer.run(); // This proxy points to UUPSContract1.
    }

    function testSetValueContract1() public  {
        vm.expectRevert();
        UUPSContract2(proxy).setValue(10);
    }

    function testContract1() public  view {
        assertEq(1, UUPSContract1(proxy).version());
    }

    function testUpgrade() public {
        UUPSContract2 contract2 = new UUPSContract2();
        upgradeContracts.upgradeContract(proxy, address(contract2)); 
        
        assertEq(2, UUPSContract2(proxy).version());

        UUPSContract2(proxy).setValue(89);

        assertEq(89, UUPSContract2(proxy).getValue());
    }
}