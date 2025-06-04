int[] board = {0, 0, 0, 0, 0, 0, 0, 0, 0}; // 0 = empty, 1 = X, 2 = O
int currentPlayer = 1; // Player 1 starts (X)
boolean gameOver = false; // Is the game over?
boolean playVsAI = false; // Is the player fighting the AI?
String aiDifficulty = "Easy"; // Default AI difficulty

// Scoreboard
int player1Wins = 0;
int player2Wins = 0;
int ties = 0; // Number of tie games

// Dynamic layout variables
float gridHeight;
float buttonHeight;
float buttonWidth;

void setup() {
  fullScreen(); // Make the game full screen
  gridHeight = height * 0.7; // Grid occupies 70% of the screen height
  buttonHeight = height * 0.05; // Button height is 5% of the screen height
  buttonWidth = width * 0.25; // Button width is 25% of the screen width
}

void draw() {
  background(0, 0, 255); // Blue background
  drawGrid(); // Draw the Tic Tac Toe grid
  drawBoard(); // Draw X and O on the board
  drawScoreboard(); // Show the scoreboard
  drawPlayVsAIButton(); // Show the "Play vs AI" button
  drawAIDifficultySelector(); // Show the AI difficulty selector
  drawResetButton(); // Show the "Reset" button
  drawCloseButton(); // Show the "X" close button

  // If the game is over, show the winner or tie message
  if (gameOver) {
    displayWinner();
  } 
  // If playing against AI and it's AI's turn, let the AI make a move
  else if (playVsAI && currentPlayer == 2) {
    aiMove();
  }
}

// Handle mouse clicks for buttons and grid
void mousePressed() {
  // Check if the "Reset" button is clicked
  if (mouseX > width / 2 - buttonWidth / 2 && mouseX < width / 2 + buttonWidth / 2 &&
      mouseY > height - buttonHeight * 2 && mouseY < height - buttonHeight) {
    resetGame(); // Reset the game
    return;
  }

  // Check if the "Play vs AI" button is clicked
  if (mouseX > width / 2 - buttonWidth / 2 && mouseX < width / 2 + buttonWidth / 2 &&
      mouseY > height - buttonHeight * 3.5 && mouseY < height - buttonHeight * 2.5) {
    playVsAI = !playVsAI; // Toggle AI mode
    resetGame(); // Reset the game
    return;
  }

  // Check if the "Easy" AI button is clicked
  if (mouseX > width / 2 + buttonWidth / 2 + 10 && mouseX < width / 2 + buttonWidth + 10 &&
      mouseY > height - buttonHeight * 3.5 && mouseY < height - buttonHeight * 2.5) {
    aiDifficulty = "Easy"; // Set AI difficulty to Easy
    resetGame(); // Reset the game
    return;
  }

  // Check if the "Hard" AI button is clicked
  if (mouseX > width / 2 + buttonWidth + 20 && mouseX < width / 2 + buttonWidth * 1.5 + 20 &&
      mouseY > height - buttonHeight * 3.5 && mouseY < height - buttonHeight * 2.5) {
    aiDifficulty = "Hard"; // Set AI difficulty to Hard
    resetGame(); // Reset the game
    return;
  }

  // Check if the "X" close button is clicked
  if (mouseX > width - 50 && mouseX < width - 10 && mouseY > 10 && mouseY < 50) {
    exit(); // Close the game
  }

  // If the game is over or it's AI's turn, do nothing
  if (gameOver || (playVsAI && currentPlayer == 2)) {
    return;
  }

  // Check if a grid square is clicked
  if (mouseY < gridHeight) {
    int row = floor(mouseY / (gridHeight / 3)); // Calculate row
    int col = floor(mouseX / (width / 3)); // Calculate column
    int index = row * 3 + col; // Convert 2D coordinates to 1D index

    // If the square is empty, place the current player's mark
    if (board[index] == 0) {
      board[index] = currentPlayer; // Place the current player's mark
      checkGameState(); // Check if the game is over
      currentPlayer = 3 - currentPlayer; // Switch player (1 -> 2, 2 -> 1)
    }
  }
}

