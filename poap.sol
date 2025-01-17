// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfAttendance {
    struct Event {
        string name;
        uint256 date;
        address organizer;
    }

    mapping(uint256 => Event) public events;
    mapping(uint256 => mapping(address => bool)) public attendance;

    uint256 public eventCount;

    function createEvent(string memory _name, uint256 _date) public {
        events[eventCount] = Event(_name, _date, msg.sender);
        eventCount++;
    }

    function markAttendance(uint256 _eventId) public {
        require(_eventId < eventCount, "Event does not exist");
        require(!attendance[_eventId][msg.sender], "Already marked");

        attendance[_eventId][msg.sender] = true;
    }

    function checkAttendance(uint256 _eventId, address _user) public view returns (bool) {
        return attendance[_eventId][_user];
    }
}
