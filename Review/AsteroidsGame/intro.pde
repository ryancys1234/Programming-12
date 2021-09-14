void intro() {
  filter(BLUR, 6);
  fill(255);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("Asteroids", width/2, height/4);

  //button text
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("Click anywhere to start", width/2, 600);
}

void introMouseReleased() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 500) {
    mode = 1;
  }
}
