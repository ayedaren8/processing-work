void setup(){
size(960,960);
background(0);
smooth();
  PFont font;
  font = createFont("黑体", 30);
  textFont(font);
}


void draw(){

  //background(0);
  fill(12,255,255);
  text("简谐运动",400,100);
float period =120; //周期
float apmlitude=100;//振幅
float x=apmlitude*cos(TWO_PI*frameCount/period);
float y=apmlitude*cos(TWO_PI*frameCount/period);
translate(width/2,height/2);
line(0,0,x,0);
ellipse(x,0,20,20);
}
