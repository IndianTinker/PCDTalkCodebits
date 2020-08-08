
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;

NetAddress myRemoteLocation2;
float value;
String activity = ""; 

void setup() {
  size(400,100);
  oscP5 = new OscP5(this,8000);
  myRemoteLocation2 = new NetAddress("127.0.0.1",9100);
}

void draw() {
  background(64);  
  rect(0,height/2,value*width,20); 
  text(activity + value,10,20);
}

void mouseDragged() {
  sendMessage();
}

void sendMessage() {
  
  activity = "sending: ";
  value = mouseX/float(width);
  OscMessage myMessage = new OscMessage("/hello/1");
  myMessage.add(value); 
  oscP5.send(myMessage, myRemoteLocation2); 
}
