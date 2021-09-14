void game() { //60fps - see draw function in Color_Game
  background(255);
  //score text
  textAlign(CENTER, CENTER);
  textSize(25);
  fill(0);
  text("Score: " +score, width/2, 100);

  //text
  textAlign(CENTER, CENTER);
  textSize(50);
  fill(colors[randColor]); //fill is only for inside numbers / shapes
  text(words[randWord], width/2, height/4); //randWord / randColor denotes random colors / words


  //True Button
  noStroke();
  if (dist(300, 300, mouseX, mouseY) <= 50) {
    fill(#2725CE);
  } else {
    fill(#5D5BF5);
  }
  ellipse(300, 300, 100, 100);

  //True text
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("Yes", 300, 300);

  //False button
  noStroke();
  if (dist(500, 300, mouseX, mouseY) <= 50) {
    fill(255, 0, 0);
  } else {
    fill(#E55858);
  }
  ellipse(500, 300, 100, 100);

  //FalseText
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text("No", 500, 300);
}

void mouseReleased() { //relates to the other page functions. Also, it does not have a fps of 60; it is separate from the draw function
  if (mode == intro) {
    introMouseReleased();
  } else if (mode == game) {
    gameMouseReleased();
  } else if (mode == gameOver) {
    gameOverMouseReleased();
  }
}

void gameMouseReleased() {
  if (n == 0) { //two equal signs to check condition. 0 is the value for equal randColor and randWord.
    //randColor = randWord;
    randColor = (int) random(0, 8); //only one equal sign (assigning value). This line generates equal values only
    randWord = (int) random(0, 8);
    while (randColor != randWord) {
      randColor = (int) random(0, 8);
      randWord = (int) random(0, 8);
    }
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

  if (randColor == randWord) {
    realAnswer = true;
  } else {
    realAnswer = false;
  }

  if (dist(300, 300, mouseX, mouseY) <= 50) {
    answer = true;
  } else if (dist(500, 300, mouseX, mouseY) <= 50) {
    answer = false;
  }

  if (answer == realAnswer) {
    score++;
    randColor = (int) random(0, 8); //generates new values for randColor and randWord
    randWord = (int) random(0, 8);
  } else {
    mode = 2;
  }
}
