// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title SimpleStorage sample contract
/// @notice Minimal example contract for tutorials and tests
contract SimpleStorage {
    uint256 private value;

    event Stored(uint256 newValue);

    /// @notice Store a new value
    /// @param _value The value to store
    function store(uint256 _value) external {
        value = _value;
        emit Stored(_value);
    }

    /// @notice Retrieve the stored value
    /// @return The stored uint256 value
    function retrieve() external view returns (uint256) {
        return value;
    }

    /// @notice Increment the stored value by 1
    function increment() external {
        value += 1;
        emit Stored(value);
    }
}
