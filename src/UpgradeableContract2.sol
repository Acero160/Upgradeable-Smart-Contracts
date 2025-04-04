//SPDX-License-Identifier: MIT

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

pragma solidity ^0.8.20;


contract UUPSContract2 is  Initializable, OwnableUpgradeable, UUPSUpgradeable {
    
    uint256 internal value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();

    }

    function initialize() initializer public {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function setValue (uint256 _value) external {
        value = _value;
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version () external pure  returns (uint256) {
        return 2;
    }

    //Function that authorizes the upgrade
    function _authorizeUpgrade(address newImplementation) internal override {}
}