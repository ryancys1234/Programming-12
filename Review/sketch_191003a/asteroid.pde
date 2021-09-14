class asteroid extends GameObject {
  //PVector location;
  //PVector velocity;
  //int lives;     these are local variables if you want you can just // it and it will not be linked to the main tab.

  asteroid() {
  }



  void show() {
    fill(255);
    ellipse(location.x, location.y, lives+50, lives+50);
  }

  void act() {
    super.act();
    int i = 0;
    if (i < myGameObjects.size() ) {
      GameObject myObj = myGameObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(myObj.location.x, myObj.location.y, location.x, location.y) < radii) {
          lives = 0;
        }
      }
    }
  }
}
