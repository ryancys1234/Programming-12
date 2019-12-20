class Bullet extends GameObjects {
  int timerBullet;
  float parX, parY, parZ;

  Bullet(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

    lives = 1;
    timerBullet = 100;
    parX = x;
    parY = y;
    parZ = z;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(#2D00FF);
    sphere(10);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y - vy;
    z = z + vz;
    timerBullet--;

    parX = x + random(50);
    parY = y - random(50);
    parZ = z + random(50);

    pushMatrix();
    translate(parX, parY, parZ);
    rotateX(random(PI));
    rotateY(random(PI));
    rotateZ(random(PI));
    fill(#3AFF00);
    box(5);
    popMatrix();

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

  BulletObjects(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;

    lives = 1;
    timerBulletObjects = 100;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(#47FF00);
    box(5);
    noFill();
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y - vy;
    z = z + vz;
    pushMatrix();
    translate(x, y, z);
    rotateX(PI/2);
    stroke(255);
    noFill();
    popMatrix();
    timerBulletObjects--;
    if (timerBulletObjects == 0) {
      lives = 0;
    }
  }
}
