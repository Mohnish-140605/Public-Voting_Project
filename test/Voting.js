const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Voting", function () {
    let Voting, voting, owner, voters;

    beforeEach(async function () {
        Voting = await ethers.getContractFactory("Voting");
        [owner, ...voters] = await ethers.getSigners();
        voting = await Voting.deploy();
    });

    it("Should initialize with 33 candidates", async function () {
        for (let i = 1; i <= 33; i++) {
            const candidate = await voting.candidates(i);
            console.log(`Candidate ${i}:`, candidate.name);
            expect(candidate.name).to.be.a("string");
        }
    });

    it("Should allow adding voters", async function () {
        await voting.addVoter(voters[0].address);
        console.log("Added voter:", voters[0].address);
        expect(await voting.registeredVoters(voters[0].address)).to.be.true;
    });

    it("Should prevent adding the same voter twice", async function () {
        await voting.addVoter(voters[1].address);
        console.log("Trying to add voter again:", voters[1].address);
        await expect(voting.addVoter(voters[1].address)).to.be.revertedWith("Voter already added.");
    });

    it("Should allow a registered voter to vote", async function () {
        await voting.addVoter(voters[2].address);
        console.log("Added voter:", voters[2].address);

        await voting.connect(voters[2]).vote(5);
        console.log("Voter", voters[2].address, "voted for candidate ID 5");

        const candidate = await voting.candidates(5);
        console.log("Candidate 5 vote count:", candidate.voteCount.toString());

        expect(candidate.voteCount).to.equal(1);
    });

    it("Should prevent unregistered voters from voting", async function () {
        await expect(voting.connect(voters[3]).vote(1)).to.be.revertedWith("You are not a registered voter.");
    });

    it("Should prevent double voting", async function () {
        await voting.addVoter(voters[4].address);
        await voting.connect(voters[4]).vote(2);
        await expect(voting.connect(voters[4]).vote(2)).to.be.revertedWith("You have already voted.");
    });

    it("Should correctly determine winners", async function () {
        await voting.addVoter(voters[5].address);
        await voting.connect(voters[5]).vote(3);
        const [winnerName, winnerVoteCount] = await voting.announceWinner();
        expect(winnerName).to.equal("Amit Shah");
        expect(winnerVoteCount).to.equal(1);
    });

    it("Should handle multiple voters correctly", async function () {
        const voterCount = Math.min(20, voters.length); 

        for (let i = 0; i < voterCount; i++) {
            await voting.addVoter(voters[i].address);
            await voting.connect(voters[i]).vote((i % 33) + 1);
        }

        const registeredVoterCount = await voting.getVoterCount();
        expect(registeredVoterCount).to.equal(voterCount);
    });
});
