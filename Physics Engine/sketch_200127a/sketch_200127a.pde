import fisica.*;

color black = #000000;
color yellow = #5CFC08;
color blue = #1708FC;
color green = #1BCB69;
color red = #F22027;
color grey = #2B99A2;
color brown = #5d8256;

boolean up, down, left, right, w, a, s, d;
boolean canJump = false;

PImage map;
int x = 0, y = 0;
int gs = 20;

FBox blck, yllw, bl, gr, rd, brwn;
FBox player;

ArrayList contacts;

FWorld world;

void setup() {
  size(1000, 800);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);

  map = loadImage("Map2.png");

  //blck = new FBox (gs, gs);
  //blck.setFill(black);
  //blck.setPosition(gs*x + gs/2, gs*y + gs/2);
  //blck.setName("ground");
  //blck.setStatic(true);

  //world.add(blck);

  while (y < map.height) {
    color c = map.get(x, y);

    if (c == black) {
      blck = new FBox (gs, gs);
      blck.setFill(black);
      blck.setPosition(gs*x + gs/2, gs*y + gs/2);
      blck.setStatic(true);

      world.add(blck);
    }

    if (c == blue) {
      bl = new FBox (gs, gs);

      bl.setFill(blue);
      bl.setPosition(gs*x + gs/2, gs*y + gs/2);
      bl.setStatic(true);

      world.add(bl);
    }

    if (c == green) {
      gr = new FBox (gs, gs);

      gr.setFill(green);
      gr.setPosition(gs*x + gs/2, gs*y + gs/2);
      gr.setStatic(true);

      world.add(gr);
    }

    if (c == brown) {
      brwn = new FBox (gs, gs);

      brwn.setFill(brown);
      brwn.setPosition(gs*x + gs/2, gs*y + gs/2);
      brwn.setStatic(true);

      world.add(brwn);
    }

    x++; // Moves horizontally
    if (x == map.width) { // If x reached the end, go down one and x = 0
      x = 0;
      y++;
    }
  }

  player = new FBox(gs*2, gs*2);
  player.setPosition(width*0.25, height*0.50);

  player.setStroke(0);
  player.setStrokeWeight(1);
  player.setFill(black);

  player.setDensity(1);
  player.setFriction(1);
  player.setRestitution(0);
  player.setNoStroke();
  player.setRotatable(false);

  world.add(player);
}

void draw() {
  background(255);

  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();

  canJump = false;
  ArrayList<FContact> contacts = player.getContacts();

  for (FContact c : contacts) {
    if (c.contains(blck)) canJump = true;
  }

  if (up && canJump == true || w && canJump == true) {
    player.addImpulse(0, -100);
  }
  if (down || s) {
    player.addImpulse(0, 100);
  }
  if (right || d) {
    player.addImpulse(100, 0);
  }
  if (left || a) {
    player.addImpulse(-100, 0);
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
