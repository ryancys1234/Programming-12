void game() {
}

void mountainTheme() {
}

void forestTheme() {
}

void mountainSeaTheme() {
}

void snowTheme() {
}

void poolTheme() {
}

void greenValleyTheme() {
}

void autumnTheme() {
}

void leftWins() {
  background(255);
  fill(93, 67, 214);
  textSize(100);
  text("Left Player Wins", width/2, height/2);
  textAlign(CENTER);
  textSize(30);
  text("Click to Play Again", width/2, height*0.75);
  textAlign(CENTER);
}

void rightWins() {
  background(255);
  textSize(100);
  text("Right Player Wins", width/2, height/2);
  textAlign(CENTER);
  textSize(30);
  text("Click to Play Again", width/2, height*0.75);
  textAlign(CENTER);
}

void mouseReleased() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 1000) {
    game();
  }
}
