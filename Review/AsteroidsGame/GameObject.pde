abstract class GameObject { //an abstract category, not a physical thing
  int lives;
  int size;
  //PVector location, velocity; //have the same values, therefore cannot be put together with location and velocity in defining this local variable
  PVector location;
  PVector velocity; //No need for v.x and v.y

  GameObject() { //defines the categorical class, or that it is one of the requirements / classifications of this category for it to be so
  }

  void show() {
  }

  void act() {
    location.add(velocity);

    if (location.y < -50) location.y = height+50; //cannot use <= but <
    if (location.y > height+50) location.y = -50;
    if (location.x < -50) location.x = width+50;
    if (location.x > width+50) location.x = -50;
  }
}
