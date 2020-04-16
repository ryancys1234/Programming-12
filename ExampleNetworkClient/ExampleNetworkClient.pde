// Client
import processing.net.*;

Client myClient;
String incoming;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  incoming = ""; // Initially, when there is no message
  
  myClient = new Client(this, "127.0.0.1", 1234);
  /*  Instantiation statement:
        this (refers to this sketch),
        ip address of the server (127.0.0.1 is the default home address),
        port number (directs internet traffic to a specific application),
          since 1234 is not used by any other application, it can be set for processing,
          same port number as the server;
  */
}

void draw() {
  background(255);
  fill(0);
  text (incoming, width/2, height/2); // Prints the message
  
  if (myClient.available() > 0) {
    incoming = myClient.readString(); // Reads the message
  }
}

void mousePressed() {
  myClient.write("Hello"); // Send a message
}
