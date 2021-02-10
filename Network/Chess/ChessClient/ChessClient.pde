// Chess game, client.

import processing.net.*;

Client myClient;

PImage wr, wb, wkn, wq, wki, wp, br, bb, bkn, bq, bki, bp;
boolean select1 = true, pawnFirst = false;
boolean cTurn = true;
boolean timeUp = false;
int r1, c1, r2, c2;
int var = 1;
int timer, timeSeconds;

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
  size(800, 900);

  myClient = new Client(this, "127.0.0.1", 1234);

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
  moves(r1, c1, r2, c2);

  if (cTurn == false) {
    fill(0);
    textSize(18);
    text("Wait for the other player to make their move", width/4, height/2);
  }

  if (var == 2) {
    highlight(c1 * 100, r1 * 100);
  }

  //highlightValid(c1 * 100, r1 * 100);

  if (cTurn) {
    timer++;
  } else if (!cTurn) {
    timer = 0;
  }

  if (timer == 60) {
    timeSeconds++;
    timer = 0;
  }

  if (timeSeconds == 60) {
    timeUp = true;
    timeSeconds = 0;
  }
  
  fill(0);
  text(timeSeconds, width/2, 850);
  textSize(30);
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

boolean moves(int r1, int c1, int r2, int c2) {
  r1 = mouseY / 100;
  c1 = mouseX / 100;
  r2 = mouseY / 100;
  c2 = mouseX / 100;

  // Pawn ========================
  if (r1 == 1 || r1 == 6) pawnFirst = true;

  if (grid[r1][c1] == 'P' || grid[r2][c2] == 'p') {
    if (pawnFirst == true) {
      if ((abs(r2 - r1) == 1 && c2 == c1) || (abs(r2 - r1) == 2 && c2 == c1)) return(true);
    } else if (pawnFirst == false) {
      if (abs(r2 - r1) == 1 && c2 == c1) return(true);
    }
  }

  // Rook ========================
  if (grid[r1][c1] == 'R' || grid[r1][c1] == 'r') {
    if (r2 == r1 || c2 == c1) return(true);
  }

  // Knight ========================
  if (grid[r1][c1] == 'N' || grid[r1][c1] == 'n') {
    if (abs(r2 - r1) == 1 && abs(c2 - c1) == 2 || abs(r2 - r1) == 2 & abs(c2 - c1) == 1) return(true);
  }
  
  // Bishop ========================
  if (grid[r1][c1] == 'B' || grid[r2][c2] == 'b') {
    if (abs(r2 - r1) == abs(c2 - c1)) return(true);
  }
  
  // Queen ========================
  if (grid[r1][c1] == 'Q' || grid[r1][c1] == 'q') {
    if (r2 == r1 || c2 == c1 || abs(r2 - r1) == abs(c2 - c1)) return(true);
  }

  // King ========================
  if (grid[r1][c1] == 'K' || grid[r1][c1] == 'k') {
    if ((r2 == r1 || c2 == c1) && (abs(r2 - r1) == 1 || abs(c2 - c1) == 1) || (abs(r2 - r1) == 1 && abs(c2 - c1) == 1)) return(true);
  }

  return(false);
}

void highlight(int y, int x) {
  noFill();
  strokeWeight(5);
  stroke(#000000);
  rect(y, x, 100, 100);
}

//void highlightValid(int y, int x) {
//  for (int row = 0; row < 8; row++) {
//    for (int col = 0; col < 8; col++) {
//      noFill();
//      strokeWeight(5);
//      stroke(#FFFFFF);
//      rect(col * 100, row * 100, 100, 100);
//    }
//  }
//}

void mouseReleased() {
  if (select1 == true) {
    r1 = mouseY / 100;
    c1 = mouseX / 100;
    if (grid[r1][c1] != ' ') {
      select1 = false;
    }
    var = 2;
  } else if (moves(r1, c1, r2, c2) && !timeUp) {
    r2 = mouseY / 100;
    c2 = mouseX / 100;
    if (!(r2 == r1 && c2 == c1) && cTurn == true) {
      grid[r2][c2] = grid[r1][c1];
      grid[r1][c1] = ' '; // Sets to blank
      myClient.write(r1 + "," + c1 + "," + r2 + "," + c2);
      select1 = true;
      cTurn = false;
      println("Client's turn" + "," + cTurn);
      var = 1;
    }
  }
  //else if (timeUp) {
  //  cTurn = false;
  //}
}
