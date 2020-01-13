class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;
  float topspeed;
  float mass;
  Mover (float mass,int x,int y) {
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
    if (location.x>width-mass*8) {
      velocity.x=velocity.x*-1;
      location.x=width-mass*8;
    } else if(location.x<=0+mass*8){
      velocity.x=velocity.x*-1;
      location.x=0+mass*8;
    }
    if (location.y>width-mass*8) {
      velocity.y=velocity.y*-1;
      location.y=width-mass*8;
    } else if(location.y<=0+mass*8){
      velocity.y=velocity.y*-1;
      location.y=0+mass*8;
    }
  }
}




Mover[] movers=new Mover[30];


void setup() {
  size(960, 960);
  for(int i=0;i<30;i++){
    randomSeed(int(millis()*154545)+i+int(random(255)));
    float mass=random(2,7);
    movers[i]=new Mover(mass,int(random(mass*8,width-mass*8)),int(random(mass*10,height-mass*10)));
  }
  PFont font;
  font = createFont("黑体",20);
  textFont(font);
       background(255);
}


void draw() {

PVector windy=new PVector(map(noise(second(), 1500), 0, 1, -0.15, 0.15), map(noise(second(), 15500), 0, 1, -0.15, 0.15));


  background(255);
  fill(0, 102, 153);
  text("风速："+windy.toString(),100,50);
  println("风速："+windy.toString());
  for(int i=0;i<30;i++){
  float m=movers[i].mass;
  PVector gravity=new PVector(0, 0.1*m);
  PVector floot=new PVector(0, -0.01);
  movers[i].applyForce(windy);
  movers[i].applyForce(floot);
  movers[i].applyForce(gravity);
  movers[i].update();
  println(movers[i].velocity.mag());
  movers[i].display();
    movers[i].checkEdges();
   
  } //<>//
}
