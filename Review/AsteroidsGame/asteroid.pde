class asteroid extends GameObject {
  //PVector location;
  //PVector velocity;
  //int lives;
  float float1, float2;

  asteroid() {
    lives = 1;
    size = 100;
    location = new PVector (random(width), random(height));
    velocity = new PVector (0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  asteroid(int s, float x, float y) {
    lives = 1;
    size = s;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }

  void show() {
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size); //use size instead of fixed number to introduce flexibility in the code
  }

  void act() {
    super.act();
    int i = 0;
    while (i < myGameObjects.size() ) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof bullet) { //myObj represents the bullet's variables now
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < size/2 + myObj.size/2) {
          lives = 0;
          myObj.lives = 0;
          myGameObjects.add(new asteroid(size/2, location.x, location.y));
          myGameObjects.add(new asteroid(size/3, location.x, location.y));
          score++;
          for (int k = 0; k < 10; k++) {
            myGameObjects.add(new explosion(location.x, location.y));
          }
          if (
        }
      }
      i++;
    }
  }
}
