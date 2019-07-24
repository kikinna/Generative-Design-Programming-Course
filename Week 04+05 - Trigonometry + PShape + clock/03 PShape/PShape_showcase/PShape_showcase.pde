// Create regular polygon based on number of vertices and store in PShape
// data structure.
// For the curveVertex function, you need to use P2D renderer.
// Made for PV259 by Kristina Zakopcanova
// 
// CONTROLS
// c        close the shape (connect first and last vertex)
// v        switch between straight line connecting vertices or splines
// mouseX   change the number of vertices

int vertices = 6;
float radius;
float angle_shift = 0;

boolean curve = false;
boolean close = false;

void setup() {
  size(1500, 1500, P2D);

  background(33);

  radius = height/4;
}

void draw() {
  vertices = (int) map(mouseX, 0, width, 3, 20);
  background(33);
  PShape polygon = createShape();

  polygon.beginShape();
  polygon.stroke(#36F1CD);
  polygon.strokeWeight(55);
  polygon.noFill();

  float angle_step = TWO_PI / vertices;
  for (int i = 0; i < vertices; i++) {
    float x = cos(angle_step * i + angle_shift) * radius;
    float y = sin(angle_step * i + angle_shift) * radius;


    if (curve) {
      polygon.curveVertex(x, y);
    } else {
      polygon.vertex(x, y);
    }
  }
  if (close) {
    polygon.endShape(CLOSE);    
  } else {
    polygon.endShape();
  }

  shape(polygon, width/2, height/2);

  angle_shift += 0.01;
  
  textSize(20);
  text("vertices: " + vertices, 10, 30);
}


void keyPressed() {
  if (key == 'v' || key == 'V') curve = !curve;
  if (key == 'c' || key == 'C') close = !close;
  if (key == 's' || key == 'S') saveFrame("PShape_Showcase_####.png");
}
