## Physics Engine

This unit of Programming 12 is centered on a particular physics engine, Fisica by Richard Marxer (http://www.ricardmarxer.com/fisica).


Notes on fundamental Fisica concepts:

    FWorld world; // Type of object. Many worlds may exist, but only one world is active at a time.
  
    Fisica.init(this); // Refers to this sketch and connects to sketch. always goes in setup.
  
    world = new FWorld(); // This creates the world.
  
  
  
    world.step();
  
    world.draw(); // With two simple lines, all the physics calculations are done.
  
  
  
    FPoly p = new FPoly(); // Most complicated of the f-bodies, where the vertices of the polygon must be specified.
  
    world.add(p); // Add an object to the world. Equivalent to adding an object to an ArrayList.
  
    FBox box = new FBox(25, 100); // FBoxes are the most useful of the FBodies. Adding textures allow for flexible building blocks.
