
# 🗳️ Public Voting System (Solidity-based)

Welcome to the **Public Voting System**!  
This project implements a **Solidity-based Voting System smart contract** designed for **transparent and secure elections** on the **Ethereum blockchain**. Currently, it works on the local network and uses **Hardhat** as the development environment.

---

## 📖 Project Overview

The **Public Voting System** leverages blockchain technology to create a decentralized voting platform. The system ensures secure, transparent, and tamper-proof voting by utilizing the **Ethereum blockchain**.

Key Features:
- **Solidity-based smart contract** for conducting secure votes.
- **Local deployment**: Uses **Hardhat** for deploying the contract on a local Ethereum network.
- **Transparency**: The voting process is fully transparent, and all transactions are recorded on the blockchain.
- **Simple Voting Mechanism**: Users can vote for candidates, and the results are stored on the blockchain, making them immutable.

---

## 🔧 Technologies Used

- **Solidity**: Programming language for writing smart contracts on the Ethereum blockchain.
- **Ethereum Blockchain**: Decentralized platform for running the smart contract.
- **Hardhat**: Development environment for deploying and testing the smart contract locally.
- **JavaScript**: For scripting the deployment of the contract using Hardhat.
- **Node.js**: Used to run the development environment and manage dependencies.

---

## 🛠️ How to Run the Project

Follow these steps to set up and run the **Public Voting System** on your local machine:

### Prerequisites
- **Node.js** and **npm** installed on your machine.
- **Hardhat** installed for smart contract deployment.
- **MetaMask** or any Ethereum wallet for interacting with the contract (if you plan to test on a live network).

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Mohnish-140605/Public-Voting_Project.git
   cd Public-Voting_Project
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Compile the smart contract**:
   ```bash
   npx hardhat compile
   ```

4. **Deploy the contract** to the local Ethereum network:
   ```bash
   npx hardhat run scripts/deploy.js --network localhost
   ```

   This script will deploy the **Voting** smart contract to the local network, and you will see the contract address in the terminal.

5. **Interact with the contract**: After deployment, you can interact with the contract through Hardhat or integrate it into a front-end interface.

---

## 📂 Folder Structure

```
/Public-Voting_Project
├── /artifacts/        # Compiled contract files
├── /contracts/        # Solidity smart contract files
├── /scripts/          # Deployment scripts (e.g., deploy.js)
├── /test/             # Test files for smart contract
├── hardhat.config.js  # Hardhat configuration file
└── package.json       # Project dependencies and scripts
```

---

## ✨ Key Features

- **Smart Contract Voting**: The main functionality is a smart contract written in Solidity to handle voting logic.
- **Local Ethereum Network**: The contract is deployed on a local Ethereum network using Hardhat for testing and development.
- **Immutable Records**: Votes are recorded on the Ethereum blockchain, ensuring transparency and immutability.
- **Hardhat Deployment**: The smart contract is deployed using Hardhat's `deploy.js` script.

---

## 🧑‍💻 Contributors

This project was made possible by the following contributors:

- **[Mohnish G Naidu](https://github.com/Mohnish-140605)**  
- **[Shamitha Reddy N](https://github.com/Shamithabsc)**

---

## 📄 License

This project is licensed under the **MIT License**.  
Feel free to use, modify, and distribute it with proper attribution.

---

## 📢 How to Contribute

We welcome contributions to improve the project! Here’s how you can contribute:

1. **Fork the repository** to your GitHub account.
2. **Clone your fork** to your local machine:
   ```bash
   git clone https://github.com/your-username/Public-Voting_Project.git
   ```
3. **Create a new branch** for your feature or fix:
   ```bash
   git checkout -b feature/YourFeatureName
   ```
4. **Make your changes** and commit them:
   ```bash
   git add .
   git commit -m "Describe your changes"
   ```
5. **Push your changes** to your forked repository:
   ```bash
   git push origin feature/YourFeatureName
   ```
6. **Open a pull request** to merge your changes into the main repository.

---

> *"Building a more transparent and secure voting system for the future."* 🗳️💡

---

