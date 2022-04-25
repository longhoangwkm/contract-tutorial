// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Sample is Ownable {
    mapping(address => uint256) public balances;

    uint256 public total;

    constructor() {
        _mint(100, msg.sender);
    }

    event Transfered(
        address sender,
        uint256 _amount,
        address receiver1,
        address receiver2
    );
    event Minted(uint256 amount, address to);

    function mint(uint256 _amount, address _to) external onlyOwner {
        _mint(_amount, _to);
    }

    function _mint(uint256 _amount, address _to) internal {
        balances[_to] += _amount;

        emit Minted(_amount, _to);
    }

    function transfer(
        uint256 _amount,
        address _receiver1,
        address _receiver2
    ) public {
        balances[_receiver1] += _amount;
        balances[_receiver2] += _amount;
        balances[msg.sender] -= (_amount * 2);

        emit Transfered(msg.sender, _amount, _receiver1, _receiver2);
    }
}
