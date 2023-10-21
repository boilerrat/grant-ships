// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing all the necessary interfaces
import "./IGrantShipManager.sol";
import "./IRefereeManager.sol";
import "./IAllocationManager.sol";
import "./IVotingManager.sol";
import "./IPermissionManager.sol";

contract GrantShips {
    IGrantShipManager public grantShipManager;
    IRefereeManager public refereeManager;
    IAllocationManager public allocationManager;
    IVotingManager public votingManager;
    IPermissionManager public permissionManager;

    constructor(
        address _grantShipManager,
        address _refereeManager,
        address _allocationManager,
        address _votingManager,
        address _permissionManager
    ) {
        grantShipManager = IGrantShipManager(_grantShipManager);
        refereeManager = IRefereeManager(_refereeManager);
        allocationManager = IAllocationManager(_allocationManager);
        votingManager = IVotingManager(_votingManager);
        permissionManager = IPermissionManager(_permissionManager);
    }

    // Additional methods that call the underlying manager contracts
}
