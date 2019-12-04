class Bullet {
  float x, y, z, vx, vz;
  Bullet(float _x, float _y, float _z, float _vx, float _vz) {
    x = _x;
    y = _y;
    z = _z;
    vx = _vx;
    vz = _vz;
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
  }
}

void handleBullets() {
  int i = 0;
  while (i < bullets.size()) {
    Bullet b = bullets.get(i);
    b.show();
    b.act();
    i++;
  }
}
