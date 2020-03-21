/**
  *PedalPaint
  *
  *Paint on a digital canvas using a bicycle interface. Input recieved via Arduino
  *Bike is coded as an object
  *
  */

import processing.serial.*;
Serial myPort;

Bike myBike;  

float speed = 0;
float radius = 512;
float lineColor = 0;

  
void setup() {
  myBike = new Bike();
  size(750, 750);
  //myPort = new Serial (this,"COM5", 9600);
}

void draw() {
  //if(myPort.available() > 0){
    // radius = myPort.read();
    //}
  
  //background(255);
  myBike.display(radius, speed, lineColor);
  
  float indicator = myBike.indicatorRadius;
  println("Speed=" + speed + "  Radius=" + radius + " IndicatorRadius=" + indicator);
  
  
}

void keyPressed(){
 if(keyCode == UP) {
 speed += .1;
 }
 if(keyCode == DOWN){
   speed -= .1;
 }
 if(keyCode == RIGHT){
   radius += 1;
 }
 if(keyCode == LEFT){
   radius -= 1;
 }
}
