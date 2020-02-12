class FBomb extends FBox {
  int timer;

  FBomb() {
    super(gs, gs);
    this.setFillColor(yellow);
    this.setPosition(player.getX(), player.getY() + gs); //Spawns beside the player box.
    world.add(this);

    timer = 60;
  }

  void show() {
  }

  void act() {
    timer--;
    if (timer == 0) {
      explode();
      world.remove(this);
      bomb = null;
    }
  }

  void explode() {
    for (int i = 0; i < bombs.size(); i++) {
      FBox b = bombs.get(i);
      if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 200) {
        float vx = (b.getX() - this.getX())*5;
        float vy = (b.getX() - this.getX())*5;
        b.setVelocity(vx, vy);
        b.setStatic(false);
      }
    }
  }
}
