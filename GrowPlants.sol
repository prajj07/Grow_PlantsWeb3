//SPDX-License-Identifier: UNLICENSED


pragma solidity ^0.8.0;

contract GrowPlants {
    // Plant information
    uint256 public plantId;
    string public plantType;
    uint256 public height;
    uint256 public width;
    string public color;
    uint256 public growthRate;

    // Growth history
    uint256 public datePlanted;
    uint256 public leavesProduced;
    uint256[] public growthLogTimestamp;
    uint256[] public growthLogLeaves;

    // Environmental conditions
    uint256 public temperature;
    uint256 public lightLevel;
    uint256 public humidity;

    // User information
    address public user;
    string public username;
    string public location;

    // Interactions
    uint256[] public wateringTimestamp;
    uint256[] public fertilizingTimestamp;
    uint256[] public pruningTimestamp;

    // Rewards
    uint256 public rewards;

    // Constructor
    constructor (uint256 _plantId, string memory _plantType, uint256 _height, uint256 _width, string memory _color, uint256 _datePlanted, uint256 _leavesProduced, uint256 _temperature, uint256 _lightLevel, uint256 _humidity, uint256 _growthRate, address _user, string memory _username, string memory _location) public {
        plantId = _plantId;
        plantType = _plantType;
        height = _height;
        width = _width;
        color = _color;
        datePlanted = _datePlanted;
        leavesProduced = _leavesProduced;
        temperature = _temperature;
        lightLevel = _lightLevel;
        humidity = _humidity;
        growthRate = _growthRate;
        user = _user;
        username = _username;
        location = _location;
        rewards = 0;
    }

    // Update the growth status of the plant
    function updateGrowth(uint256 _newHeight, uint256 _newWidth, uint256 _newLeavesProduced) public {
        height = _newHeight;
        width = _newWidth;
        leavesProduced = _newLeavesProduced;
        growthLogTimestamp.push(block.timestamp);
        growthLogLeaves.push(leavesProduced);
    }

    // Update the environmental conditions
    function updateConditions(uint256 _newTemperature, uint256 _newLightLevel, uint256 _newHumidity) public {
        temperature = _newTemperature;
        lightLevel = _newLightLevel;
        humidity = _newHumidity;
    }

    // Add watering interaction
    function waterPlant() public {
        wateringTimestamp.push(block.timestamp);
    }

    // Add fertilizing interaction
    function fertilizePlant() public {
        fertilizingTimestamp.push(block.timestamp);
    }

    // Add pruning interaction
    function prunePlant() public {
        pruningTimestamp.push(block.timestamp);
    }

    // Award rewards for good plant care
    function awardRewards() public {
        rewards += 1;
    }
}
