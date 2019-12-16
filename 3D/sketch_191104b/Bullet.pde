class Bullet extends GameObjects{
  int timerBullet;
  int lives;

  Bullet(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

    lives = 1;
    timerBullet = 100;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    lights();
    fill(#2D00FF);
    sphere(10);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y - vy;
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

class BulletObjects extends GameObjects {
  int timerBulletObjects;

  BulletObjects(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

    lives = 1;
    timerBulletObjects = 100;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    lights();
    fill(#47FF00);
    box(5);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y - vy;
    z = z + vz;
    timerBulletObjects--;
    if (timerBulletObjects == 0) {
      lives = 0;
    }
  }
}
