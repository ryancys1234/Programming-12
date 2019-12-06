class Bullet {
  float x, y, z, vx, vz;
  int timerBullet;
  int lives;

  Bullet(float _x, float _y, float _z, float _vx, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vz = _vz;

    lives = 1;
    timerBullet = 15;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(#104F9B);
    sphere(10);
    popMatrix();
  }

  void act() {
    x = x + vx;
    z = z + vz;
    timerBullet--;
    if (timerBullet == 0) {
      lives = 0;
    }
  }
}

void handleBullets() {
  int i = 0;
  while (i < bullets.size()) {
    Bullet b = bullets.get(i);
    b.show();
    b.act();
    if (b.lives == 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}
