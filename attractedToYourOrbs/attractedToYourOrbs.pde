int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float C_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int DRAGF = 3;
int ATTRACT = 4;
int SPRING = 5;
boolean[] toggles = new boolean[6];
String[] modes = {"Moving", "Bounce", "Gravity", "Drag", "Attract", "Spring"};

FixedOrb earth;
OrbNode o0, o1, o2, o3;

void setup() {
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000, random(-1, 1));
  makeOrbs();
}//setup

void draw() {
  background(255);
  displayMode();


  o0.display();
  o1.display();

  if (toggles[SPRING]) {
    PVector sf = o0.getSpring(o0.next, SPRING_LENGTH, SPRING_K);
    o0.applyForce(sf);
    sf = o1.getSpring(o1.previous, SPRING_LENGTH, SPRING_K);
    o1.applyForce(sf);

    if (SPRING_LENGTH > dist(o0.center.x, o0.center.y, o1.center.x, o1.center.y)) {
      stroke(0, 255, 0);//red
    } else if (SPRING_LENGTH == dist(o0.center.x, o0.center.y, o1.center.x, o1.center.y)) {
      stroke(0); //black
    } else {
      stroke(255, 0, 0);//green
    }
    
    line(o0.center.x-2, o0.center.y-2, o1.center.x-2, o1.center.y-2);
    line(o0.center.x+2, o0.center.y+2, o1.center.x+2, o1.center.y+2);
  


  PVector cf = o0.getChargeForce(o0.next, C_CONSTANT);
  o0.applyForce(cf);
  cf = o1.getChargeForce(o1.previous, C_CONSTANT);
  o1.applyForce(cf);

  o0.move(toggles[BOUNCE]);
  o1.move(toggles[BOUNCE]);
}
}//draw


void makeOrbs() {
  o0 = new OrbNode();
  o1 = new OrbNode();
  o2 = new OrbNode();
  o3 = new OrbNode();

  o0.next = o1;
  o1.previous = o0;
  o1.next = o2;
  o2.previous = o1;
  o2.next = o3;
  o3.previous = o2;
}


void keyPressed() {
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == 'g') {
    toggles[GRAVITY] = !toggles[GRAVITY];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];
  }
  if (key == 'd') {
    toggles[DRAGF] = !toggles[DRAGF];
  }
  if (key == 'c') {
    toggles[ATTRACT] = !toggles[ATTRACT];
  }
  if (key == 's') {
    toggles[SPRING] = !toggles[SPRING];
  }
  if (key == 'r') {
    makeOrbs();
  }
}//keyPressed

void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
