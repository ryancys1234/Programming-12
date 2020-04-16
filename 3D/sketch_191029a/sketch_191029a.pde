/* 3D space
- The camera has three different vectors: location, direction, and orientation (tilt)
- The camera function has 9 values: x, y, z (location), dz, dy, dz (direction), tx, ty, tz (tilt)
           ________x
         /|    2D  |
        / | IMAGE  |
       /  |  HERE  |
     z/   |y_______|
             ^ the camera points this way
            [=]

- Three different rotations: rotateX, rotateY, rotateZ
*/

PImage img;

void setup() {
  size(1000,800,P3D); //P3D is the physics engine
  img = loadImage("Processing_3_logo.png");
  imageMode(CENTER);
}

void draw() {
  background(200);
  noFill();
  
  float angle = map(mouseX, 0, mouseY, 0, TWO_PI);
  float angle2 = map(800, 0, 600, 0, TWO_PI);
  
  pushMatrix();
  translate(mouseX, mouseY); //the translate refers to the middle of the sphere and box
  rotateX(angle); //rotations happen through the point (mouseX, mouseY)
  rotateY(angle);
  rotateZ(angle);
  image(img, 0, 0); //assumes z axis is zero if not specified
  box(100); //could have only one parameter. There is no x and y
  fill(0,0,255);
  sphere(50);
  popMatrix();
  rotate(angle);
  grid();
}

void grid() {
  int i = 0;
  while (i < width) { 
    line(0, i, width, i);
    i = i + 20;
  }
  int j = 0;
  while (j < width) {
    line(j, 0, j, width);
    j = j + 20;
  }
}
