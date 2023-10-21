// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Importing Hats Protocol interface
import "@HatsProtocol/HatsInterface.sol";

// Interface for RefereeManager
interface IRefereeManager {
    // Events
    event RefereeAdded(address indexed referee);
    event RefereeRemoved(address indexed referee);
    event YellowCardIssued(address indexed grantShip);
    event RedCardIssued(address indexed grantShip);

    // Add a new Referee
    function addReferee(address referee) external;

    // Remove an existing Referee
    function removeReferee(address referee) external;

    // Issue a yellow card to a Grant Ship
    function issueYellowCard(address grantShip) external;

    // Issue a red card to a Grant Ship
    function issueRedCard(address grantShip) external;

    // Function to list all active Referees
    function getActiveReferees() external view returns (address[] memory);
}
