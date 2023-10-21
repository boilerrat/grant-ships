// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Importing Allo Protocol interface
import "@AlloProtocol/AlloInterface.sol";

// Interface for GrantShipManager
interface IGrantShipManager {
    // Events
    event GrantShipRegistered(address indexed grantShip);
    event FundAllocated(address indexed grantShip, uint256 amount);
    
    // Register a new Grant Ship
    function registerGrantShip(address grantShip) external;

    // Allocate funds to a Grant Ship
    function allocateFunds(address grantShip, uint256 amount) external;

    // Function to get total allocated funds for a Grant Ship
    function getTotalAllocatedFunds(address grantShip) external view returns (uint256);

    // Function to list all registered Grant Ships
    function getRegisteredGrantShips() external view returns (address[] memory);
}
