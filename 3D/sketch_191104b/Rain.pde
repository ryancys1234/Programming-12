class Rain {
  float x, y, z, vx, vy, vz;
  int timerRain;
  int lives;

  Rain(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

    lives = 1;
    timerRain = 500;
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
    timerRain--;
    if (timerRain == 0) {
      lives = 0;
    }
  }

  void handleRain() {
    int i = 0;
    while (i < rain.size()) {
      Rain rn = rain.get(i);
      rn.show();
      rn.act();
      if (rn.lives == 0) {
        rain.remove(i);
      } else {
        i++;
      }
    }
  }
}
