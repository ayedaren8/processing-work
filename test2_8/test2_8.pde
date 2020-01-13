class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;

  Mover () {
    randomSeed(int(second()));
    location = new PVector(random(25,width+40),random(40,height+50));
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
    acceleration.add(v);
  }

  void display() {
    ellipse(location.x, location.y,50, 80);
  }

  void checkEdges() {
    if (location.x>width-25||location.x<=0+25) {
      velocity.x=velocity.x*-1;
    } 
    if (location.y>height-40||location.y<=0+40) {
      //acceleration.y=acceleration.y*-1;
      velocity.y=velocity.y*-1;
    }
  }
}




Mover mover;
Mover mover1;

void setup() {
  size(960, 960);
  mover=new Mover();
  mover1=new Mover();
}


void draw() {
PVector windy=new PVector(map(noise(millis(), 1500), 0, 1, -0.015, 0.015), map(noise(millis(), 15500), 0, 1, -0.015, 0.015));
PVector floot=new PVector(0, -0.005);
PVector gravite=new PVector(0, 0.003);
  
  println("风速："+windy.toString());
  mover.applyForce(windy);
  mover.applyForce(floot);
  mover.applyForce(gravite);
  mover.update();
  mover.checkEdges();
  mover.display();
  mover1.applyForce(windy);
  mover1.applyForce(floot);
  mover1.applyForce(gravite);
  mover1.update();
  mover1.checkEdges();
  mover1.display();
 //<>//
}
