// Chess game, server.

import processing.net.*;

Server myServer;

PImage wr, wb, wkn, wq, wki, wp, br, bb, bkn, bq, bki, bp;
boolean select1 = true;
boolean sTurn = true;
boolean empty = false;
int var = 1;
int r1, c1, r2, c2;

char grid[][] = {
  {'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'}, 
  {'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'}, 
  {'r', 'n', 'b', 'q', 'k', 'b', 'n', 'r'}
};

void setup() {
  size(800, 800);

  myServer = new Server(this, 1234);

  br = loadImage("blackRook.png");
  bb = loadImage("blackBishop.png");
  bkn = loadImage("blackKnight.png");
  bq = loadImage("blackQueen.png");
  bki = loadImage("blackKing.png");
  bp = loadImage("blackPawn.png");

  wr = loadImage("whiteRook.png");
  wb = loadImage("whiteBishop.png");
  wkn = loadImage("whiteKnight.png");
  wq = loadImage("whiteQueen.png");
  wki = loadImage("whiteKing.png");
  wp = loadImage("whitePawn.png");
}

void draw() {
  drawBoard();
  drawPieces();
  receive();

  if (sTurn == false) {
    fill(0);
    textSize(18);
    text("Wait for the other player to make their move", width/4, height/2);
  }

  if (var == 2) {
    highlight(c1 * 100, r1 * 100);
  }
}

void drawBoard() {
  noStroke();

  for (int row = 0; row < 8; row++) { // x = column
    for (int col = 0; col < 8; col++) { // y = row
      if ((col % 2) == (row % 2)) {
        fill(#60E897);
      } else {
        fill(#7EBDFF);
      }
      rect(col * 100, row * 100, 100, 100);
    }
  }
}

void drawPieces() {
  for (int row = 0; row < 8; row++) {
    for (int col = 0; col < 8; col++) {
      if (grid[row][col] == 'r') image (wr, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'n') image (wkn, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'b') image (wb, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'q') image (wq, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'k') image (wki, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'p') image (wp, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'R') image (br, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'N') image (bkn, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'B') image (bb, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'Q') image (bq, col * 100, row  * 100, 100, 100);
      if (grid[row][col] == 'K') image (bki, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'P') image (bp, col * 100, row * 100, 100, 100);
    }
  }
}

void receive() {
  Client myClient = myServer.available();
  if (myClient != null) {
    String incoming = myClient.readString();
    int r1 = int(incoming.substring(0, 1));
    int c1 = int(incoming.substring(2, 3));
    int r2 = int(incoming.substring(4, 5));
    int c2 = int(incoming.substring(6, 7));
    grid[r2][c2] = grid[r1][c1];
    grid[r1][c1] = ' ';
    sTurn = true;
  }
}

void highlight(int y, int x) {
  noFill();
  strokeWeight(5);
  stroke(#000000);
  rect(y, x, 100, 100);
}

void mouseReleased() {
  if (select1 == true) {
    r1 = mouseY / 100;
    c1 = mouseX / 100;
    if (grid[r1][c1] != ' ') {
      select1 = false;
    }
    var = 2;
  } else {
    r2 = mouseY / 100;
    c2 = mouseX / 100;
    if (!(r2 == r1 && c2 == c1) && sTurn == true) {
      grid[r2][c2] = grid[r1][c1];
      grid[r1][c1] = ' '; // Sets to blank
      myServer.write(r1 + "," + c1 + "," + r2 + "," + c2);
      select1 = true;
      sTurn = false;
      println("Server's turn" + "," + sTurn);
      var = 1;
    }
  }
}
