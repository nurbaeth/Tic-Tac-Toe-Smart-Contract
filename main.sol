// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TicTacToe {
    enum Player { None, X, O }
    
    struct Game {
        address playerX;
        address playerO;
        Player[3][3] board;
        Player currentPlayer;
        bool isGameActive;
    }
    
    mapping(uint256 => Game) public games;
    uint256 public gameCount;
    
    event GameCreated(uint256 gameId, address playerX, address playerO);
    event MoveMade(uint256 gameId, address player, uint8 row, uint8 col);
    event GameWon(uint256 gameId, address winner);
    event GameDraw(uint256 gameId);
    
    function createGame(address opponent) external {
        require(msg.sender != opponent, "You cannot play against yourself");
        gameCount++;
        Game storage game = games[gameCount];
        game.playerX = msg.sender;
        game.playerO = opponent;
        game.currentPlayer = Player.X;
        game.isGameActive = true;
        emit GameCreated(gameCount, msg.sender, opponent);
    }
    
    function makeMove(uint256 gameId, uint8 row, uint8 col) external {
        Game storage game = games[gameId];
        require(game.isGameActive, "Game is not active");
        require(msg.sender == (game.currentPlayer == Player.X ? game.playerX : game.playerO), "Not your turn");
        require(row < 3 && col < 3, "Invalid move");
        require(game.board[row][col] == Player.None, "Cell already occupied");
        
        game.board[row][col] = game.currentPlayer;
        emit MoveMade(gameId, msg.sender, row, col);
        
        if (checkWin(game.board, game.currentPlayer)) {
            game.isGameActive = false;
            emit GameWon(gameId, msg.sender);
        } else if (isBoardFull(game.board)) {
            game.isGameActive = false;
            emit GameDraw(gameId);
        } else {
            game.currentPlayer = game.currentPlayer == Player.X ? Player.O : Player.X;
        }
    }
    
    function checkWin(Player[3][3] memory board, Player player) private pure returns (bool) {
        for (uint8 i = 0; i < 3; i++) {
            if ((board[i][0] == player && board[i][1] == player && board[i][2] == player) ||
                (board[0][i] == player && board[1][i] == player && board[2][i] == player)) {
                return true;
            }
        }
        if ((board[0][0] == player && board[1][1] == player && board[2][2] == player) ||
            (board[0][2] == player && board[1][1] == player && board[2][0] == player)) {
            return true;
        }
        return false;
    }
    
    function isBoardFull(Player[3][3] memory board) private pure returns (bool) {
        for (uint8 i = 0; i < 3; i++) {
            for (uint8 j = 0; j < 3; j++) {
                if (board[i][j] == Player.None) {
                    return false;
                }
            }
        }
        return true;
    }
}
