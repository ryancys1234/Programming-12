class Bullet extends GameObject { //bullets get lives, velocity and location, which are variables in the GameObject class, by this extension
  //extends basically builds on top of the class Bullet
  Bullet() {
    location = new PVector (mySpaceship.location.x, mySpaceship.location.y);
    //location.x = mySpaceship.location.x;
    //location.y = mySpaceship.location.y;
    velocity = new PVector (mySpaceship.direction.x, mySpaceship.direction.y);
    //velocity.x = mySpaceship.direction.x; //the speed will be very small. Delete this comment if this issue is resolved
    //velocity.y = mySpaceship.direction.y;
    velocity.setMag(5); //sets velocity
  }

  void show() {
    fill(255, 0, 0);
    ellipse(location.x, location.y, 25, 25);
  }

  void act() {

    location.add(velocity);
  }
}
