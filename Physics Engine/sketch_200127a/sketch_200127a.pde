import fisica.*;

color black = #000000;
color yellow = #5CFC08;
color blue = #1708FC;
color green = #1BCB69;
color red = #F22027;
color grey = #2B99A2;
color brown = #5d8256;

boolean up, down, left, right, w, a, s, d;

PImage map;
int x = 0, y = 0;
int gs = 50;

FWorld world;

void setup() {
  size(1000, 800);
  Fisica.init(this);
  world = new FWorld();

  map = loadImage("Map1.png");

  while (y < map.height) {
    color c = map.get(x, y);

    if (c == black) {
      FBox bl = new FBox (gs, gs);

      bl.setFill(black);
      bl.setPosition(gs*x + gs/2, gs*y + gs/2);
      bl.setStatic(true);

      world.add(bl);
    }
    
    if (c == yellow) {
      
    }
    
    if (c == blue) {
      
    }
    
    if (c == green) {
      
    }
    
    if (c == red) {
      
    }
    
    if (c == grey) {
      
    }
    
    if (c == brown) {
      
    }

    x++; // Moves horizontally
    if (x == map.width) { // If x reached the end, go down one and x = 0
      x = 0;
      y++;
    }
  }
}

void draw() {
  background(255);
  world.step();
  world.draw();
  
  if (left) {
  }
  
  if (right) {
    
  }
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == 'W' || keyCode == 'w') w = true;
  if (keyCode == 'A' || keyCode == 'a') a = true;
  if (keyCode == 'S' || keyCode == 's') s = true;
  if (keyCode == 'D' || keyCode == 'd') d = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == 'W' || keyCode == 'w') w = false;
  if (keyCode == 'A' || keyCode == 'a') a = false;
  if (keyCode == 'S' || keyCode == 's') s = false;
  if (keyCode == 'D' || keyCode == 'd') d = false;
}
