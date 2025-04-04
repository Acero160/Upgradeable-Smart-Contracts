//SPDX-License-Identifier: MIT

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

pragma solidity ^0.8.20;


contract UUPSContract1 is  Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal value; //Storage [0]

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();

    }

    function initialize() initializer public {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version () external pure  returns (uint256) {
        return 1;
    }

    //Function that authorizes the upgrade
    function _authorizeUpgrade(address newImplementation) internal override  {}

    //Reserve storage just in case
    uint256[50] private __gap; 
}