// Chat Server
// Run the server first, then the client
import processing.net.*;

Server myServer;
String incoming;
String outgoing;
String valid = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM `1234567890-=[];',./~!@#$%^&*()_+{}:|<>?";

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  incoming = "";
  outgoing = "";
  
  myServer = new Server(this, 1235);
  /*  Instantiation statement:
        this,
        no ip address (the server is not connecting but being connected to),
        port number;
  */
}

void draw() {
  background(0);
  fill(255);
  text(incoming, width/2, height/2 - 100);
  text(outgoing, width/2, height/2 + 100);
  
  Client myClient = myServer.available(); // Doesn't identify the messages, but the client
  if (myClient != null) { // If there is a client, read the message
    incoming = myClient.readString();
  }
}

void keyPressed() {
  if (key == ENTER) {
    myServer.write(outgoing); // Send a message
    outgoing = "";
  } else if (key == BACKSPACE && outgoing.length() > 0) {
    outgoing = outgoing.substring(0, outgoing.length() - 1);
  } else if (valid.contains("" + key)) {
    outgoing = outgoing + key;
    // Key is not a string, but a single character (symbol). Java will convert outgoing + key into a string.
  }
}
