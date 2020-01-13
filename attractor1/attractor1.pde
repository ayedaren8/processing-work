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




class Attractor {
  float mass;
  float G;
  PVector location;
  float x,y;
  

  Attractor(float x_,float y_) {
    x=x_;
    y=y_;
    location=new PVector(x,y);
    mass=20;
    G=40;
  }

  void display() {
    //fill(15, 200);
    //noStroke();
    ellipse(location.x, location.y, mass*10, mass*10);
  } 
  PVector attract(Mover m) {
    PVector force=PVector.sub(location, m.location);
    float distance=force.mag();
    distance=constrain(distance,5,99999);
    force.normalize();//先计算力的距离然后再单位化计算力的方向 不然单位化之后没得算了
    float strength=(G*mass*m.mass)/(distance*distance);
    force.mult(strength);
    return force;
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
    //noStroke();
    fill(0, 102, 153);
    rect(x, y, w, h);
  }
}





Liquid l;

Mover[] movers=new Mover[10];
Attractor[] m1=new Attractor[10];
void setup() {
 
  size(960, 960);
  for (int i=0;i<10;i++){
  randomSeed(int(millis()*154545)+i+int(random(255)));
  float mass=random(2, 7);
  movers[i]=new Mover(mass, int(random(mass*8, width-mass*8)), int(random(mass*10, height-mass*10)));
  m1[i]=new Attractor(random(width), random( height));
  }
  PFont font;
  font = createFont("黑体", 30);
  textFont(font);
}


void draw() {
  PVector windy=new PVector(0.001, 0);  
  //background(255);
  text("模拟万有引力", 380, 50);
  for (int i=0;i<10;i++){
  m1[i].display();
  movers[i].applyForce(m1[i].attract(movers[i]));
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
}

  
  
}
