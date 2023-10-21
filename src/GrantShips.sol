// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./GrantShipManager.sol";
import "./RefereeManager.sol";
import "./AllocationManager.sol";
import "./VotingManager.sol";
import "./PermissionManager.sol";
import "./IAllo.sol";
import "./IHyperCerts.sol";
import "./IHats.sol";

contract GrantShips {
    GrantShipManager public grantShipManager;
    RefereeManager public refereeManager;
    AllocationManager public allocationManager;
    VotingManager public votingManager;
    PermissionManager public permissionManager;
    
    IAllo public allo;
    IHyperCerts public hyperCerts;
    IHats public hats;

    constructor(address _allo, address _hyperCerts, address _hats) {
        grantShipManager = new GrantShipManager();
        refereeManager = new RefereeManager();
        allocationManager = new AllocationManager();
        votingManager = new VotingManager();
        permissionManager = new PermissionManager();

        allo = IAllo(_allo);
        hyperCerts = IHyperCerts(_hyperCerts);
        hats = IHats(_hats);
    }

    function addGrantShip(address grantShipAddress, string memory infoHash) public {
        grantShipManager.addGrantShip(grantShipAddress, infoHash);
    }

    function addReferee(address refereeAddress) public {
        refereeManager.addReferee(refereeAddress);
    }

    function proposeAllocation(address grantShip, address project, uint256 amount) public {
        allocationManager.proposeAllocation(grantShip, project, amount);
    }

    function approveAllocation(uint256 allocationId) public {
        allocationManager.approveAllocation(allocationId);
    }

    function castVote(uint256 allocationId, uint256 weight, VotingManager.VotingType votingType) public {
        votingManager.castVote(allocationId, weight, votingType);
    }

    function assignRole(address account, PermissionManager.Role role) public {
        permissionManager.assignRole(account, role);
    }

    function revokeRole(address account) public {
        permissionManager.revokeRole(account);
    }

    function allocateFunds(uint256 projectId, uint256 amount) public {
        allo.allocateFunds(projectId, amount);
    }

    function createImpactScore(address entity, uint256 score) public {
        hyperCerts.createImpactScore(entity, score);
    }

    function assignHat(address account, uint256 hatId) public {
        hats.assignHat(account, hatId);
    }
}
