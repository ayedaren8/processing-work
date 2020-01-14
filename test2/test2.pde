float t=0;
float x=0;
float y=0;
void setup(){
size(640,480);

}
void draw(){
while(x<480){
float n =noise(t);
float y =map(n,0,1,0,width);
t+=0.01;
point(x,y);
x+=1;}
}
