/*
 *Pedal Paint   
 * 
 * Draw on a digital canvas using a bicycle interface. 
 * Output sent to a Processing sketch.
 */

//define pinouts
const int steeringPin = A0; //potentiometer reading
const int colorPin = A1;    //potentiometer reading
const int pedalPin = 2;     //hall effect sensor for speed
const int paintPin = 3;     //push button

//initialize variables
int steeringValue = 0;  //variable for storing the steering direction
int colorValue = 0;     //variable for storing the color value from the sliding pot
int pedalSpeed = 0;     //variable for storing the pedal speed
int buttonState = 0;    //variable for storing the pushbutton status
 

void setup() {
  Serial.begin(9600);           // initialize serial communications at 9600 bps
  pinMode(steeringPin,INPUT);   //Set pins as inputs
  pinMode(colorPin,INPUT);
  pinMode(pedalPin,INPUT);
  pinMode(paintPin,INPUT);
}


void loop() {
  steeringValue = analogRead(steeringPin);  //Read steering potentiometer
  colorValue = analogRead(colorPin);        //Read color potentiometer
  /*pedalSpeed =
 
  if(paintPin==HIGH)
  {
  buttonState=1;
  }
   
   else{
   buttonState=0;
   }
*/

  Serial.print(steeringValue);
  Serial.print(",");
  Serial.print(colorValue);
  Serial.print(",");
  Serial.print(pedalSpeed);
  Serial.print(",");
  Serial.println(buttonState);

  Serial.write(steeringValue/4);
  Serial.write(colorValue/4);
  Serial.write(pedalSpeed/4);
  Serial.write(buttonState);

  delay(5);
}
