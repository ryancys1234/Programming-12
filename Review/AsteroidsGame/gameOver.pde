void gameOver() {
  float g = 0;
  
  //strokeWeight(5);
  colorMode(HSB, 360);
  
  pushMatrix();
  stroke(g, 360, 180);
  ellipse(width/2, height/2, 500, 500);
  popMatrix();
  g++;
  
  background(255, 0, 0);
  textFont(gameFont);
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(255);
  text("Game over", width/2, height/4);

  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("Click anywhere to restart", width/2, 400);

  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("Credits: Ryan S - Creator, Block 2-2, Programming 12", width/2, 500);
}

void gameOverMouseReleased() {
  if (dist(width/2, height/2, mouseX, mouseY) <= 500) {
    mode = 1;
  }
}
