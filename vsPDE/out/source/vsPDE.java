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

public class vsPDE extends PApplet {

class Pvector {

  float x, y;
  Pvector(float x_, float y_) {
    x=x_;
    y=y_;
  };
  public void sub(Pvector v ) {
    y=y-v.y;
    x=x-v.x;
  }
  public float mag() {
    return sqrt(x*x+y*y);
  }
  public void mult(float n) {
    x=x*n;
    y=y*n;
  }
  public void div(float n) {
    x=x/n;
    y=y/n;
  }
  public void narmalize() {
    float m=mag();
    if (m!=0) {
      div(m);
    }
  }
};


Pvector center;
Pvector mouse;

public void setup()
{
  
};

public void draw() {
  //background(255);

  
  center =new Pvector(width/2, height/2);
  mouse =new Pvector(mouseX, mouseY);
  mouse.sub(center);
  mouse.narmalize();
  mouse.mult(150);
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
  float m=mouse.mag();
  println(m);
}
  public void settings() {  size(480, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "vsPDE" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
