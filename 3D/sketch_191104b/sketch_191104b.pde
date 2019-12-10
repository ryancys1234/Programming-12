boolean up, down, left, right, space, shift, w, a, s, d;

int blockSize = 20;

float lx = 1200, ly = height/2 - 4*blockSize, lz = 500; // Why is it "- 4*blockSize"?
float rotx = PI/4, roty = PI/4;
float headAngle;

PVector direction = new PVector(0, -10);
PVector velocity;
PVector strafeDir = new PVector(10, 0);
PVector verticalDir = new PVector(0, 0, -10);
// New PVector that controls left / right (90 degrees to the left or right of the current direction)

ArrayList<Bullet> bullets;

PImage qblock;
PImage map; // Map is 2d

color black = #000000;
color white = #FFFFFF;

void setup() {
  size(1000, 800, P3D);
  qblock = loadImage("gold_ore.png");
  map = loadImage("map.png");
  imageMode(CENTER);
  textureMode(NORMAL);
  bullets = new ArrayList<Bullet>(); // Putting a number inside () sets a limit to the number of objects in the array list
}

void draw() {
  background(255);
  camera(lx, ly, lz, lx+direction.x, ly+0, lz+direction.y, 0, 1, 0);
  direction.rotate(headAngle);
  headAngle = -(pmouseX - mouseX) * 0.01;

  lights();

  strafeDir = direction.copy();
  strafeDir.rotate(PI/2);

  if (up || w) {
    lx = lx + direction.x;
    lz = lz + direction.y;
  }
  if (down || s) {
    lx = lx - direction.x;
    lz = lz - direction.y;
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
  //popMatrix();
  //texturedBox(qblock, width/2, height/2, 0, blockSize);
}

void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;

  while (mapY < map.height) {
    color pixel = map.get(mapX, mapY); // While loop visits every pixel and records color temporarily
    worldX = mapX*blockSize;
    worldZ = mapY*blockSize;
    if (pixel == black) {
      texturedBox1(qblock, worldX, 0, worldZ, blockSize/2);
    }
    mapX++;
    if (mapX > map.width) {
      mapX = 0;
      mapY++;
    }
  }
}

void drawGround() {
  int x = 0;
  int y = 0 + blockSize/2;
  stroke(100);
  strokeWeight(1);
  while (x < map.width*blockSize) {
    line(x, y, 0, x, y, map.height*blockSize);
    x = x + blockSize;
  }

  int z = 0;
  while (z < map.height*blockSize) {
    line(0, y, z, map.width*blockSize, y, z);
    z = z + blockSize;
  }

  noStroke();
}

void mousePressed() {
  bullets.add(new Bullet(lx, ly, lz, direction.x, direction.z));
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
