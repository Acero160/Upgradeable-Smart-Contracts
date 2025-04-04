# 🚀 Upgradeable Smart Contract

## 🧐 What is an Upgradeable Smart Contract?
An **Upgradeable Smart Contract** allows modifications and enhancements without changing its deployed address or losing stored data. This is achieved using a **proxy pattern**, where a proxy contract remains constant while delegating execution to an upgradable implementation contract. The **UUPS (Universal Upgradeable Proxy Standard)** is a lightweight and efficient approach for managing these upgrades.

### 🔹 Why Use Upgradeable Contracts?
- **Avoid redeploying contracts** when adding new features.
- **Preserve contract state and user balances** between versions.
- **Enhance security and fix vulnerabilities** after deployment.
- **Reduce gas costs** compared to traditional proxy patterns.

## 📌 Project Overview
This repository contains an **Upgradeable Smart Contract** using **UUPS**, built with OpenZeppelin's upgradeable contracts. The project showcases best practices for creating **secure and upgradable** smart contracts, allowing for future enhancements without losing stored data.


## 📜 Smart Contracts
### 🔹 UUPSContract1 (v1)
- Implements **UUPS upgradeability**.
- Stores a single `value` variable.
- Includes a `getValue()` function to retrieve stored data.
- Uses a simple `version()` function returning `1`.

### 🔹 UUPSContract2 (v2 - Upgraded)
- Extends **UUPSContract1**.
- Introduces `setValue(uint256 _value)` function to allow updating the stored value.
- Updates the `version()` function to return `2`.

## 🚀 How to Deploy & Upgrade
### 1️⃣ Deploy the First Version
```solidity
npx hardhat run scripts/deployV1.js --network <your-network>
```

### 2️⃣ Upgrade to Version 2
```solidity
npx hardhat run scripts/upgradeV2.js --network <your-network>
```

## 📂 Project Structure
```
├── contracts/
│   ├── UUPSContract1.sol  # First version
│   ├── UUPSContract2.sol  # Upgraded version
├── scripts/
│   ├── deployV1.js       # Deployment script for v1
│   ├── upgradeV2.js      # Upgrade script to v2
├── test/
│   ├── UUPS.test.js      # Unit tests
└── README.md             # Project documentation
```