// Handle keyboard input for placing X or O and resetting the game
void keyPressed() {
  // Reset the game when the "R" key is pressed
  if (key == 'R' || key == 'r') {
    resetGame();
    return; // Exit the function after resetting
  }

  if (gameOver) return; // Do nothing if the game is over

  // Check if the key corresponds to a square (1-9)
  if (key >= '1' && key <= '9') {
    int index = key - '1'; // Convert key ('1'-'9') to index (0-8)

    // If the square is empty, place the current player's mark
    if (board[index] == 0) {
      board[index] = currentPlayer; // Place the current player's mark
      checkGameState(); // Check if the game is over
      currentPlayer = 3 - currentPlayer; // Switch player (1 -> 2, 2 -> 1)
    }
  }
}

// Check if the game is over or if there's a winner
void checkGameState() {
  if (checkWinner() != 0 || isBoardFull()) {
    if (checkWinner() == 1) player1Wins++; // Player 1 wins
    if (checkWinner() == 2) player2Wins++; // Player 2 wins
    if (checkWinner() == 0 && isBoardFull()) ties++; // It's a tie
    gameOver = true; // End the game
  }
}

// Draw the Tic Tac Toe grid
void drawGrid() {
  stroke(255); // White grid lines
  strokeWeight(4);
  line(width / 3, 0, width / 3, gridHeight); // Vertical line 1
  line(2 * width / 3, 0, 2 * width / 3, gridHeight); // Vertical line 2
  line(0, gridHeight / 3, width, gridHeight / 3); // Horizontal line 1
  line(0, 2 * gridHeight / 3, width, 2 * gridHeight / 3); // Horizontal line 2
}

// Draw the X and O marks on the board
void drawBoard() {
  textSize(gridHeight / 6);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 9; i++) {
    int row = i / 3; // Calculate row from index
    int col = i % 3; // Calculate column from index
    float x = col * width / 3 + width / 6;
    float y = row * gridHeight / 3 + gridHeight / 6;

    if (board[i] == 1) {
      fill(0, 255, 0); // Green for X
      text("X", x, y);
    } else if (board[i] == 2) {
      fill(255, 0, 0); // Red for O
      text("O", x, y);
    } else {
      fill(255); // White for numbers
      text(str(i + 1), x, y); // Display the square number
    }
  }
}

// Draw the scoreboard
void drawScoreboard() {
  fill(173, 216, 230); // Light blue background
  stroke(255); // White border
  strokeWeight(2);
  rect(width * 0.1, gridHeight + 20, width * 0.8, buttonHeight * 2, 10); // Scoreboard rectangle

  fill(0); // Black text
  textSize(buttonHeight * 0.8);
  textAlign(CENTER, CENTER);
  text("Scoreboard", width / 2, gridHeight + 30); // Title
  text("Player 1 (X): " + player1Wins, width / 2, gridHeight + 60); // Player 1 score
  text("Player 2 (O): " + player2Wins, width / 2, gridHeight + 90); // Player 2 score
  text("Ties: " + ties, width / 2, gridHeight + 120); // Tie count
}

// Draw the "Play vs AI" button
void drawPlayVsAIButton() {
  fill(200); // Light gray button
  rect(width / 2 - buttonWidth / 2, height - buttonHeight * 3.5, buttonWidth, buttonHeight, 5); // Button rectangle
  fill(0); // Black text
  textSize(buttonHeight * 0.6);
  textAlign(CENTER, CENTER);
  text(playVsAI ? "Stop AI" : "Play vs AI", width / 2, height - buttonHeight * 3); // Button label
}

