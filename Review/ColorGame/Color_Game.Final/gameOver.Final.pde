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
    n = (int) random(0, 2); //state variable again inside the gameMouseReleased function to create a new value for n every time. If the variable is not stated in the function, the program keeps refering to the initial value of n generated in the Color_Game page. So if n = 1 initially, and n is not stated again the the function, the outcome is always the same.
    if (n == 0) {
      randColor = (int) random(0, 8);
      randWord = randColor; //creates a new word that is equal to randColor, instead of randomly

      //randWord = (int) random(0,8); These two lines of code, if replacing the two above, should also work.
      //randColor = randWord;
    } else if (n == 1) {
      randColor = (int) random(0, 8); //generate random values first, then check. 1 is the value for not equal randColor and randWord.
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
