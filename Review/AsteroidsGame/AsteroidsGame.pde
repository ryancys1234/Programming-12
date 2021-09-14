PFont gameFont;

int mode = 0;
final int intro = 0;
final int game = 1;
final int gameOver = 2;
int score = 0;
int livesSpaceship;
int livesUfoDisappears;

boolean upkey, downkey, leftkey, rightkey, spacekey; //used to program the arrow keys and the space key
PImage spaceshipimg; //image inserting variable
PImage ufoimg;
spaceship mySpaceship;
ufo myUfo;
ArrayList<GameObject> myGameObjects; //the arraylist is for GameObjects, which includes bullets

void setup() {
  size(1000, 800);
  gameFont = createFont("Trebuchet MS", 32); //Berlin Sans FB, Autumn Regular, Alien Encounters, Ebrima, Year Supply of Fairy Cakes (it is a font name, and a very creative one)
  spaceshipimg = loadImage("boom-clipart-rocket-blast-10.png");
  spaceshipimg.resize(0, 500);
  imageMode(CENTER);

  ufoimg = loadImage("red-ufo.svg.hi.png");

  mySpaceship = new spaceship(); //instantiation step, very crucial. It is actually constructing the image of the space ship in the computer memory
  myUfo = new ufo();
  myGameObjects = new ArrayList<GameObject> ();

  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());
  myGameObjects.add(new asteroid());

  myGameObjects.add(new ufo());
}
void draw() { //engine code in void draw. It drives the entire game
  background(10); //background supposed to be in the draw function
  mySpaceship.show();
  mySpaceship.act();

  //for(int i = 0; i < myGameObjects.size(); i++) {
  //    GameObject tempname = myGameObjects.get(i);
  //    tempname.show();
  //    tempname.act();
  //    i++;
  //}
  int i = 0;
  while (i < myGameObjects.size() ) { //could also use a for loop
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
      myGameObjects.remove(i);
    } else {
      i++;
    }
  }

  if (mode == intro) {
    intro();
  } else if (mode == game) {
    game();
  } else if (mode == gameOver) {
    gameOver();
  } else if (score == 60) {
    win();
  }
}

void keyPressed() { //records arrow keys in boolean variables
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') spacekey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ') spacekey = false;
}

void mouseReleased() {
  if (mode == intro) {
    introMouseReleased();
  } else if (mode == game) {
    gameMouseReleased();
  } else if (mode == gameOver) {
    gameOverMouseReleased();
  } else if (score == 60) {
    winMouseReleased();
  }
}
