float angle=1;
float aVelocity=10000000;
float aAcceleration=1;

class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  float aVelocity;
  float aAcceleration;
  float topspeed;
  float mass;

  Mover() {
    mass=1.0;
    topspeed=1;
    location =new PVector(width/2, height/2);
    acceleration =new PVector(0, 0);
    velocity =new PVector(0, 0);
  }

  void update() {
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    acceleration.mult(0);
  }
  void applyForce(PVector v) {
    PVector f=v.get();
    f.div(mass);
    acceleration.add(f);
  }
  void display() {
    angle  =velocity.heading2D();
    stroke(0);
    fill(175);
    pushMatrix();
    //rectMode(CENTER);
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, 30, 10);
    popMatrix();
  }

  void checkEdges() {
    if (location.x>width-mass*8) {
      velocity.x=velocity.x*-1;
      location.x=width-mass*8;
    } else if (location.x<=0+mass*8) {
      velocity.x=velocity.x*-1;
      location.x=0+mass*8;
    }
    if (location.y>width-mass*8) {
      velocity.y=velocity.y*-1;
      location.y=width-mass*8;
    } else if (location.y<=0+mass*8) {
      velocity.y=velocity.y*-1;
      location.y=0+mass*8;
    }
  }
}





Mover car;
PVector power;
PVector nowel;
PVector LPower;
PVector RPower;
void setup() {
  size(960, 960);
  PFont font;
  font = createFont("黑体", 30);
  textFont(font);
  car=new Mover();
  //frameRate(30);
  power=new PVector(0, -0.1);
  nowel=new PVector(0, 0.1);
  LPower=new PVector(-0.1, 0.1);
  RPower=new PVector(0.1, 0.1);
}

void draw() {
  background(255);
  float c=0.001;
  PVector firction= car.velocity.get();
  firction.mult(-1);
  firction.normalize();
  firction.mult(c);
  car.applyForce(firction);
  if (keyPressed) {
    if (keyCode==37) {
     car.applyForce(LPower);
      println("left");
    } else if (keyCode==39) {
            car.applyForce(RPower);
    }else if (keyCode==38) {
             car.applyForce(power);
    }else if (keyCode==40) {
            car.applyForce(nowel);
    }
  }
  car.update();
  car.checkEdges();

  car.display();
}
