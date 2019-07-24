// Example of using polar coordinates to draw a circle
// Made by Kristina Zakopcanova for PV259

float center_x, center_y;
float radius;
float theta = 0;

void setup() {
  size(1500, 1500);

  background(33);

  center_x = width/2;
  center_y = height/2;

  radius = height/4;

  printArray(PFont.list());
  PFont ibm = createFont("IBM Plex Sans Light", 42);
  textFont(ibm);
}

void draw() {
  // fading effect
  fill(0, 13);
  rect(0, 0, width, height);

  // cartesian coordinates computed from 
  float x = cos(theta) * radius + center_x;
  float y = sin(theta) * radius + center_y;

  noStroke();
  fill(#5DD9C1);
  ellipse(x, y, 30, 30);

  theta += 0.08;
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Circle_Outline_####.png");
}
