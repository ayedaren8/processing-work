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

public class test1_8 extends PApplet {

class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;

  Mover () {
    location = new PVector(random(width), random(height));
    velocity= new PVector(0, 0);
    acceleration= new PVector(0, 0);
    topspeed=10;
  }

  public void update() {

    PVector mouse=new PVector(mouseX, mouseY);
    dir=PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.2f);
    acceleration=dir;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
  }



  public void display() {
    ellipse(location.x, location.y, 30, 30);
  }

  public void checkEdges() {
    if (location.x>width) {
      location.x=0;
    } else if (location.x<0) {
      location.x=width;
    }
    if (location.y>height) {
      location.y=0;
    } else if (location.y<0) {
      location.y=height;
    }
  }
}
Mover[] movers=new Mover[20];

public void setup() {
  
  for (int i=0; i<20; i++) {
    movers[i] =new Mover();//实例化数组中的每个对象
  }
}

public void draw() {
   //background(255);
  for (int i=0; i<20; i++) {
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
  public void settings() {  size(960, 960); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test1_8" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