// Draw the AI difficulty selector
void drawAIDifficultySelector() {
  // Draw "Easy" button
  fill(aiDifficulty == "Easy" ? 0 : 255); // Highlight if selected
  rect(width / 2 + buttonWidth / 2 + 10, height - buttonHeight * 3.5, buttonWidth / 2, buttonHeight, 5);
  fill(aiDifficulty == "Easy" ? 255 : 0); // Text color
  textSize(buttonHeight * 0.6);
  textAlign(CENTER, CENTER);
  text("Easy", width / 2 + buttonWidth * 0.75 + 10, height - buttonHeight * 3);

  // Draw "Hard" button
  fill(aiDifficulty == "Hard" ? 0 : 255); // Highlight if selected
  rect(width / 2 + buttonWidth + 20, height - buttonHeight * 3.5, buttonWidth / 2, buttonHeight, 5);
  fill(aiDifficulty == "Hard" ? 255 : 0); // Text color
  text("Hard", width / 2 + buttonWidth * 1.25 + 20, height - buttonHeight * 3);
}

// Draw the "Reset" button
void drawResetButton() {
  fill(200); // Light gray button
  rect(width / 2 - buttonWidth / 2, height - buttonHeight * 2, buttonWidth, buttonHeight, 5); // Button rectangle
  fill(0); // Black text
  textSize(buttonHeight * 0.6);
  textAlign(CENTER, CENTER);
  text("Reset", width / 2, height - buttonHeight * 1.5); // Button label
}

// Draw the "X" close button
void drawCloseButton() {
  fill(255, 0, 0); // Red background for the close button
  rect(width - 50, 10, 40, 40, 5); // Draw the button
  fill(255); // White text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("X", width - 30, 30); // Draw the "X" label
}

// Display the winner or tie message
void displayWinner() {
  fill(0); // Black text
  textSize(gridHeight / 10);
  textAlign(CENTER, CENTER);
  if (checkWinner() != 0) {
    text("Player " + checkWinner() + " Wins!", width / 2, gridHeight / 2);
  } else {
    text("It's a Tie!", width / 2, gridHeight / 2);
  }
}

// Check if there's a winner
int checkWinner() {
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i * 3] != 0 && board[i * 3] == board[i * 3 + 1] && board[i * 3 + 1] == board[i * 3 + 2]) {
      return board[i * 3]; // Return the winner (X or O)
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[i] != 0 && board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
      return board[i]; // Return the winner (X or O)
    }
  }

  // Check diagonals
  if (board[0] != 0 && board[0] == board[4] && board[4] == board[8]) {
    return board[0]; // Return the winner (X or O)
  }
  if (board[2] != 0 && board[2] == board[4] && board[4] == board[6]) {
    return board[2]; // Return the winner (X or O)
  }

  return 0; // No winner
}

// Check if the board is full
boolean isBoardFull() {
  for (int i = 0; i < 9; i++) {
    if (board[i] == 0) return false; // Empty square found
  }
  return true; // All squares are filled
}

// Reset the game
void resetGame() {
  for (int i = 0; i < 9; i++) {
    board[i] = 0; // Clear the board
  }
  currentPlayer = 1; // Reset to Player 1
  gameOver = false; // Reset game state
}

// AI makes a move based on difficulty
void aiMove() {
  if (aiDifficulty == "Easy") {
    // Easy AI: Random move
    while (true) {
      int index = int(random(9));
      if (board[index] == 0) {
        board[index] = 2; // AI plays as Player 2 (O)
        checkGameState(); // Check if the game is over
        currentPlayer = 1; // Switch back to Player 1
        break;
      }
    }
  } else if (aiDifficulty == "Hard") {
    // Hard AI: Try to win or block the player
    for (int i = 0; i < 9; i++) {
      if (board[i] == 0) {
        // Try to win
        board[i] = 2;
        if (checkWinner() == 2) {
          checkGameState();
          currentPlayer = 1;
          return;
        }
        board[i] = 0;

        // Try to block the player
        board[i] = 1;
        if (checkWinner() == 1) {
          board[i] = 2;
          checkGameState();
          currentPlayer = 1;
          return;
        }
        board[i] = 0;
      }
    }

    // If no winning or blocking move, make a random move
    while (true) {
      int index = int(random(9));
      if (board[index] == 0) {
        board[index] = 2; // AI plays as Player 2 (O)
        checkGameState(); // Check if the game is over
        currentPlayer = 1; // Switch back to Player 1
        break;
      }
    }
  }
}
