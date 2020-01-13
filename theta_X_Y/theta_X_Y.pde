float r=1;
float theta=0;

void setup(){
size(960,960);
background(0);
smooth();
}


void draw(){
float x=r*cos(theta);
float y=r*sin(theta);



//point(100+x,100+y);
//stroke(128,255,255);
//line(x+width/2,y+height/2,width/2,height/2);

fill(12,255,255);
noStroke();
ellipse(x+width/2,y+height/2,5,5);
theta+=0.01;
r+=0.1;


}
