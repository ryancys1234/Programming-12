int mode;
final int intro = 0;
final int game = 1;
final int gameOver = 2;
//final is a constant, not a variable. It can't be changed

void setup() {
  size(1000,1000);
  mode = intro;
}

void draw() {
  if (mode == intro) { //reminder: use two consecutive '=' for equal here.
                       //single '=' is used to assign values, double '=' is used
                       //to compare values.
                       //If there is bracket, = ; two brackets, ==
     intro();
  } else if (mode == game) {
     game();
  } else if (mode == gameOver) {
     gameOver();
  } else {
     println("Mode Error: Mode was" + mode);
  }
}

void mouseReleased() {
    if (mode == intro) {
     mode = game;
  } else if (mode == game) {
     mode = gameOver;
  } else if (mode == gameOver) {
     mode = intro;
  } else {
     println("Mode Error");
  }
}
