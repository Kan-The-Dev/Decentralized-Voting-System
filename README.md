# Decentralized Voting System

This project implements a decentralized voting system on the Ethereum blockchain. It allows users to cast their votes on predefined options and ensures that only token holders (ERC-20 token) can vote. The system is smart contract-based, and voting results are deployed automatically after 24 hours.

## Features

- **Token-based Voting:** Only users holding a specific ERC-20 token can participate in the voting process.
- **Predefined Voting Options:** Users can vote on one of the following options:
  - Option A
  - Option B
  - Option C
  - Option D
  - None of the Above
- **24-Hour Voting Period:** Voting is active for 24 hours. After that, the voting results are deployed.
- **Smart Contract Based:** The voting logic and token verification are implemented in a smart contract deployed on the Ethereum blockchain.
- **Frontend Integration:** The frontend allows users to interact with the contract, cast their votes, and view the results.

## Prerequisites

- **Node.js** (version >= 16.x)
- **npm** (Node Package Manager)
- **Metamask** or another Ethereum wallet to interact with the Ethereum network.
- **Infura Project ID** for interacting with the Ethereum network via Infura.
