class Rain {
  float x, y, z, vx, vz;
  int timerRain;
  int lives;

  Rain(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
    //vx = _vx;
    //vz = _vz;

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
    y++;
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
