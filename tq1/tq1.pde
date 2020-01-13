float x,y;
float xspeed=1.0;
float yspeed=1.33;



void setup()
{
size(480,480);

};

void draw(){
ellipse(x,y,50,50);
fill(int(random(255)),int(random(255)),int(random(255)));
noStroke();
x+=xspeed;
y+=yspeed;
if (x>width||x<0){
xspeed=xspeed*-1;
}
if (y>height||y<0){
yspeed=yspeed*-1;
}
 
}
