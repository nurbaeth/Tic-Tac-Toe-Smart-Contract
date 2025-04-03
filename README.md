# Tic-Tac-Toe Smart Contract

## Overview
Tic-Tac-Toe is a simple yet classic game, now brought to the blockchain! This Solidity smart contract enables two players to engage in a decentralized, fair, and tamper-proof game of Tic-Tac-Toe. The game ensures proper turn-taking, prevents invalid moves, and detects wins or draws.

## Features
- **On-Chain Gameplay**: All moves are recorded on the blockchain.
- **Turn-Based Logic**: Ensures fair play by enforcing correct turns.
- **Win/Draw Detection**: Automatically determines the winner or if the game is a draw.
- **No ETH Stakes**: This game is purely for fun, with no financial risks.   
 
## How It Works
1. **Create a Game**: A player initializes a new game by specifying an opponent.  
2. **Make a Move**: Players take turns placing their marks (X or O) on a 3x3 board.
3. **Check for Win/Draw**: The contract checks if a player has won or if the board is full. 
4. **End Game**: The contract finalizes the game when a player wins or the match ends in a draw. 

## Deployment Instructions 
To deploy this contract on an Ethereum-compatible blockchain:  

1. Install [Remix](https://remix.ethereum.org/) or use Hardhat/Foundry.
2. Deploy the contract using a Solidity-compatible environment.
3. Interact with the contract via Remix or a front-end interface.

## Smart Contract Functions
### `createGame(address opponent)`
- Starts a new game between the caller and an opponent.

### `makeMove(uint256 gameId, uint8 row, uint8 col)`
- Allows a player to make a move at the specified board position.

### `checkWin()` (internal)
- Determines if a player has won the game.

### `isBoardFull()` (internal)
- Checks if the game board is full, leading to a draw.

## Events
- `GameCreated(uint256 gameId, address playerX, address playerO)` – A new game has been created.
- `MoveMade(uint256 gameId, address player, uint8 row, uint8 col)` – A player made a move.
- `GameWon(uint256 gameId, address winner)` – A player has won the game.
- `GameDraw(uint256 gameId)` – The game ended in a draw.

## License
This project is licensed under the MIT License.

---

Enjoy playing Tic-Tac-Toe on-chain! 🎮🚀

