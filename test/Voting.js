const { expect } = require("chai");

describe("Voting", function () {
    let Voting;
    let voting;
    let owner;
    let addr1;

    beforeEach(async function () {
        Voting = await ethers.getContractFactory("Voting");
        [owner, addr1] = await ethers.getSigners();
        voting = await Voting.deploy();
        await voting.deployed();
    });

    it("Should initialize with three candidates", async function () {
        const candidate1 = await voting.candidates(1);
        const candidate2 = await voting.candidates(2);
        const candidate3 = await voting.candidates(3);
        expect(candidate1.name).to.equal("Alice");
        expect(candidate2.name).to.equal("Bob");
        expect(candidate3.name).to.equal("Charlie");
    });

    it("Should allow a voter to vote", async function () {
        await voting.connect(addr1).vote(1);
        const candidate1 = await voting.candidates(1);
        expect(candidate1.voteCount).to.equal(1);
    });

    it("Should not allow double voting", async function () {
        await voting.connect(addr1).vote(1);
        await expect(voting.connect(addr1).vote(1)).to.be.revertedWith("You have already voted.");
    });
});
