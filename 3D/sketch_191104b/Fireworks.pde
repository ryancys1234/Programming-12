class Fireworks {
  float x, y, z, vx, vy, vz;
  int timerFireworks;
  int lives;

  Fireworks(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

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
    
    if (y < -5000) {
      y = y + vy;
    } else {
      y = y - vy;
    }
  }
}
