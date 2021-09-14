void intro() { //60fps - see draw function in Color_Game
  background(#9cc2ff);
  //background(random(0,255), random(0,255), random(0,255));
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(random(0,255), random(0,255), random(0,255));
  text("The Color Game", width/2, height/4);


  //button
  noStroke();
  if (dist(width/2, 400, mouseX, mouseY) <= 50) {
    fill(#76b350);
  } else {
    fill(#a0f26d);
  }
  ellipse(width/2, 400, 100, 100);

  //button text
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(15);
  text("Start", width/2, 400);
}

void introMouseReleased() {
  if (dist(width/2, 400, mouseX, mouseY) <= 50) {
    mode = 1;
  }
}
