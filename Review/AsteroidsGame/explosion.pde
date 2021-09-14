class explosion extends GameObject {
  int timerExplosion;

  explosion() {
    lives = 1;
    timerExplosion = 200;
    location = new PVector (random(width), random(height));
    velocity = new PVector (0, 1);
    velocity.setMag(random(0, 2));
    velocity.rotate(random(TWO_PI));
  }
  explosion(float x, float y) {
    lives = 1;
    timerExplosion = 200;
    location = new PVector(x, y);
    velocity = new PVector(1, 0);
    velocity.setMag(random(0.4, 2));
    velocity.rotate(random(TWO_PI));
  }
  void show() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, 2, 2);
  }

  void act() {
    super.act();
    timerExplosion--;
    if (timerExplosion == 0) {
      lives = 0;
    }
  }
}
