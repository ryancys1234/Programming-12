import fisica.*;

FWorld world;

boolean leftupkey, leftdownkey, leftleftkey, leftrightkey, rightupkey, rightdownkey, rightleftkey, rightrightkey;
boolean leftCanJump = true, rightCanJump = true;

int rightScore = 0, leftScore = 0;
int betweenGamesTime = 0;

FPoly lground, rground, courtDivider;
FBox wall1, wall2, wall3;
FCircle leftBlob, rightBlob, volleyball;

PImage b1, b2, b3, b4, b5, b6, b7, bv;

ArrayList lcontacts, rcontacts, vcontacts;
String[] wallpapers = {"a", "b", "c", "d", "e", "f", "g"};

void setup() {
  size(1000, 800);

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 800);
  
  b1 = loadImage("74-745287_width-desktop-background-material-design.jpg");
  b2 = loadImage("calendar-april.jpg");
  b3 = loadImage("calendar-august.jpg");
  b4 = loadImage("calendar-december.jpg");
  b5 = loadImage("calendar-june.jpg");
  b6 = loadImage("calendar-march.jpg");
  b7 = loadImage("calendar-september.jpg");
  bv = loadImage("Volleyball.png");
  bv.resize(25, 25);
  
  lground();
  rground();
  courtDivider();
  leftBlob();
  rightBlob();
  wall1();
  wall2();
  wall3();
  volleyball();
}

void draw() {
  background(random(wallpapers.length));

  world.step();
  world.draw();
  lPlayerControl();
  rPlayerControl();
  volleyballControl();
  
  textSize(25);
  text("Score: " + rightScore, width*0.90, height*0.10);
  text("Score: " + leftScore, width*0.10, height*0.10);
}

void lground() {
  lground = new FPoly();

  lground.vertex(-100, height*0.75);
  lground.vertex(-100, height+100);
  lground.vertex(width/2, height+100);
  lground.vertex(width/2, height*0.75);

  lground.setStatic(true);
  lground.setFill(102, 183, 91);
  lground.setFriction(0);

  world.add(lground);
}

void rground() {
  rground = new FPoly();

  rground.vertex(width/2, height*0.75);
  rground.vertex(width/2, height+100);
  rground.vertex(width+100, height+100);
  rground.vertex(width+100, height*0.75);

  rground.setStatic(true);
  rground.setFill(102, 183, 91);
  rground.setFriction(0);

  world.add(rground);
}

void courtDivider() {
  courtDivider = new FPoly();

  courtDivider.vertex(width/2-5, height*0.75-50);
  courtDivider.vertex(width/2+5, height*0.75-50);
  courtDivider.vertex(width/2+5, height*0.75);
  courtDivider.vertex(width/2-5, height*0.75);

  courtDivider.setStatic(true);
  courtDivider.setFill(255);
  courtDivider.setFriction(0.5);

  world.add(courtDivider);
}

void wall1() {
  wall1 = new FBox(500, height);

  wall1.setPosition(-250, height/2);

  wall1.setStatic(true);
  wall1.setFill(0);
  wall1.setFriction(0);

  world.add(wall1);
}

void wall2() {
  wall2 = new FBox(width, 500);

  wall2.setPosition(width/2, -250);

  wall2.setStatic(true);
  wall2.setFill(0);
  wall2.setFriction(0);

  world.add(wall2);
}

void wall3() {
  wall3 = new FBox(500, height);

  wall3.setPosition(width+250, height/2);

  wall3.setStatic(true);
  wall3.setFill(0);
  wall3.setFriction(0.5);

  world.add(wall3);
}

void leftBlob() {
  leftBlob = new FCircle(50);
  leftBlob.setPosition(width*0.25, height*0.75-30);

  leftBlob.setStroke(0);
  leftBlob.setStrokeWeight(1);
  leftBlob.setFill(93, 67, 214);

  leftBlob.setDensity(1);
  leftBlob.setFriction(1);
  leftBlob.setRestitution(0);

  world.add(leftBlob);
}

void rightBlob() {
  rightBlob = new FCircle(50);
  rightBlob.setPosition(width*0.75, height*0.75-30);

  rightBlob.setStroke(0);
  rightBlob.setStrokeWeight(1);
  rightBlob.setFill(206, 48, 48);

  rightBlob.setDensity(1);
  rightBlob.setFriction(1);
  rightBlob.setRestitution(0);

  world.add(rightBlob);
}

