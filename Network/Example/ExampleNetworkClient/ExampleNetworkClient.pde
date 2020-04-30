// Chat Client
import processing.net.*;

Client myClient;
String incoming;
String outgoing;
String valid = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM `1234567890-=[];',./~!@#$%^&*()_+{}:|<>?";

void setup() {
  size(800, 800);
  textAlign(CENTER, CENTER);
  textSize(20);
  
  incoming = ""; // Initially, when there is no message
  outgoing = "";
  
  myClient = new Client(this, "127.0.0.1", 1235);
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
  text (incoming, width/2, height/2 - 100); // Prints the message
  text (outgoing, width/2, height/2 + 100);
  
  if (myClient.available() > 0) {
    incoming = myClient.readString(); // Reads the message
  }
}

void keyPressed() {
  if (key == ENTER) {
    myClient.write(outgoing); // Send a message
    outgoing = "";
  } else if (key == BACKSPACE && outgoing.length() > 0) {
    outgoing = outgoing.substring(0, outgoing.length() - 1);
  } else if (valid.contains("" + key)) {
    outgoing = outgoing + key;
    // Key is not a string, but a single character (symbol). Java will convert outgoing + key into a string.
  }
}
