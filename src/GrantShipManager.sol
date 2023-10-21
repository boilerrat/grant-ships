// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Implementing the IGrantShipManager interface
contract GrantShipManager {
    struct GrantShip {
        address creator;
        string name;
        bool isActive;
    }

    mapping(address => GrantShip) public grantShips;
    
    event GrantShipCreated(address indexed creator, string name);
    event GrantShipStatusUpdated(address indexed grantShip, bool isActive);

    function createGrantShip(string memory name) external {
        require(grantShips[msg.sender].creator == address(0), "GrantShip already exists for this address");
        
        GrantShip memory newGrantShip = GrantShip({
            creator: msg.sender,
            name: name,
            isActive: true
        });

        grantShips[msg.sender] = newGrantShip;
        emit GrantShipCreated(msg.sender, name);
    }

    function updateGrantShipStatus(address grantShipAddress, bool _isActive) external {
        require(grantShips[grantShipAddress].creator != address(0), "GrantShip does not exist");
        
        grantShips[grantShipAddress].isActive = _isActive;
        emit GrantShipStatusUpdated(grantShipAddress, _isActive);
    }
}
