// Tic tac toe game.
// Here, the server draws Os (1).

import processing.net.*;

Client myClient;

int[][] grid;

boolean cTurn = true;

void setup() {
  size(300, 400);
  grid = new int[3][3];
  strokeWeight(3);
  textAlign(CENTER, CENTER);
  textSize(50);
  
  myClient = new Client(this, "127.0.0.1", 1235);
}

void draw() {
  background(255);
  
  // Grid
  stroke(0);
  line(0, 100, 300, 100);
  line(0, 200, 300, 200);
  line(100, 0, 100, 300);
  line(200, 0, 200, 300);
  
  // Scanning the 2d array
  int row = 0;
  int col = 0;
  while (row < 3) {
    drawT(row, col);
    col++;
    if (col == 3) {
      col = 0;
      row++;
    }
  }
  
  // Mouse coordinates text
  fill(0);
  text(mouseX + "," + mouseY, 150, 350);
  
  if (myClient.available() > 0) {
    String incoming = myClient.readString();
    int r = int(incoming.substring(0, 1)); // Reads the row number.
    int c = int(incoming.substring(2, 3)); // Reads the column number.
    grid[r][c] = 2; // Draws an X.
    cTurn = true;
  }
}

void drawT(int row, int col) {
  pushMatrix();
  translate(row * 100, col * 100);
  if (grid[row][col] == 1) {
    fill(255);
    ellipse(50, 50, 90, 90);
  } else if (grid[row][col] == 2) {
    line (10, 10, 90, 90);
    line (90, 10, 10, 90);
  }
  popMatrix();
}

void mouseReleased() {
  int row = mouseX / 100; // The answer is an integer (e.g. 0.95 becomes 0).
  int col = mouseY / 100;
  if (grid[row][col] == 0 && cTurn == true) {
    myClient.write(row + "," + col);
    grid[row][col] = 1;
    cTurn = false;
    println(row + "," + col);
    println("Client's turn" + cTurn);
  }
}
