class Mover {

  PVector location;
  PVector acceleration;
  PVector velocity;
  PVector dir;

  Mover () {
    location = new PVector(width/2, height/2);
    velocity= new PVector(0, 0);
    acceleration= new PVector(0, 0);
  }

  void update() {

    PVector mouse=new PVector(mouseX, mouseY);
    dir=PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.2);
    acceleration=dir;
    velocity.add(acceleration);
    location.add(velocity);
  }



  void display() {
    ellipse(location.x, location.y, 30, 30);
  }
}
Mover mover=new Mover();

void setup() {
  size(480, 480);
}

void draw() {
  //background(255);
  mover.update();
  mover.display();
}
