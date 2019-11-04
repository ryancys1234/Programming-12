PImage qblock;

float rotx = PI/4, roty = PI/4;

void setup() {
  size(1000, 800, P3D);
  qblock = loadImage("gold_ore.png");
  imageMode(CENTER);
  textureMode(NORMAL);
}

void draw() {
  background(255);

  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotx);
  rotateY(roty);
  scale(100);
  texturedBox(qblock);
  popMatrix();
}

void texturedBox(PImage tex) {
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
  vertex(-1, 1, 1, 0, 0);
  vertex(-1, 1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);

  // top face
  vertex(-1, -1, -1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);

  // left face
  vertex(-1, 1, -1, 0, 0);
  vertex(-1, 1, 1, 1, 0);
  vertex(-1, -1, 1, 1, 1);
  vertex(-1, -1, -1, 0, 1);

  // left face
  vertex(1, 1, -1, 0, 0);
  vertex(1, 1, 1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(1, -1, -1, 0, 1);


  endShape();
}

void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY) * 0.01;
  roty = roty + (pmouseX - mouseX) * 0.01;
}
