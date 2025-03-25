const hre = require("hardhat");

async function main() {
    const Voting = await hre.ethers.getContractFactory("Voting");
    const voting = await Voting.deploy();
    
    await voting.waitForDeployment();
    
    console.log("✅ Voting contract deployed!");
    console.log("Contract Address:", voting.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
