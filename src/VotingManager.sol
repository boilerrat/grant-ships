// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Implementing the IVotingManager interface
contract VotingManager {
    enum VotingType { GrantShipElection, AllocationApproval }

    struct Vote {
        address voter;
        uint256 allocationId;
        uint256 weight;
        VotingType votingType;
        bool hasVoted;
    }

    mapping(uint256 => Vote) public votes;
    uint256 public nextVoteId;

    event VoteCast(uint256 indexed voteId, address indexed voter, uint256 indexed allocationId, uint256 weight, VotingType votingType);

    function castVote(uint256 allocationId, uint256 weight, VotingType votingType) external {
        require(weight > 0, "Vote weight must be greater than zero");

        Vote memory newVote = Vote({
            voter: msg.sender,
            allocationId: allocationId,
            weight: weight,
            votingType: votingType,
            hasVoted: true
        });

        votes[nextVoteId] = newVote;
        emit VoteCast(nextVoteId, msg.sender, allocationId, weight, votingType);

        nextVoteId++;
    }
}
