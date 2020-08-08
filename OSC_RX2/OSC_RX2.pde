/**
 * OSC receive program
 * Uses OscP5 library
 * OSC explanation video: https://youtu.be/0uOR2idKvrM
 */
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

float value;

void setup() {
  size(400,100);
  /* start oscP5, listening for incoming messages at port 9000 */
  oscP5 = new OscP5(this,9100);
}


void draw() {
  background(0,0,0);  
  fill(0,255,0);
  ellipse(value*width,height/2,20,20);
  

}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkAddrPattern("/hello/1")==true) {
     if(theOscMessage.checkTypetag("f")) {
      value = theOscMessage.get(0).floatValue();
     }
  }
  
}
