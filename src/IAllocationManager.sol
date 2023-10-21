// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Importing Allo Protocol and HyperCerts interfaces
import "@AlloProtocol/AlloInterface.sol";
import "@HyperCerts/HyperCertsInterface.sol";

// Interface for AllocationManager
interface IAllocationManager {
    // Events
    event FundsAllocated(address indexed grantShip, address indexed project, uint256 amount);
    event ImpactScoreUpdated(address indexed project, uint256 impactScore);

    // Allocate funds to a project
    function allocateFundsToProject(address grantShip, address project, uint256 amount) external;

    // Update impact score of a project
    function updateProjectImpactScore(address project, uint256 impactScore) external;

    // Function to get total allocated funds for a project
    function getTotalAllocatedFundsForProject(address project) external view returns (uint256);

    // Function to get the impact score for a project
    function getProjectImpactScore(address project) external view returns (uint256);
}
