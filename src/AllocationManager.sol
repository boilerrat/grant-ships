// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Implementing the IAllocationManager interface
contract AllocationManager {
    struct Allocation {
        address grantShip;
        address project;
        uint256 amount;
        bool isApproved;
    }

    mapping(uint256 => Allocation) public allocations;
    uint256 public nextAllocationId;

    event AllocationProposed(uint256 indexed allocationId, address indexed grantShip, address indexed project, uint256 amount);
    event AllocationApproved(uint256 indexed allocationId);

    function proposeAllocation(address grantShip, address project, uint256 amount) external {
        Allocation memory newAllocation = Allocation({
            grantShip: grantShip,
            project: project,
            amount: amount,
            isApproved: false
        });

        allocations[nextAllocationId] = newAllocation;
        emit AllocationProposed(nextAllocationId, grantShip, project, amount);

        nextAllocationId++;
    }

    function approveAllocation(uint256 allocationId) external {
        require(allocations[allocationId].grantShip != address(0), "Invalid allocation ID");
        
        allocations[allocationId].isApproved = true;
        emit AllocationApproved(allocationId);
    }
}
