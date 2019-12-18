class Rain extends GameObjects {
  float x, y, z, vx, vy, vz;
  int timerRain;
  int lives;
  int circleSize;

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
      pushMatrix();
      translate(x, y, z);
      stroke(255);
      ellipse(0, 0, circleSize, circleSize);
      popMatrix();
      if (circleSize == 20) {
        circleSize = 0;
      } else {
        circleSize++;
      }
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

//class Ellipse1 extends GameObjects {
//  int lives;

//  Ellipse1(int _x, int _y, int _z, int circleSize, int circleSize) {
//  }

//  void show() {
//  }

//  void act() {
//  }
//}

//void handleEllipse1() {
//  int i = 0;
//  while (i < ellipse1.size()) {
//    Ellipse1 el = ellipse1.get(i);
//    el.show();
//    el.act();
//    if (el.lives == 0) {
//      ellipse1.remove(i);
//    } else {
//      i++;
//    }
//  }
//}
