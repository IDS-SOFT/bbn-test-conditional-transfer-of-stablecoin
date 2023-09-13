// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the ERC20 interface for interacting with stablecoin tokens
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ConditionalTransfer {
    address public owner;
    IERC20 public stablecoin;  // The stablecoin token contract address
    address public recipient;
    uint256 public condition;   // The condition for the transfer
    uint256 public amount;     // The amount to transfer

    // constructor(
    //     address _stablecoin,
    //     address _recipient,
    //     uint256 _condition,
    //     uint256 _amount
    // ) {
    //     owner = msg.sender;
    //     stablecoin = IERC20(_stablecoin);
    //     recipient = _recipient;
    //     condition = _condition;
    //     amount = _amount;
    // }

    // This function allows the owner to change the recipient address
    function changeRecipient(address newRecipient) public {
        require(msg.sender == owner, "Only the owner can change the recipient");
        recipient = newRecipient;
    }

    // This function allows the owner to change the condition
    function changeCondition(uint256 newCondition) public {
        require(msg.sender == owner, "Only the owner can change the condition");
        condition = newCondition;
    }

    // This function allows the owner to change the transfer amount
    function changeAmount(uint256 newAmount) public {
        require(msg.sender == owner, "Only the owner can change the amount");
        amount = newAmount;
    }

    // Execute the transfer if the condition is met
    function executeTransfer() public {
        require(msg.sender == owner || msg.sender == recipient, "Only the owner or recipient can execute the transfer");
        require(stablecoin.balanceOf(owner) >= amount, "Insufficient balance in the contract");
        require(conditionIsMet(), "Condition is not met");

        stablecoin.transfer(recipient, amount);
    }

    // Check if the condition is met
    function conditionIsMet() public view returns (bool) {
        // Implement your condition logic here
        // For example, you could check the current timestamp against the condition
        return block.timestamp >= condition;
    }
}
