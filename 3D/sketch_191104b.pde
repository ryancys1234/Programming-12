boolean up, down, left, right;
int blockSize = 20;
float lx = 2500, ly = height/2 - blockSize/2, lz = 2500;
float headAngle = 0;
PVector direction = new PVector(0,-10);
PVector strafeDir = new PVector(10,0);
//new PVector that controls left / right (90 degrees to the left or right of the current direction)

PImage qblock;
PImage map; // map is 2d
color black = #000000;
color white = #FFFFFF;

float rotx = PI/4, roty = PI/4;

void setup() {
  size(1000, 800, P3D);
  qblock = loadImage("gold_ore.png");
  map = loadImage("map.png");
  imageMode(CENTER);
  textureMode(NORMAL);
}

void draw() {
  background(255);
  camera(lx, ly, lz, lx+direction.x, ly+0, lz+direction.y, 0, 1, 0);
  direction.rotate(headAngle);
  headAngle = -(pmouseX - mouseX) * 0.01;
  
  strafeDir = direction.copy();
  strafeDir.rotate(PI/2);
  
  if (up) {
    lx = lz + direction.x;
    lz = lz + direction.y;
  }
  if (down) {
    lz = lz - 10;
  }
  if (left) {
    lx = lx - strafeDir.x;
    lz = lz - strafeDir.y;
  }
  if (right) {
    lx = lx + strafeDir.x;
    lz = lz + strafeDir.y;
  }
  //pushMatrix();
  drawMap();
  drawGround();
  //popMatrix();
  //texturedBox(qblock, width/2, height/2, 0, blockSize);
}

void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = height/2, worldZ = 0;

  while (mapY < map.height) {
    color pixel = map.get(mapX, mapY); //while loop visits every pixel and records color temporarily (this definition might be incorrect, due to incomprehension)
    worldX = mapX*blockSize;
    worldZ = mapY*blockSize;
    if (pixel == black) {
      texturedBox(qblock, worldX, height/2, worldZ, blockSize);
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

void texturedBox(PImage tex, float x, float y, float z, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  beginShape(QUADS);
  noStroke();
  texture(tex);
  // front face
  vertex(-1, -1, 1, 0, 0);
  vertex(1, -1, 1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // back face
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  // bottom face
  vertex(-1, 1, -1, 0, 0);
  vertex(1, 1, -1, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // top face
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);

  // right face
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);

  // left face
  vertex(-1, -1, 1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex(-1, 1, 1, 0, 1);


  endShape();
  popMatrix();
}

void mouseDragged() {
  //rotx = rotx - (0mouseY - mouseY) * 0.01;
  //roty = roty - (pmouseX - mouseX) * 0.01;
}
void keyPressed() {
  if (keyCode == UP) up = true;
  if (keyCode == DOWN) down = true;
  if (keyCode == LEFT) left = true;
  if (keyCode == RIGHT) right = true;
}

void keyReleased() {
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
}
