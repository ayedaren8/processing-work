import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class test2 extends PApplet {

float t=0;
float x=0;
float y=0;
public void setup(){


}
public void draw(){
while(x<480){
float n =noise(t);
float y =map(n,0,1,0,width);
t+=0.01f;
point(x,y);
x+=1;}
}
  public void settings() { 
size(640,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
