import fisica.*;

FWorld world;

boolean leftupkey, leftdownkey, leftleftkey, leftrightkey, leftspacekey, rightupkey, rightdownkey, rightleftkey, rightrightkey, spacekey;;
boolean leftIfJumped = true, rightIfJumped = true;

void setup() {
  size(1000, 800);

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 800);

  ground();
  courtDivider();
  leftBlob();
  rightBlob();
}

void draw() {
  background(#7ABDE8);

  world.step();
  world.draw();
}

void ground() {
  FPoly box = new FPoly();

  box.vertex(-100, height*0.7);
  box.vertex(-100, height+100);
  box.vertex(width+100, height+100);
  box.vertex(width+100, height*0.7);

  box.setStatic(true);
  box.setFill(102, 183, 91);
  box.setFriction(0.5);

  world.add(box);
}

void courtDivider() {
  FPoly div = new FPoly();

  div.vertex(width/2-5, height*0.7-40);
  div.vertex(width/2+5, height*0.7-40);
  div.vertex(width/2+5, height*0.7);
  div.vertex(width/2-5, height*0.7);

  div.setStatic(true);
  div.setFill(255);
  div.setFriction(0.5);

  world.add(div);
}

void wall1() {
  FPoly w1 = new FPoly();

  w1.vertex(0, -100);
  w1.vertex(0, height+100);
  w1.vertex(-50, height+100);
  w1.vertex(-50, -100);

  w1.setStatic(true);
  w1.setFill(255);
  w1.setFriction(0.5);

  world.add(w1);
}

void wall2() {
  FPoly w2 = new FPoly();

  w2.vertex(-100, 0);
  w2.vertex(-100, -50);
  w2.vertex(width+100, -50);
  w2.vertex(width+100, 0);

  w2.setStatic(true);
  w2.setFill(255);
  w2.setFriction(0.5);

  world.add(w2);
}

void wall3() {
  FPoly w3 = new FPoly();

  w3.vertex(0, -100);
  w3.vertex(0, height+100);
  w3.vertex(width+50, height+100);
  w3.vertex(width+50, -100);

  w3.setStatic(true);
  w3.setFill(255);
  w3.setFriction(0.5);

  world.add(w3);
}

void leftBlob() {
  FCircle c1 = new FCircle(50);
  c1.setPosition(width*0.25, height*0.7-30);

  c1.setStroke(0);
  c1.setStrokeWeight(1);
  c1.setFill(0);

  c1.setDensity(1);
  c1.setFriction(1);
  c1.setRestitution(1);

  world.add(c1);
}

void rightBlob() {
  FCircle c2 = new FCircle(50);
  c2.setPosition(width*0.75, height*0.7-30);

  c2.setStroke(0);
  c2.setStrokeWeight(1);
  c2.setFill(0);

  c2.setDensity(1);
  c2.setFriction(1);
  c2.setRestitution(1);

  world.add(c2);
}

void playerControl() {
  if (leftkey && leftIfJumped) {
    leftBlob.addImpulse(0, -500);
    leftIfJumped = false;
  }

  if (leftkey && leftIfJumped) {
    leftBlob.addImpulse(0, -500);
    leftIfJumped = false;
  }

  if (leftkey && leftIfJumped) {
    leftBlob.addImpulse(0, -500);
    leftIfJumped = false;
  }
}

void keyPressed() {
  if (keyCode == UP) rightupkey = true;
  if (keyCode == DOWN) rightdownkey = true;
  if (keyCode == LEFT) rightleftkey = true;
  if (keyCode == RIGHT) rightrightkey = true;
  if (keyCode == 'W') rightupkey = true;
  if (keyCode == DOWN) rightdownkey = true;
  if (keyCode == LEFT) rightleftkey = true;
  if (keyCode == RIGHT) rightrightkey = true;
}

void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}
