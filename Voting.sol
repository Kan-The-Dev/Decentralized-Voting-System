// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Interface for ERC-20 Token
interface IERC20 {
    function balanceOf(address account) external view returns (uint256);
}

contract TokenVoting {
    // Enum for voting options
    enum Option { A, B, C, D, NoneOfTheAbove }

    // Address of the token contract (replace with your token address)
    address public tokenAddress = 0x671294c168ea07f4bc9813896EAf533b4de0CD2B;

    // Mapping to track who has voted
    mapping(address => bool) public hasVoted;

    // Mapping to track the vote counts for each option
    mapping(Option => uint256) public voteCount;

    // Event to emit when someone votes
    event Voted(address indexed voter, Option option);

    // Modifier to check if the sender holds tokens
    modifier onlyTokenHolder() {
        require(isTokenHolder(msg.sender), "You must hold tokens to vote.");
        _;
    }

    // Function to check if the sender holds the token
    function isTokenHolder(address _address) public view returns (bool) {
        // Create an instance of the token contract
        IERC20 token = IERC20(tokenAddress);
        uint256 balance = token.balanceOf(_address);
        return balance > 0; // Check if balance > 0
    }

    // Function to vote for an option
    function vote(Option _option) public onlyTokenHolder {
        // Ensure that the sender has not voted yet
        require(!hasVoted[msg.sender], "You have already voted.");

        // Mark the sender as voted
        hasVoted[msg.sender] = true;

        // Increment the vote count for the selected option
        voteCount[_option]++;

        // Emit an event to log the vote
        emit Voted(msg.sender, _option);
    }

    // Function to get the current vote counts for each option
    function getResults() public view returns (uint256[5] memory) {
        uint256[5] memory results;
        results[0] = voteCount[Option.A];
        results[1] = voteCount[Option.B];
        results[2] = voteCount[Option.C];
        results[3] = voteCount[Option.D];
        results[4] = voteCount[Option.NoneOfTheAbove];
        return results;
    }
}
