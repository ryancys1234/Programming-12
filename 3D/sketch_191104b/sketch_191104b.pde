boolean up, down, left, right, space, shift, w, a, s, d;

int blockSize = 20;
int horizontal = 1;

float lx = 1200, ly = height/2 - 4*blockSize, lz = 500; // It is "- 4*blockSize" because in the 3d world, vertically up is negative y
float rotx = PI/4, roty = PI/4;
float horizontalHeadAngle = 0, verticalHeadAngle = 0;

PVector horizontalDirection = new PVector(0, -10);
PVector verticalDirection = new PVector(10, 0);
PVector velocity;
PVector gravity = new PVector(0, 0.981);
PVector strafeDir = new PVector(10, 0);
PVector verticalDir = new PVector(0, 0, -10);
// New PVector that controls left / right (90 degrees to the left or right of the current direction)
PVector rainVerticalVelocity = new PVector(0, 50);
PVector fireworksVelocity = new PVector(random(-10, 10), 5, random(-10, 10));

ArrayList<Bullet> bullets;
ArrayList<Rain> rain;
ArrayList<Fireworks> fireworks;
ArrayList<GameObjects> GameObject;

PImage qblock, mblock, wblock, ynblock, concreteblock, neonblock;
PImage map1, map2, map3, map4, map5, map6, map7, map8, map9, map10; // Map is 2d

color black = #000000;
color white = #FFFFFF;

void setup() {
  size(1000, 800, P3D);
  qblock = loadImage("graytex.jpg");
  mblock = loadImage("gold_ore.png");
  wblock = loadImage("whitetex.jpg");
  ynblock = loadImage("yellowneontex.jpg");
  concreteblock = loadImage("concretetex.png");
  neonblock = loadImage("neontex.jpg");
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  map3 = loadImage("map3.png");
  map4 = loadImage("map4.png");
  map5 = loadImage("map5.png");
  map6 = loadImage("map6.png");
  map7 = loadImage("map7.png");
  imageMode(CENTER);
  textureMode(NORMAL);
  bullets = new ArrayList<Bullet>(); // Putting a number inside () sets a limit to the number of objects in the array list
  rain = new ArrayList<Rain>();
  fireworks = new ArrayList<Fireworks>(50);
  GameObject = new ArrayList<GameObjects>();
}

void draw() {
  background(#010D55);
  float dx = lx + horizontalDirection.x;
  float dy = ly + verticalDirection.y;
  float dz = lz + horizontalDirection.y;

  camera(lx, ly, lz, dx, dy, dz, 0, 1, 0);

  horizontalDirection.rotate(horizontalHeadAngle*0.75);
  verticalDirection.rotate(verticalHeadAngle*0.75);
  horizontalHeadAngle = -(pmouseX - mouseX) * 0.01;
  verticalHeadAngle = (pmouseY - mouseY) * 0.01;

  lights();  

  pushMatrix();
  translate(2000, -3000, 7000);
  stroke(255);
  sphere(100);
  popMatrix();

  strafeDir = horizontalDirection.copy();
  strafeDir.rotate(PI/2);

  if (up || w) {
    lx = lx + horizontalDirection.x;
    lz = lz + horizontalDirection.y;
  }
  if (down || s) {
    lx = lx - horizontalDirection.x;
    lz = lz - horizontalDirection.y;
  }
  if (left || a) {
    lx = lx - strafeDir.x;
    lz = lz - strafeDir.y;
  }
  if (right || d) {
    lx = lx + strafeDir.x;
    lz = lz + strafeDir.y;
  }
  if (space) {
    ly = ly + verticalDir.z;
  }
  if (shift) {
    ly = ly - verticalDir.z;
  }
  //pushMatrix();
  drawMap();
  drawGround();
  handleBullets();
  rain.add(new Rain(random(6000), -5000, random(6000), rainVerticalVelocity.x, rainVerticalVelocity.y, 0));
  rain.add(new Rain(random(6000), -5000, random(6000), rainVerticalVelocity.x, rainVerticalVelocity.y, 0));
  rain.add(new Rain(random(6000), -5000, random(6000), rainVerticalVelocity.x, rainVerticalVelocity.y, 0));
  rain.add(new Rain(random(6000), -5000, random(6000), rainVerticalVelocity.x, rainVerticalVelocity.y, 0));
  rain.add(new Rain(random(6000), -5000, random(6000), rainVerticalVelocity.x, rainVerticalVelocity.y, 0));
  handleRain();
  fireworks.add(new Fireworks(2000, -5000, 2000));
  handleFireworks();
  //popMatrix();
  //texturedBox(qblock, width/2, height/2, 0, blockSize);
}

void drawGround() {
  int x = 0;
  int y = 0 + blockSize/2;
  stroke(255);
  strokeWeight(1);
  while (x < map1.width*blockSize) {
    line(x, y, 0, x, y, map1.height*blockSize);
    x = x + blockSize;
  }

  int z = 0;
  while (z < map1.height*blockSize) {
    line(0, y, z, map1.width*blockSize, y, z);
    z = z + blockSize;
  }

  noStroke();
}

void mousePressed() {
  bullets.add(new Bullet(lx, ly, lz, horizontalDirection.x, -verticalDirection.y, horizontalDirection.y));
}

void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
  if (keyCode == ' ') space = true;
  if (keyCode == SHIFT) shift = true;
  if (keyCode == 'W') w = true;
  if (keyCode == 'A') a = true;
  if (keyCode == 'S') s = true;
  if (keyCode == 'D') d = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (keyCode == ' ') space = false;
  if (keyCode == SHIFT) shift = false;
  if (keyCode == 'W') w = false;
  if (keyCode == 'A') a = false;
  if (keyCode == 'S') s = false;
  if (keyCode == 'D') d = false;
}
