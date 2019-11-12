PImage qblock;
PImage map; // map is 2d
color black = #000000;
color white = #FFFFFF;
int blockSize = 20;
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
  drawMap();
  drawGround();
  //texturedBox(qblock, width/2, height/2, 0, blockSize);
}

void drawMap() {
  pushMatrix();
  rotateX(rotx);
  rotateY(roty);
  int mapX = 0, mapY = 0;
  int worldX = 0, worldY = height/2, worldZ = 0;

  while (mapY < map.height) {
    color pixel = map.get(mapX, mapY); //while loop visits every pixel and records color temporarily (this definition might be incorrect, due to incomprehension)
    if (pixel == black) {
      worldX = mapX*blockSize;
      worldZ = mapY*blockSize;
      texturedBox(qblock, worldX, worldY, worldZ, blockSize);
    }
    mapX++;
    if (mapX > map.width) {
      mapX = 0;
      mapY++;
    }
  }
  popMatrix();
}

void drawGround() {
  int i = 0;
  while (i < 80) {
    line(i, height/2, 0, i, height/2, 1000);
    line(0, height/2, i, 1000, height/2, i);
    i = i + 10;
  }
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
  rotx = rotx + (pmouseY - mouseY) * 0.01;
  roty = roty - (pmouseX - mouseX) * 0.01;
}
