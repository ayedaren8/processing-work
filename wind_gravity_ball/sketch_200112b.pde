class PVector {

  float x, y;
  PVector(float x_, float y_) {
    x=x_;
    y=y_;
  };
  void add(PVector v ) {
    y=y+v.y;
    x=x+v.x;
  }
  void sub(PVector v ) {
    y=y-v.y;
    x=x-v.x;
  }
  float mag() {
    return sqrt(x*x+y*y);
  }
  void mult(float n) {
    x=x*n;
    y=y*n;
  }
  void div(float n) {
    x=x/n;
    y=y/n;
  }
  void narmalize() {
    float m=mag();
    if (m!=0) {
      div(m);
    }
  }  

  void limit(float max) {
    if (x>10) { 
      x=10;
    }
  }
};

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  Mover() {

    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    acceleration =new PVector(-0.001, 0.01);
  } 

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }
 
 void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }

  void checkEdges() {
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


Mover mover;

void setup()
{
  size(480, 480);
  mover =new Mover();
};

void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}
