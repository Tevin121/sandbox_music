int[][] board = {
  {0, 0, 0},
  {0, 0, 0},
  {0, 0, 0}
}; // 0 = empty, 1 = X, 2 = O
int currentPlayer = 1; // Player 1 starts
boolean gameOver = false;

// Scoreboard
int player1Wins = 0;
int player2Wins = 0;
int ties = 0; // Count of tie games

void setup() {
  size(400, 550); // Extra space for the reset button and scoreboard
}

void draw() {
  background(0, 0, 255); // Blue background
  drawGrid(); // Draw the Tic Tac Toe grid
  drawBoard(); // Draw X and O on the board
  drawResetButton(); // Draw the reset button
  drawScoreboard(); // Draw the scoreboard inside a light blue box
  drawSquareNumbers(); // Draw numbers on each square

  if (gameOver) {
    displayWinner(); // Show the winner or tie message
  }
}

void mousePressed() {
  // Check if the reset button is clicked
  if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height - 140 && mouseY < height - 110) {
    resetGame(); // Reset the game
    return; // Exit the function to avoid further processing
  }

  if (gameOver) {
    return; // If the game is over, don't allow further moves
  }

  // Check which square is clicked
  int row = floor(mouseY / ((height - 150) / 3)); // Calculate row
  int col = floor(mouseX / (width / 3)); // Calculate column

  if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == 0) {
    board[row][col] = currentPlayer; // Place the current player's mark
    if (checkWinner() != 0 || isBoardFull()) {
      if (checkWinner() == 1) player1Wins++; // Update Player 1's score
      if (checkWinner() == 2) player2Wins++; // Update Player 2's score
      if (checkWinner() == 0 && isBoardFull()) ties++; // Update tie count
      gameOver = true; // End the game
    } else {
      currentPlayer = 3 - currentPlayer; // Switch player (1 -> 2, 2 -> 1)
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    resetGame(); // Reset the game when 'R' is pressed
  }
}

void drawGrid() {
  stroke(173, 216, 230); // Light blue grid lines
  strokeWeight(4);
  line(width / 3, 0, width / 3, height - 150); // Vertical line 1
  line(2 * width / 3, 0, 2 * width / 3, height - 150); // Vertical line 2
  line(0, (height - 150) / 3, width, (height - 150) / 3); // Horizontal line 1
  line(0, 2 * (height - 150) / 3, width, 2 * (height - 150) / 3); // Horizontal line 2
}

void drawBoard() {
  textSize(64);
  textAlign(CENTER, CENTER);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 1) {
        fill(0, 255, 0); // Green for X
        text("X", j * width / 3 + width / 6, i * (height - 150) / 3 + (height - 150) / 6);
      } else if (board[i][j] == 2) {
        fill(128, 0, 128); // Purple for O
        text("O", j * width / 3 + width / 6, i * (height - 150) / 3 + (height - 150) / 6);
      }
    }
  }
}

void drawSquareNumbers() {
  textSize(32);
  textAlign(CENTER, CENTER);
  fill(255); // White numbers
  int number = 1;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) { // Only show numbers on empty squares
        text(number, j * width / 3 + width / 6, i * (height - 150) / 3 + (height - 150) / 6);
      }
      number++;
    }
  }
}

void drawResetButton() {
  fill(200); // Light gray button
  rect(width / 2 - 50, height - 140, 100, 30, 5); // Button rectangle
  fill(0); // Black text
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Reset", width / 2, height - 125); // Button label
}

void drawScoreboard() {
  // Draw the square for the scoreboard
  fill(173, 216, 230); // Light blue background for the square
  stroke(255); // White border
  strokeWeight(2);
  rect(50, height - 100, width - 100, 80, 10); // Scoreboard rectangle

  // Draw the scoreboard text
  fill(0); // Black text
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Scoreboard", width / 2, height - 90); // Scoreboard title
  text("Player 1 (X): " + player1Wins, width / 2, height - 70); // Player 1 score
  text("Player 2 (O): " + player2Wins, width / 2, height - 50); // Player 2 score
  text("Ties: " + ties, width / 2, height - 30); // Tie count
}

void displayWinner() {
  fill(0); // Black text for winner/tie message
  textSize(32);
  textAlign(CENTER, CENTER);
  if (checkWinner() != 0) {
    text("Player " + checkWinner() + " Wins!", width / 2, height / 2 - 25);
  } else {
    text("It's a Tie!", width / 2, height / 2 - 25);
  }
}

int checkWinner() {
  // Check rows and columns
  for (int i = 0; i < 3; i++) {
    if (board[i][0] != 0 && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
      return board[i][0];
    }
    if (board[0][i] != 0 && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
      return board[0][i];
    }
  }
  // Check diagonals
  if (board[0][0] != 0 && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
    return board[0][0];
  }
  if (board[0][2] != 0 && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
    return board[0][2];
  }
  return 0; // No winner
}

boolean isBoardFull() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (board[i][j] == 0) {
        return false; // If any cell is empty, the board is not full
      }
    }
  }
  return true; // All cells are filled
}

void resetGame() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = 0; // Clear the board
    }
  }
  currentPlayer = 1; // Reset to Player 1
  gameOver = false; // Reset game state
  loop(); // Restart the game loop
}
