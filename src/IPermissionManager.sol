// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing Hats Protocol interface
import "@HatsProtocol/HatsInterface.sol";

// Interface for PermissionManager
interface IPermissionManager {
    // Events
    event RoleAssigned(address indexed account, bytes32 indexed role);
    event RoleRevoked(address indexed account, bytes32 indexed role);

    // Assign a role to an account
    function assignRole(address account, bytes32 role) external;

    // Revoke a role from an account
    function revokeRole(address account, bytes32 role) external;

    // Check if an account has a specific role
    function hasRole(address account, bytes32 role) external view returns (bool);

    // Get all accounts with a specific role
    function getAccountsByRole(bytes32 role) external view returns (address[] memory);
}
