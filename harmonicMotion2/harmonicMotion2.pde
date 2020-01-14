float angle=0;
float aVelocity=0.05;




class Oscillator{

  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  Oscillator(){
  angle =new PVector();
  velocity =new PVector(ve);
  amplitude =new PVector();
  
  
  
  }


}





void setup(){
size(960,960);
background(0);
smooth();


}


void draw(){


background(0);
float amplitude=100;
float x=amplitude*cos(angle);
angle+=aVelocity;
ellipseMode(CENTER);
translate(width/2,height/2);
line(0,0,x,0);
ellipse(x,0,20,20);



}
