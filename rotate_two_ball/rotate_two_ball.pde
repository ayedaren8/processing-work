float angle=1;
float aVelocity=10000000;
float aAcceleration=1;

void setup() {
  size(960, 960);
  PFont font;
  font = createFont("黑体", 30);
  textFont(font);
  //frameRate(30);
}
void draw() {
  background(0);
  text("角速度"+aVelocity, 380, 50);
  translate(width/2, height/2); 
  rectMode(CENTER);
  //angle=radians(angle);
  rotate(angle);
  stroke(204,255,255);
  line(50, 0, -50,0 );
  fill(128,255,255);
  ellipse(50, 0, 20, 20);
  ellipse(-50, 0, 20, 20);
    stroke(204,255,255);
  line(100, 0, -100,0 );
  fill(150,255,255);
  ellipse(100, 0, 20, 20);
  ellipse(-100, 0, 20, 20);
  //aVelocity+=aAcceleration;
  angle+=aVelocity;
  
}
