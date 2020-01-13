class PVector {

  float x, y;

  PVector(float x_, float y_) {
    x=x_;
    y=y_;
  };
  void add(PVector v ) {
    y=y+v.y;
    x=x+v.x;
  };
  void sub(PVector v ) {
    y=y-v.y;
    x=x-v.x;
  };
  float mag() {
    return sqrt(x*x+y*y);
  };
  void mult(float n) {
    x=x*n;
    y=y*n;
  };
  void div(float n) {
    x=x/n;
    y=y/n;
  };
  void normalize() {
    float m=mag();
    if (m!=0) {
      div(m);
    }
  } ; 
  
  void limit(float max) {
    if ( mag()>max) { 
      normalize();//速度是矢量 不能只对x y分量限制 所以要先单位化 然后乘标量
      mult(max);
    };
    //if(y>10){
    //y=max;
    //}
  };
};

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {

    location=new PVector(width/2, height/2);
    velocity=new PVector(0, 0);
    acceleration =new PVector(-0.001, 0.01);
    topspeed=10;
} 

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
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
float w;

void setup()
{
  size(480, 480);
  mover =new Mover();
};

void draw() {
  background(255);
  mover.update();
  mover.velocity.limit(10);
  w=(float)mover.velocity.mag();
  println(w);
  mover.checkEdges();
  mover.display();
}
