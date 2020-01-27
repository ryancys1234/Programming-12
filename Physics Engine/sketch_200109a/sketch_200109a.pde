// Volleyball game based on Slime Volleyball (oneslime.net).
//

import fisica.*;

FWorld world;

boolean leftupkey, leftdownkey, leftleftkey, leftrightkey, rightupkey, rightdownkey, rightleftkey, rightrightkey;
boolean leftCanJump = true, rightCanJump = true;
boolean leftPlayerWins = false, rightPlayerWins = false;

int rightScore = 0, leftScore = 0;
int betweenGamesTime = 0;

FPoly lground, rground, courtDivider;
FBox wall1, wall2, wall3;
FCircle leftBlob, rightBlob, volleyball, lscore1, lscore2, lscore3, rscore1, rscore2, rscore3;

PImage b1, b2, b3, b4, b5, b6, b7, bv;
int wallpaperVar;

ArrayList lcontacts, rcontacts, vcontacts;

void setup() {
  size(1000, 800);

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 800);

  b1 = loadImage("74-745287_width-desktop-background-material-design.jpg");
  b1.resize(1000, 800);
  b2 = loadImage("calendar-april.jpg");
  b2.resize(1000, 800);
  b3 = loadImage("calendar-august.jpg");
  b3.resize(1000, 800);
  b4 = loadImage("calendar-december.jpg");
  b4.resize(1000, 800);
  b5 = loadImage("calendar-june.jpg");
  b5.resize(1000, 800);
  b6 = loadImage("calendar-march.jpg");
  b6.resize(1000, 800);
  b7 = loadImage("calendar-september.jpg");
  b7.resize(1000, 800);
  bv = loadImage("Volleyball.png");
  bv.resize(20, 20);

  wallpaperVar = (int) random(0, 7);

  lground();
  rground();
  courtDivider();
  leftBlob();
  rightBlob();
  wall1();
  wall2();
  wall3();
  volleyball();
  scores();
}

void draw() {
  if (wallpaperVar == 0) {
    background(b1);
    mountainTheme();
  } else if (wallpaperVar == 1) {
    background(b2);
    forestTheme();
  } else if (wallpaperVar == 2) {
    background(b3);
    mountainSeaTheme();
  } else if (wallpaperVar == 3) {
    background(b4);
    snowTheme();
  } else if (wallpaperVar == 4) {
    background(b5);
    poolTheme();
  } else if (wallpaperVar == 5) {
    background(b6);
    greenValleyTheme();
  } else if (wallpaperVar == 6) {
    background(b7);
    autumnTheme();
  }

  world.step();
  world.draw();
  lPlayerControl();
  rPlayerControl();
  volleyballControl();
  
  textSize(25);
  fill(0);
  text("Score: " + rightScore, width*0.80, height*0.10);
  text("Score: " + leftScore, width*0.10, height*0.10);
  
  if (leftScore == 3 && rightPlayerWins == false) {
    leftWins();
    leftWinsMouseReleased();
    leftPlayerWins = true;
  }
  
  if (rightScore == 3 && leftPlayerWins == false) {
    rightWins();
    rightWinsMouseReleased();
    rightPlayerWins = true;
  }
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
  lground.setNoStroke();

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
  rground.setNoStroke();

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
  courtDivider.setNoStroke();

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
  leftBlob = new FCircle(100);
  leftBlob.setPosition(width*0.25, height*0.50);

  leftBlob.setStroke(0);
  leftBlob.setStrokeWeight(1);
  leftBlob.setFill(93, 67, 214);

  leftBlob.setDensity(1);
  leftBlob.setFriction(1);
  leftBlob.setRestitution(0);
  leftBlob.setNoStroke();

  world.add(leftBlob);
}

void rightBlob() {
  rightBlob = new FCircle(100);
  rightBlob.setPosition(width*0.75, height*0.50);

  rightBlob.setStroke(0);
  rightBlob.setStrokeWeight(1);
  rightBlob.setFill(255, 18, 34);

  rightBlob.setDensity(1);
  rightBlob.setFriction(1);
  rightBlob.setRestitution(0);
  rightBlob.setNoStroke();

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
    leftBlob.addImpulse(0, -5000);
  }
  if (leftdownkey) {
    leftBlob.addImpulse(0, 700);
  }
  if (leftrightkey) {
    leftBlob.addImpulse(300, 0);
  }
  if (leftleftkey) {
    leftBlob.addImpulse(-300, 0);
  }
  if (leftBlob.getX() + 25 >= width/2) {
    leftBlob.setPosition(width/2 - 25, leftBlob.getY());
  }
}

void rPlayerControl() {
  rightCanJump = false;
  ArrayList<FContact> rcontacts = rightBlob.getContacts();

  for (FContact c : rcontacts) {
    if (c.contains(rground)) rightCanJump = true;
  }

  if (rightupkey && rightCanJump) {
    rightBlob.addImpulse(0, -5000);
  }
  if (rightdownkey) {
    rightBlob.addImpulse(0, 700);
  }
  if (rightrightkey) {
    rightBlob.addImpulse(300, 0);
  }
  if (rightleftkey) {
    rightBlob.addImpulse(-300, 0);
  }
  if (rightBlob.getX() - 25 <= width/2) {
    rightBlob.setPosition(width/2 + 25, rightBlob.getY());
  }
}

