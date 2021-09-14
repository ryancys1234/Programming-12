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

  if (randColor == randWord) { //checks the initial values for randColor and randWord. The reason why the last if statement with variable 'n' cannot be before this if statement is because if so, this function will check the new values for randColor and randWord generated in the last if statement. But with this, this if statement (the first one) will only check the existing values of randColor and randWord, that are generated in the Color_Game page.
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
}
