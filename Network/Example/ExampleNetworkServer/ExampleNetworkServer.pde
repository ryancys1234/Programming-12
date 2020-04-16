// Server
// Run the server first, then the client
import processing.net.*;

Server myServer;
String incoming;

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  incoming = "";
  
  myServer = new Server(this, 1234);
  /*  Instantiation statement:
        this,
        no ip address (the server is not connecting but being connected to),
        port number;
  */
}

void draw() {
  background(0);
  fill(255);
  text(incoming, width/2, height/2);
  
  Client myClient = myServer.available(); // Doesn't identify the messages, but the client
  if (myClient != null) { // If there is a client, read the message
    incoming = myClient.readString();
  }
}

void mousePressed() {
  myServer.write("Hello");
}
