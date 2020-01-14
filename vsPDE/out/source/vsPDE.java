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

float startAngle = 0.0f;
float vAngle = 0.2f;


public void setup() {
  
    background(255);
  // fill(0, 255, 255);


  // background(0);
}

public void draw() {
  background(255);
  float angle=startAngle;
  for (int x = 0; x <= width; x+=5) {
  float y=map(100*sin(angle), -100, 100, height/2-100, height/2+100);
  ellipse(x, y, 5, 5);
  angle+=vAngle;
}  
startAngle+=0.2f;

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