void lPlayerControl() {
  leftCanJump = false;
  ArrayList<FContact> lcontacts = leftBlob.getContacts();

  //int i = 0; //i stands for index
  //while (i < lcontacts.size) {
  //  Contact lc = lcontacts.get(i);
  //  if (c.contains(ground)) leftCanJump = true;
  //  i++;
  //}

  for (FContact c : lcontacts) { // Assumes the list is not going to change.
    if (c.contains(lground)) leftCanJump = true;
  }

  if (leftupkey && leftCanJump) {
    leftBlob.addImpulse(0, -1400);
  }
  if (leftdownkey) {
    leftBlob.addImpulse(0, 700);
  }
  if (leftrightkey && leftCanJump) {
    leftBlob.addImpulse(300, 0);
  }
  if (leftleftkey && leftCanJump) {
    leftBlob.addImpulse(-300, 0);
  }
  if (leftBlob.getX() >= width/2) {
    leftBlob.setPosition(width/2, leftBlob.getY());
  }
}

void rPlayerControl() {
  rightCanJump = false;
  ArrayList<FContact> rcontacts = rightBlob.getContacts();

  for (FContact c : rcontacts) {
    if (c.contains(rground)) rightCanJump = true;
  }

  if (rightupkey && rightCanJump) {
    rightBlob.addImpulse(0, -1400);
  }
  if (rightdownkey) {
    rightBlob.addImpulse(0, 700);
  }
  if (rightrightkey && rightCanJump) {
    rightBlob.addImpulse(300, 0);
  }
  if (rightleftkey && rightCanJump) {
    rightBlob.addImpulse(-300, 0);
  }
  if (rightBlob.getX() <= width/2) {
    rightBlob.setPosition(width/2, rightBlob.getY());
  }
}

void volleyball() {
  volleyball = new FCircle(10);
  volleyball.attachImage(bv);
  volleyball.setPosition(width*0.75, height/2);

  volleyball.setStroke(0);
  volleyball.setStrokeWeight(1);
  volleyball.setFill(152, 250, 73);

  volleyball.setDensity(1);
  volleyball.setFriction(0);
  volleyball.setRestitution(1);

  world.add(volleyball);
}

void volleyballControl() {
  ArrayList<FContact> vcontacts = volleyball.getContacts();
  
  for (FContact v : vcontacts) {
    if (v.contains(rground)) {
      leftScore++;
      //betweenGamesTime++;
      //if (betweenGamesTime == 1) {
        leftBlob.setPosition(width*0.25, height*0.75-30);
        leftBlob.setVelocity(0, 0);
        leftBlob.setForce(0, 0);
        rightBlob.setPosition(width*0.75, height*0.75-30);
        rightBlob.setVelocity(0, 0);
        rightBlob.setForce(0, 0);
        volleyball.setPosition(width*0.25, height/2);
        volleyball.setVelocity(0, 0);
        volleyball.setForce(0, 0);
      //}
    }
  }
  
  for (FContact v : vcontacts) {
    if (v.contains(lground)) {
      rightScore++;
      //betweenGamesTime++;
      //if (betweenGamesTime == 1) {
        leftBlob.setPosition(width*0.25, height*0.75-30);
        leftBlob.setVelocity(0, 0);
        leftBlob.setForce(0, 0);
        rightBlob.setPosition(width*0.75, height*0.75-30);
        rightBlob.setVelocity(0, 0);
        rightBlob.setForce(0, 0);
        volleyball.setPosition(width*0.75, height/2);
        volleyball.setVelocity(0, 0);
        volleyball.setForce(0, 0);
      //}
    }
  }
}

void keyPressed() {
  if (keyCode == UP) rightupkey = true;
  if (keyCode == DOWN) rightdownkey = true;
  if (keyCode == LEFT) rightleftkey = true;
  if (keyCode == RIGHT) rightrightkey = true;
  if (keyCode == 'W' || keyCode == 'w') leftupkey = true;
  if (keyCode == 'S' || keyCode == 's') leftdownkey = true;
  if (keyCode == 'A' || keyCode == 'a') leftleftkey = true;
  if (keyCode == 'D' || keyCode == 'd') leftrightkey = true;
}

void keyReleased() {
  if (keyCode == UP) rightupkey = false;
  if (keyCode == DOWN) rightdownkey = false;
  if (keyCode == LEFT) rightleftkey = false;
  if (keyCode == RIGHT) rightrightkey = false;
  if (keyCode == 'W' || keyCode == 'w') leftupkey = false;
  if (keyCode == 'S' || keyCode == 's') leftdownkey = false;
  if (keyCode == 'A' || keyCode == 'a') leftleftkey = false;
  if (keyCode == 'D' || keyCode == 'd') leftrightkey = false;
}
