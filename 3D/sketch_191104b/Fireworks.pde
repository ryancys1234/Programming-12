class Fireworks extends GameObjects {
  int timerFireworks;

  Fireworks(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    vx = random(-10, 10);
    vy = 20;
    vz = random(-10, 10);

    lives = 1;
    timerFireworks = 100;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(#FFFFFF);
    sphere(10);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y + vy;
    z = z + vz;
    vy = vy + gravity.y;
    if (y > -2000) {
      lives = 0;
    }
  }
}

void handleFireworks() {
  int i = 0;
  while (i < fireworks.size()) {
    Fireworks fw = fireworks.get(i);
    fw.show();
    fw.act();
    if (fw.lives == 0) {
      fireworks.remove(i);
    } else {
      i++;
    }
  }
}
