class bullet extends GameObject { //bullets get lives, velocity and location, which are variables in the GameObject class, by this extension
  //extends basically builds on top of the class Bullet
  int timerBullet;
  
  bullet() {
    location = new PVector (mySpaceship.location.x, mySpaceship.location.y);
    //location.x = mySpaceship.location.x;
    //location.y = mySpaceship.location.y;
    velocity = new PVector (mySpaceship.direction.x, mySpaceship.direction.y);
    //velocity.x = mySpaceship.direction.x; //the speed will be very small. Delete this comment if this issue is resolved
    //velocity.y = mySpaceship.direction.y;
    velocity.setMag(50); //sets velocity
    lives = 1; //connects to myObj.lives in asteroid tab
    timerBullet = 15;
    size = 10;
  }

  void show() {
    noFill();
    stroke(255, 255, 255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    //location.add(velocity);
    timerBullet--;
    if (timerBullet == 0) {
      lives = 0;
    }
  }
}
