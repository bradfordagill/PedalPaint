class Bike
{
  float ringSize = 30; // size of ring 
  float arrowSize; // size of arrow
  
  PVector position; // Position of Bike on the screen (Vector: X,Y components)
  PVector velocity; //Speed of Bike (Vector: X,Y components)
  float theta = 0; // steering orientation from zero--starting horizontal and going CW
  float alpha = 0; //absolute orientation of the bike on the screen
  float centerCalibration = 512;  //potentiometer reading while handlebars are centered
  float indicatorRadius;  //placeholder for indicator radius
  //float magnitude = .5; //placeholder for magnitude of the velocity vector
  
  Bike(){
  position = new PVector(width/2,height/2);
  velocity = new PVector(0,0);
  }
  
// ---------------------------------------------------------------------------------------------------  
// ----------------"display" enables the bike and direction/color indicator to appear-----------------
// ---------------------------------------------------------------------------------------------------
  
  void display(float tempRadius, float magnitude, float tempLineColor){
    
      colorMode(RGB,255);
    background(255);
    strokeWeight(1);
    stroke(0);
    
    pushMatrix();
      translate(position.x, position.y);
      rotate(alpha);
      circle(0,0,ringSize);
      
      strokeWeight(1.5);
      stroke(50,0,255);
      line (-(ringSize/4.5), 0, 0, -(ringSize/3));
      line ((ringSize/4.5), 0, 0, -(ringSize/3));
      
      noFill();
      colorMode(HSB, 1023);
      stroke(tempLineColor,1023,1023);
      strokeWeight(3);
      indicatorRadius = magnitude / (sin(theta));
      //---------------(indicator) turning right---------------------
      if(tempRadius <= centerCalibration){
        arc(-indicatorRadius, 0, indicatorRadius * 2, indicatorRadius * 2, 7 * QUARTER_PI, TWO_PI);
      }
      //---------------(indicator) turning left----------------------
      else if(tempRadius == centerCalibration){
        line (0, 0-ringSize/2-6, 0, 0-ringSize/2-106);    
      }
      //---------------(indicator) going straight--------------------
      else if (tempRadius > centerCalibration){
        arc(indicatorRadius, 0, indicatorRadius * 2, indicatorRadius * 2, PI, PI + QUARTER_PI);
      }
     
      //colorMode(RGB,255);
    popMatrix();
    
    if(tempRadius>511 && tempRadius<513){
      theta = 0;
    }
    else{
    theta = map(tempRadius,0,1023,-1.5,1.5);      //use 255 when connected to an Arduino. When not connected to an arduino, use 0,1023,-1.5,1.5
    }     
    alpha = alpha + theta;
    
    velocity.x = magnitude * sin(alpha);
    velocity.y= -1 * magnitude * cos(alpha);

    position.add(velocity);
    
    
      //if you ride off the edge, reset position to other side of the screen
   if(position.y<0){
     position.y=height;
   }
   if(position.y > height){
     position.y=0;
   }
   if(position.x<0){
     position.x=width;
   }
   if(position.x>width){
     position.x=0;
   }  
    
    
  }
  
}
