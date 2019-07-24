PVector prev;
PVector prevprev;

void setup() {
  size(720, 720);

  background(13);
  prev = new PVector();
  prevprev = new PVector();
  frameRate(10);
}

void draw() {
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  
  //background(13);
  strokeWeight(15);
  
  int cells = 20;

  for (int i = 0; i < 3; i++) {
    //stroke(#43AA8B);
    stroke(random(30, 90), random(140, 200), random(110, 170));
    if (random(1) < 0.05) { 
      stroke(#FF6F59);
    }
    
    float y = int(random(cells)) * (width/cells);
    float x = int(random(10)) * (width/10) + 15;
    float length = 40;
    line(x, y, x+length, y);
    line(y, x, y, x+length);
    
    line(width-x, height-y, width-x-length, height-y);
    line(height-y, width-x, height-y, width-x-length);
    
  }

  prevprev = new PVector(prev.x, prev.y);
  prev = new PVector(pmouseX, pmouseY);
}


void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Line Symmetry ####.png");
}
