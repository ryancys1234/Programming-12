void gameOver() { //60fps - see draw function in Color_Game
  background(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(255);
  text("Game over", width/2, height/4);

  noStroke();
  if (dist(width/2, 400, mouseX, mouseY) <= 50) {
    fill(#ff1c3e);
  } else {
    fill(#ff6e83);
  }
  ellipse(width/2, 400, 100, 100);

  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("Restart", width/2, 400);
}

void gameOverMouseReleased() {
  if (dist(width/2, 400, mouseX, mouseY) <= 50) {
    mode = 1;
    score = 0;
    if (n == 0) { //two equal signs to check condition
      //randColor = randWord;
      randColor = (int) random(0, 8); //only one equal sign (assigning value). This line generates equal values only
      randWord = (int) random(0, 8);
      while (randColor != randWord) {
        randColor = (int) random(0, 8);
        randWord = (int) random(0, 8);
      }
    } else if (n == 1) {
      randColor = (int) random(0, 8); //generate random values first, then check
      randWord = (int) random(0, 8);
      while (randColor == randWord) { //5. Two equal signs because this is a condition too. If this condition (randColor == randWord) is true, generate a new puzzle within the while loop because this is in the "else if n == 1"; one is the value for false
        randColor = (int) random(0, 8); //keeps generating new colors and words until it is false
        randWord = (int) random(0, 8);
      }
    } else {
      println ("Error");
    }
  } else {
  }
}
