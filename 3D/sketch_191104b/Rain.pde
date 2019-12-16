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
    stroke(#FFFFFF);
    rect(0, 0, 2, 30);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y + vy;
    z = z + vz;
    if (y > 0) {
      lives = 0;
      //for (float px = x, py = y, pz = z, pvx = -vx, pvy = -vy, pvz = -vz; py > -5; px = px + pvx, py = py - pvy, pz = pz + pvz) {
      //  pushMatrix();
      //  translate(px, py, pz);
      //  stroke(#FFFFFF);

      //  box(3);
      //  popMatrix();
      //}
    }
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
