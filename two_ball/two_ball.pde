class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;
  float mass;
  Mover (float mass,float x,float y) {
    this.mass=mass;
    location = new PVector(x,y);
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




Mover[] movers=new Mover[30];


void setup() {
  size(960, 960);
  for(int i=0;i<30;i++){
    randomSeed(int(millis()*15454));
    float mass=random(2,9);
    movers[i]=new Mover(mass,random(mass*8,width-mass*8),random(mass*10,height-mass*10));
  }
  PFont font;
  font = createFont("黑体",20);
  textFont(font);
}


void draw() {
    background(255);
PVector windy=new PVector(map(noise(second(), 1500), 0, 1, -0.015, 0.015), map(noise(second(), 15500), 0, 1, -0.015, 0.015));
PVector floot=new PVector(0, -0.05);
PVector gravity=new PVector(0, 0.03);

  fill(0, 102, 153);
  text("风速："+windy.toString(),100,50);
  println("风速："+windy.toString());
  for(int i=0;i<30;i++){
  movers[i].applyForce(windy);
  movers[i].applyForce(floot);
  movers[i].applyForce(gravity);
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
  } //<>//
}
