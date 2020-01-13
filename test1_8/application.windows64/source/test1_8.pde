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

  void update() {

    PVector mouse=new PVector(mouseX, mouseY);
    dir=PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.2);
    acceleration=dir;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(topspeed);
  }



  void display() {
    ellipse(location.x, location.y, 30, 30);
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
Mover[] movers=new Mover[20];

void setup() {
  size(960, 960);
  for (int i=0; i<20; i++) {
    movers[i] =new Mover();//实例化数组中的每个对象
  }
}

void draw() {
   //background(255);
  for (int i=0; i<20; i++) {
    
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}
