import fisica.*;

PImage map;
int x = 0, y = 0;

FWorld world;

void setup() {
  Fisica.init(this);
  world = new FWorld();
  
  map = loadImage("map.png");
  
  while (y < map.height) {
    color c = map.get(x, y);
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}

void draw() {
  
}
