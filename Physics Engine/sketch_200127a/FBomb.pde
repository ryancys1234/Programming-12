class FBomb extends FBox {
  int timer;
  
  FBomb() {
    super(gs, gs);
    this.setFillColor(yellow);
    this.setPosition(player.getX() + gs, player.getY()); //Spawns beside the player box.
    world.add(this);
    
    timer = 60;
  }
  
}