void volleyball() {
  float vXNum = (int) random(2);
  if (vXNum == 0) {
    vXNum = 250;
  } else if (vXNum == 1) {
    vXNum = 750;
  }
  
  volleyball = new FCircle(20);
  volleyball.attachImage(bv);
  volleyball.setPosition(vXNum, height/2 - 100);

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

      wallpaperVar = (int) random(0, 7);

      leftBlob.setPosition(width*0.25, height*0.75-30);
      leftBlob.setVelocity(0, 0);
      leftBlob.setForce(0, 0);
      rightBlob.setPosition(width*0.75, height*0.75-30);
      rightBlob.setVelocity(0, 0);
      rightBlob.setForce(0, 0);
      volleyball.setPosition(width*0.25, height/2);
      volleyball.setVelocity(0, 0);
      volleyball.setForce(0, 0);
    }
  }

  for (FContact v : vcontacts) {
    if (v.contains(lground)) {
      rightScore++;

      wallpaperVar = (int) random(0, 7);

      leftBlob.setPosition(width*0.25, height*0.75-30);
      leftBlob.setVelocity(0, 0);
      leftBlob.setForce(0, 0);
      rightBlob.setPosition(width*0.75, height*0.75-30);
      rightBlob.setVelocity(0, 0);
      rightBlob.setForce(0, 0);
      volleyball.setPosition(width*0.75, height/2);
      volleyball.setVelocity(0, 0);
      volleyball.setForce(0, 0);
    }
  }
}

void scores() { //once a player wins, all of the scoring circles fall off and explode
  lscore1 = new FCircle(25);
  lscore2 = new FCircle(25);
  lscore3 = new FCircle(25);
  rscore1 = new FCircle(25);
  rscore2 = new FCircle(25);
  rscore3 = new FCircle(25);

  lscore1.setPosition (100, height/8);
  lscore2.setPosition (150, height/8);
  lscore3.setPosition (200, height/8);
  rscore1.setPosition (800, height/8);
  rscore2.setPosition (850, height/8);
  rscore3.setPosition (900, height/8);
  
  lscore1.setStatic(true);
  lscore2.setStatic(true);
  lscore3.setStatic(true);
  rscore1.setStatic(true);
  rscore2.setStatic(true);
  rscore3.setStatic(true);
  
  lscore1.setStroke(0);
  lscore2.setStroke(0);
  lscore3.setStroke(0);
  rscore1.setStroke(0);
  rscore2.setStroke(0);
  rscore3.setStroke(0);
  
  lscore1.setStrokeWeight(2);
  lscore2.setStrokeWeight(2);
  lscore3.setStrokeWeight(2);
  rscore1.setStrokeWeight(2);
  rscore2.setStrokeWeight(2);
  rscore3.setStrokeWeight(2);
  
  lscore1.setFill(71, 255, 0);
  lscore2.setFill(71, 255, 0);
  lscore3.setFill(71, 255, 0);
  rscore1.setFill(71, 255, 0);
  rscore2.setFill(71, 255, 0);
  rscore3.setFill(71, 255, 0);

  lscore1.setDensity(1);
  lscore2.setDensity(1);
  lscore3.setDensity(1);
  rscore1.setDensity(1);
  rscore2.setDensity(1);
  rscore3.setDensity(1);
  
  lscore1.setFriction(1);
  lscore2.setFriction(1);
  lscore3.setFriction(1);
  rscore1.setFriction(1);
  rscore2.setFriction(1);
  rscore3.setFriction(1);
  
  lscore1.setRestitution(0);
  lscore2.setRestitution(0);
  lscore3.setRestitution(0);
  rscore1.setRestitution(0);
  rscore2.setRestitution(0);
  rscore3.setRestitution(0);

  if (rightScore == 1) {
    rscore3.setFill(255, 18, 34);
  } else if (rightScore == 2) {
    rscore2.setFill(255, 18, 34);
  } else if (rightScore == 3) {
    rscore1.setFill(255, 18, 34);
    rscore3.setStatic(false);
    rscore2.setStatic(false);
    rscore1.setStatic(false);
  }
  
  if (leftScore == 1) {
    lscore3.setFill(93, 67, 214);
  } else if (leftScore == 2) {
    lscore2.setFill(93, 67, 214);
  } else if (leftScore == 3) {
    lscore1.setFill(93, 67, 214);
    lscore3.setStatic(false);
    lscore2.setStatic(false);
    lscore1.setStatic(false);
  }

  world.add(lscore1);
  world.add(lscore2);
  world.add(lscore3);
  world.add(rscore1);
  world.add(rscore2);
  world.add(rscore3);
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
