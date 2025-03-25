// filepath: c:\Users\shamm\Documents\SEM 4\MINOR- Blockchain Advanced\voting-project\hardhat.config.js
require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.0",
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
};