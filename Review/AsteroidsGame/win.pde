void win() {
  background(#9cc2ff);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("You won", width/2, height/4);

  //button text
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(15);
  text("Click anywhere to replay", width/2, 400);
}

void winMouseReleased() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 500) {
    mode = 1;
  }
}
