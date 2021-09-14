class ufoBullet extends GameObject {
  int timerUfoBullet;

  ufoBullet(float varx, float vary) {
    location = new PVector (varx, vary);
    velocity = new PVector (mySpaceship.location.x - varx, mySpaceship.location.y - vary);
    velocity.setMag(5);
    lives = 1;
    timerUfoBullet = 40;
    size = 10;
  }

  void show() {
    noFill();
    stroke(255, 255, 255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    location.add(velocity);
    timerUfoBullet--;
    if (timerUfoBullet == 0) {
      lives = 0;
    }
    int i = 0;
    while (i < myGameObjects.size() ) {
      GameObject myObj = myGameObjects.get(i); //what does this do
      if (myObj instanceof bullet) { //if the spaceship is hit by an ufo bullet
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives = 0;
          myObj.lives = 0;
        }
      }
      i++;
    }
  }
}
