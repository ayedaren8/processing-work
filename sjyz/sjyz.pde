class Walker {
  int x;
  int y;
  float w;
  
  
  Walker() {  
    x=width/2;
    y=height/2;
  }
  
  
  void display() {
     w = random(66);
    //point(x, y);
    ellipse(x, y,w, w);
    noStroke();
    fill(w,w+15,w+30); 
    
    
    
    
  }
  
  
  void step() {
  
    float r =random(1);
    if (r<0.4) {     
      if (mouseX>x) {
        x++;
      } else {
        x--;
      };

      if (mouseY>y) {
        y++;
      } else {
        y--;
      }
    } else {
      int choice = int(random(4));
      if (choice==0 ) {
        x+=5;
      } else if (choice == 1) {
        y+=5;
      } else if (choice== 2) {
        x-=5;
      } else if (choice ==3 ) {
        y-=5;
      }
    }
  }
}



Walker w;

void setup() {
  size(480, 480);
  w =new Walker();
  background(255);
}

void draw() {
  
  background(255);
  w.step();
  w.display();
}
