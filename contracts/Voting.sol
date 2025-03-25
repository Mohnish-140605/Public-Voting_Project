// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

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
    event VoterAdded(address indexed voter);

    constructor() {
        _addCandidates();
    }

    function _addCandidates() private {
        string[33] memory candidateNames = [
            "Narendra Modi", "Rahul Gandhi", "Amit Shah", "Yogi Adityanath", "Arvind Kejriwal",
            "Mamata Banerjee", "Sharad Pawar", "Uddhav Thackeray", "Nitish Kumar", "Tejashwi Yadav",
            "Akhilesh Yadav", "Mayawati", "Chandrababu Naidu", "Jagan Mohan Reddy", "K. Chandrashekar Rao",
            "Sonia Gandhi", "Pinarayi Vijayan", "MK Stalin", "Devendra Fadnavis", "Hemant Soren",
            "Biplab Kumar Deb", "Bhupesh Baghel", "Manohar Lal Khattar", "Basavaraj Bommai", "Ashok Gehlot",
            "Sachin Pilot", "Naveen Patnaik", "Vasundhara Raje", "Sukhbir Singh Badal", "Harsimrat Kaur Badal",
            "Jitin Prasada", "Jyotiraditya Scindia", "Rajnath Singh"
        ];

        for (uint i = 0; i < candidateNames.length; i++) {
            candidatesCount++;
            candidates[candidatesCount] = Candidate(candidatesCount, candidateNames[i], 0);
        }
    }

    function addVoter(address _voter) public {
        require(!registeredVoters[_voter], "Voter already added.");
        registeredVoters[_voter] = true;
        voterList.push(_voter);

        console.log("Added Voter:", _voter);

        emit VoterAdded(_voter);
    }

    function vote(uint _candidateId) public {
        require(registeredVoters[msg.sender], "You are not a registered voter.");
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;

        console.log("Voter:", msg.sender);
        console.log("Voted for Candidate ID:", _candidateId);
        console.log("Total Votes for Candidate:", candidates[_candidateId].voteCount);

        emit Voted(msg.sender, _candidateId);
    }

    function getVoterCount() public view returns (uint) {
        return voterList.length;
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
        return (candidates[winnerId].name, candidates[winnerId].voteCount);
    }
}
