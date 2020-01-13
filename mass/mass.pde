class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;
  float mass;
  Mover () {
    
    randomSeed(int(millis()*15454));
    mass=random(20);
    location = new PVector(random(mass*8,width+40),random(mass*10,height+50));
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
    ellipse(location.x, location.y,mass*16, mass*20);
  }

  void checkEdges() {
    if (location.x>width-mass*8||location.x<=0+mass*8) {
      velocity.x=velocity.x*-1;
    } 
    if (location.y>height-mass*10||location.y<=mass*10) {
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
PVector floot=new PVector(0, -0.05);
PVector gravity=new PVector(0, 0.03);
  textSize(35);
  text("风速："+windy.toString(),100,20);
  fill(0, 102, 153);

  println("风速："+windy.toString());
    background(255);
  mover.applyForce(windy);
  mover.applyForce(floot);
  mover.applyForce(gravity);
  mover.update();
  mover.checkEdges();
  mover.display();
  mover1.applyForce(windy);
  mover1.applyForce(floot);
  mover1.applyForce(gravity);
  mover1.update();
  mover1.checkEdges();
  mover1.display();
 //<>//
}
