class Pvector {

  float x, y;
  Pvector(float x_, float y_) {
    x=x_;
    y=y_;
  };
  void add(Pvector v ) {
    y+=v.y;
    x+=v.x;
  }
};


Pvector location;
Pvector velocity;

void setup()
{
  size(480, 480);
  location =new Pvector(100, 100);
  velocity =new Pvector(2, 2.5);
};

void draw() {

  location.add(velocity);
  ellipse(location.x, location.y, 50, 50);
  fill(int(random(255)), int(random(255)), int(random(255)));
  noStroke();

  if (location.x>width||location.x<0) {
    velocity.x=velocity.x*-1;
  };
  if (location.y>width||location.y<0) {
    velocity.y=velocity.y*-1;
  };
}
