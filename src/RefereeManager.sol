// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Implementing the IRefereeManager interface
contract RefereeManager {
    struct Referee {
        address account;
        bool isActive;
    }

    mapping(address => Referee) public referees;

    event RefereeAdded(address indexed account);
    event RefereeStatusUpdated(address indexed account, bool isActive);

    function addReferee(address account) external {
        require(referees[account].account == address(0), "Referee already exists");

        Referee memory newReferee = Referee({
            account: account,
            isActive: true
        });

        referees[account] = newReferee;
        emit RefereeAdded(account);
    }

    function updateRefereeStatus(address account, bool _isActive) external {
        require(referees[account].account != address(0), "Referee does not exist");

        referees[account].isActive = _isActive;
        emit RefereeStatusUpdated(account, _isActive);
    }
}
