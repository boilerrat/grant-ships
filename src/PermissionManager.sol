// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Implementing the IPermissionManager interface
contract PermissionManager {
    enum Role { GrantShip, Referee, Voter }

    mapping(address => Role) public roles;
    mapping(Role => address[]) public roleMembers;

    event RoleAssigned(address indexed account, Role indexed role);
    event RoleRevoked(address indexed account, Role indexed role);

    function assignRole(address account, Role role) external {
        require(roles[account] == Role(0), "Account already has a role assigned");

        roles[account] = role;
        roleMembers[role].push(account);
        emit RoleAssigned(account, role);
    }

    function revokeRole(address account) external {
        require(roles[account] != Role(0), "Account has no role to revoke");

        Role role = roles[account];
        roles[account] = Role(0);

        // Remove account from roleMembers array (omitted here for simplicity)
        // TODO: Implement removal logic

        emit RoleRevoked(account, role);
    }
}
