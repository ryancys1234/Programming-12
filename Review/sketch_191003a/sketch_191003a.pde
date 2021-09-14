boolean upkey, downkey, leftkey, rightkey, spacekey; //used to program the arrow keys and the space key
PImage spaceshipimg; //image inserting variable
spaceship mySpaceship;
ArrayList<GameObject> myGameObjects; //the arraylist is for GameObjects, which includes bullets

void setup() {
  size(800, 800);
  spaceshipimg = loadImage("boom-clipart-rocket-blast-10.png");
  imageMode(CENTER);
  mySpaceship = new spaceship(); //instantiation step, very crucial. It is actually constructing the image of the space ship in the computer memory
  myGameObjects = new ArrayList<GameObject> ();

}
void draw() {
  background(255); //background supposed to be in the draw function
  mySpaceship.show();
  mySpaceship.act();

//for(int i = 0; i < myGameObjects.size(); i++{
//    GameObject tempname = myGameObjects.get(i);
//    tempname.show();
//    tempname.act();
//    i++;
//}
  int i = 0;
  while (i < myGameObjects.size() ) { //could also use a for loop
  
    GameObject tempname = myGameObjects.get(i);
    tempname.show();
    tempname.act();
    i++;
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
