class spaceship //Class is a blueprint. Every class needs 3 things: instance variable, constructor(s), and behaviour functions
  extends GameObject { //connects to the GameObject class
  //instance variable: it is different from regular variables in that it can mostly be accessible in the class Spaceship
  PVector direction;
  int shotTimer;
  int threshold;

  //constructor(s): it is a function special to this class. No need to put int before the function name
  spaceship() {
    livesSpaceship = 5;
    shotTimer = 0;
    threshold = 10;

    //Without PVectors, setting starting points would be like this:
    //x = width/2;
    //y = height/2
    location = new PVector(width/2, height/2); //with PVectors the x, y coordinates can be put together
    velocity = new PVector(0, 0);
    direction = new PVector(0, -1); //could also be (0, -0.1)
  }

  //behaviour functions (void show, void act)
  void show() {
    pushMatrix();
    translate(location.x, location.y); //rotating only works with translate
    rotate( direction.heading() ); //rotate function, expects a number, not a pvector
    image(spaceshipimg, 0, 0, 120, 200);
    popMatrix();
  }

  void act() { //makes the spaceship move around
    //x = x + vx; these two lines of code will exist if vectors were not used
    //y = y + vy;
    super.act();
    shotTimer++;
    if (upkey) velocity.add(direction); //add direction to velocity so the spaceship will go the way the arrow key ordained
    if (downkey) velocity.sub(direction); //sub means subtract
    if (leftkey) direction.rotate(-radians(4)); //4 degrees is converted to radians
    if (rightkey) direction.rotate(radians(4)); //braces are not required if there is only one result
    if (spacekey && shotTimer >= threshold) { //limits the frequency of firing: if the threshold, or 10 frames here, is not met or has not passed, this if statement is not fulfilled
      myGameObjects.add(new bullet());
      shotTimer = 0;
    }
    int i = 0;
    while (i < myGameObjects.size() ) {
      GameObject myObj = myGameObjects.get(i); //what does this do
      if (myObj instanceof asteroid) { //myObj represents the asteroid's variables now
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) { //if the spaceship is hit by asteroid
          livesSpaceship--;
        }
      }
      i++;
      if (myObj instanceof ufoBullet) { //if the spaceship is hit by an ufo bullet
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          livesSpaceship--;
        }
      }
    }
    if (livesSpaceship == 0) { //when the spaceship dies, reset game
      mode = 2;
      setup();
      score = 0;
      lives = 5;
    }
  }
}
