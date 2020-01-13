class Pvector {

  float x, y;
  Pvector(float x_, float y_) {
    x=x_;
    y=y_;
  };
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


Pvector center;
Pvector mouse;

void setup()
{
  size(480, 480);
};

void draw() {
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
