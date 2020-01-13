class Pvector {

  float x, y;
  Pvector(float x_, float y_) {
    x=x_;
    y=y_;
  };
  void add(Pvector v ) {
    y=y+v.y;
    x=x+v.x;
  }
  void sub(Pvector v ) {
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
};

class Mover {

  Pvector location;
  Pvector velocity;

  Mover() {

    location=new Pvector(random(width), random(height));
    velocity=new Pvector(random(-2, 2), random(-2, 2));
  } 

  void update() {

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
  mover.update();
  mover.checkEdges();
  mover.display();
  
}
