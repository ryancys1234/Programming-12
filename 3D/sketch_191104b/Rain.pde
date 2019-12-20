class Rain extends GameObjects {
  int timerRain;
  int circleSize;
  int var1;

  Rain(float _x, float _y, float _z, float _vx, float _vy, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vy = _vy;
    vz = _vz;

    lives = 1;
    timerRain = 500;
    circleSize = 2;
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
      pushMatrix();
      translate(x, y, z);
      rotateX(PI/2);
      stroke(255);
      ellipse(0, 0, circleSize, circleSize);
      var1 = 1;
      popMatrix();
    }
    if (var1 == 1) {
      circleSize++;
    } else if (circleSize == 50) {
      circleSize = circleSize * 0;
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
