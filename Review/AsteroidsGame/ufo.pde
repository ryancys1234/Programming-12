class ufo extends GameObject {
  PVector direction;
  int shotTimerUfo;
  int thresholdUfo;
  int livesUfoDisappear;

  ufo() {
    lives = 1;
    livesUfoDisappear = 3;
    thresholdUfo = 50;
    size = 100;
    location = new PVector (random(width), random(height));
    velocity = new PVector (0, 3);
    direction = new PVector(0, 0);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  //ufo(int u, float x, float y) {
  //  lives = 10;
  //  size = u;
  //  location = new PVector (x, y);
  //  velocity = new PVector (0, 3);
  //  velocity.setMag(random(0, 2));
  //  velocity.rotate(random(TWO_PI));
  //}

  void show() {
    image(ufoimg, location.x, location.y, 50, 50);
  }

  void act() {
    super.act();
    //location.add(velocity);
    shotTimerUfo++;
    if (shotTimerUfo >= thresholdUfo) { //used to control the automatic fire rate. This is the "triggering" of the mechanism
      myGameObjects.add(new ufoBullet(location.x, location.y));
      shotTimerUfo = 0;
    }
    int i = 0;
    while (i < myGameObjects.size() ) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          myObj.lives = 0;
          lives = 0;
          livesUfoDisappear--;
          myGameObjects.add(new ufo());
          textFont(gameFont);
          textAlign(CENTER, CENTER);
          textSize(50);
          text("Teleported", location.x, location.y);
          println(livesUfoDisappear);
        }
        if (livesUfoDisappear == 2) {
          lives = 0;
        }
      }
      i++;
    }
  }
}
