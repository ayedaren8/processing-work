class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;
  float mass;
  Mover (float mass_, int x, int y) {
    mass=mass_;
    location = new PVector(x, y);
    print(location.toString());
    velocity= new PVector(0, 0);
    acceleration= new PVector(0, 0);
    topspeed=10;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
    acceleration.mult(0);
  }

  void applyForce(PVector v) {
    PVector f=v.get();
    f.div(mass);
    acceleration.add(f);
  }

  void display() {
    ellipse(location.x, location.y, mass*16, mass*20);
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
  boolean isinside(Liquid l) {
    if (location.x>l.x&&location.x<l.x+l.w&&location.y>l.y&&location.y<l.y+l.h) {
      return true;
    } else {
      return false;
    }
  }

  void drag(Liquid l) {
    float speed =velocity.mag();
    float dragMag=l.c*speed*speed;
    PVector drag=velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMag);
    applyForce(drag);
  }
}
class Liquid {
  float x, y, w, h, c;
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    c=c_;
    display();
  }

  void display() {
    noStroke();
    rect(x, y, w, h);
  }
}



Mover[] movers=new Mover[30];

Liquid l;
void setup() {
  size(960, 960);
  for (int i=0; i<30; i++) {
    randomSeed(int(millis()*154545)+i+int(random(255)));
    float mass=random(2, 7);
    movers[i]=new Mover(mass, int(random(mass*8, width-mass*8)), int(random(mass*10, height-mass*10)));
  }
  PFont font;
  font = createFont("黑体", 30);
  textFont(font);
 
  background(255);
}


void draw() {

  PVector windy=new PVector(0.001, 0);


  background(255);
  text("模拟流体阻力", 380, 50);
  fill(0, 102, 153);
  for (int i=0; i<movers.length; i++) {
     l=new Liquid(400,500,400,100,0.1);
    float m=movers[i].mass;
    PVector gravity=new PVector(0, 0.1);
    PVector floot=new PVector(0, -0.01);
    float c=0.01;
    float normal=1;
    float frictionMag=c*normal;
    PVector friction= movers[i].velocity.get();
    friction.normalize();
    friction.mult(-1);
    friction.mult(frictionMag);
    if (movers[i].isinside(l)){
      movers[i].drag(l);
    
    }
    movers[i].applyForce(friction);
    movers[i].applyForce(windy);
    //movers[i].applyForce(floot);
    movers[i].applyForce(gravity);
    movers[i].update();
    println(movers[i].velocity.mag());
    movers[i].display();
    movers[i].checkEdges();
  }
}
