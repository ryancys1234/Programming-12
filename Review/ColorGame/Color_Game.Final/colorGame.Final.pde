//Color game project

int mode = 0; //sets the starting mode to game
final int intro = 0; //what does final do again?
final int game = 1;
final int gameOver = 2;

int score = 0;
boolean realAnswer;
boolean answer;

//colors
color red = #FF0000;
color blue = #0000FF;
color yellow = #FFFF00;
color orange = #FFA500;
color brown = #A52A2A;
color green = #008000;
color purple = #800080;
color grey = #808080;

int n = (int) random(0,2);
//generates random color
int randColor = (int) random(0,8); //(int) eliminates decimal point
int randWord = (int) random(0,8); //generates random number between 0 (non-inclusive) and 8 (inclusive)

//int[] numbers = {0,0,0,0,1,1,1,1};
color[] colors = {red,blue,yellow,orange,brown,green,purple,grey}; //array lists: one for listing color values, the other for listing color words
String[] words = {"Red", "Blue", "Yellow", "Orange", "Brown", "Green", "Purple", "Grey"};
//in both array lists, there are a total of 8 values; thus, the random number between 0 and 8 picked in 'int randColor' or 'int randWord' correspond to a value in the list

void setup() {
  size(800,600);
}

void draw() {
  if (mode == intro) {
     intro();
  } else if (mode == game) {
     game();
  } else if (mode == gameOver) {
     gameOver();
  }
}
