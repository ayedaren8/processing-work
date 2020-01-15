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

class Pendulum {
  float r;
  float angle;
  float aVeloctiy;
  float aAcceleration;
  float damping;
  PVector location;
  PVector origin;
  Pendulum(PVector origin_, float r_) {
    origin = origin_.get();
    location = new PVector();
    r = r_;
    angle = PI / 4;
    aVeloctiy = 0.0f;
    damping = 0.995f;
  }
  public void go() {
    update();
    display();
  }


  public void update() {
    float gravity = 0.4f;
    aAcceleration = (- 1* gravity / r) * sin(angle);
    aVeloctiy += aAcceleration;
    angle += aVeloctiy;
    aVeloctiy *= damping;


  }
  public void display(){
  location.set(r * sin(angle), r * cos(angle));
  location.add(origin);
  stroke(0);
  line(origin.x, origin.y, location.x, location.y); 
  fill(175); 
  ellipse(location.x, location.y, 16, 16);
  }
  }

Pendulum p;
public void setup() {
  
  p=new Pendulum(new PVector(width/2,10),125);
}

public void draw() {
  background(255);  
  p.go();
}
  public void settings() {  size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "vsPDE" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
