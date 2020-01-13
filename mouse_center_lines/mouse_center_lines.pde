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
};


Pvector center;
Pvector mouse;

void setup()
{
  size(480, 480);
  
};

void draw() {
  background(255);
  center =new Pvector(width/2, height/2);
  mouse =new Pvector(mouseX, mouseY);
  mouse.sub(center);
  translate(width/2, height/2);
  line(0, 0,mouse.x,mouse.y);
}
