// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Importing Allo Protocol interface
import "@AlloProtocol/AlloInterface.sol";

// Interface for VotingManager
interface IVotingManager {
    // Events
    event NewVoteCreated(uint256 indexed voteId, address indexed grantShip);
    event VoteExecuted(uint256 indexed voteId, bool outcome);

    // Create a new vote
    function createVote(address grantShip, uint256 allocationAmount) external returns (uint256 voteId);

    // Execute a vote
    function executeVote(uint256 voteId) external;

    // Function to get the vote count for a Grant Ship
    function getVoteCountForGrantShip(address grantShip) external view returns (uint256);

    // Function to get the details of a vote
    function getVoteDetails(uint256 voteId) external view returns (address grantShip, uint256 allocationAmount, bool executed);
}
