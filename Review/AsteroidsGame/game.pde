void game() {
  textFont(gameFont);
  fill(255);
  textSize(20);
  text("Score: " +score, width/8, height/8);
  text("Lives: " +livesSpaceship, width/8, height/16);
  text("Enemy lives: " + livesUfoDisappears, 800, height/16);
}

void gameMouseReleased() {
}
