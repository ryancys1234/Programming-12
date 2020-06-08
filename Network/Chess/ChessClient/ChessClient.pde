// Chess game, client.

import processing.net.*;

Client myClient;

PImage wr, wb, wkn, wq, wki, wp, br, bb, bkn, bq, bki, bp;
boolean select1;
boolean cTurn = true;
int var = 1;
int r1, c1, r2, c2;

char grid[][] = {
  {'R', 'B', 'N', 'Q', 'K', 'N', 'B', 'R'}, 
  {'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '}, 
  {'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'}, 
  {'r', 'b', 'n', 'q', 'k', 'n', 'b', 'r'}
};

void setup() {
  size(800, 800);

  myClient = new Client(this, "127.0.0.1", 1234);

  //select1 = true;

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

  if (cTurn == false) {
    fill(0);
    textSize(18);
    text("Wait for the other player to make their move", width/4, height/2);
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
      if (grid[row][col] == 'b') image (wb, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'n') image (wkn, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'q') image (wq, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'k') image (wki, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'p') image (wp, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'R') image (br, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'B') image (bb, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'N') image (bkn, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'Q') image (bq, col * 100, row  * 100, 100, 100);
      if (grid[row][col] == 'K') image (bki, col * 100, row * 100, 100, 100);
      if (grid[row][col] == 'P') image (bp, col * 100, row * 100, 100, 100);
    }
  }
}

void receive() {
  if (myClient.available() > 0) {
    String incoming = myClient.readString();
    int r1 = int(incoming.substring(0, 1));
    int c1 = int(incoming.substring(2, 3));
    int r2 = int(incoming.substring(4, 5));
    int c2 = int(incoming.substring(6, 7));
    grid[r2][c2] = grid[r1][c1];
    grid[r1][c1] = ' ';
    cTurn = true;
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
    select1 = false;
    highlight(c1 * 100, r1 * 100);
  } else {
    r2 = mouseY / 100;
    c2 = mouseX / 100;
    if (!(r2 == r1 && c2 == c1) && cTurn == true) {
      grid[r2][c2] = grid[r1][c1];
      grid[r1][c1] = ' ';
      myClient.write(r1 + "," + c1 + "," + r2 + "," + c2);
      select1 = true;
      cTurn = false;
      println("Client's turn" + "," + cTurn);
      var = 1;
    }
  }
}