// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol"; 

contract Voting {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public registeredVoters;
    mapping(address => bool) public hasVoted;
    address[] public voterList;
    uint public candidatesCount;

    event Voted(address indexed voter, uint indexed candidateId);

    constructor() {
        addCandidate("Alice");
        addCandidate("Bob");
        addCandidate("Charlie");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function addVoter(address _voter) public {
        require(!registeredVoters[_voter], "Voter already added.");
        registeredVoters[_voter] = true;
        voterList.push(_voter);
    }

    function vote(uint _candidateId) public {
        require(registeredVoters[msg.sender], "You are not a registered voter.");
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        // Debugging line
        console.log("Voter:", msg.sender, "voted for candidate ID:", _candidateId);

        emit Voted(msg.sender, _candidateId);
    }

    function announceWinner() public view returns (string memory winnerName, uint winnerVoteCount) {
        uint maxVotes = 0;
        uint winnerId = 0;
        for (uint i = 1; i <= candidatesCount; i++) {
            if (candidates[i].voteCount > maxVotes) {
                maxVotes = candidates[i].voteCount;
                winnerId = i;
            }
        }
        winnerName = candidates[winnerId].name;
        winnerVoteCount = candidates[winnerId].voteCount;
    }
}
