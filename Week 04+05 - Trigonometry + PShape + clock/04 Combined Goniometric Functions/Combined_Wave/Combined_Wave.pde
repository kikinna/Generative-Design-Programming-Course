// 
//
// CONTROLS
// mouseX  determines the size of angle increment between two frames
// mouseY  determines the size of angle increment between two neighbouring vertices
// d       show/hide line connecting all vertices

float init_theta = 0;
PVector interaction;
boolean debug;

PShape path;

void setup() {
  size(2500, 1500);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  background(33);
  fill(#36F1CD);
  
  // stores angle values defined by a position of user mouse
  interaction = new PVector();
}

void draw() {
  //background(33);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
  
  noStroke();
  fill(#36F1CD, 30);
  float curr_theta = init_theta;
  
  path = createShape();
  
  path.beginShape();
  path.noFill();
  path.stroke(360, 30);
  path.strokeWeight(3);
  
  for (int x = 0; x < width; x += 40) {
    fill(lerpColor(#36F1CD,#454ADE,map(x, 0, width, 0, 1)));
    
    // simple sine function
    //float y = sin(curr_theta) * height/2 + height/2;
    
    float y = sin(curr_theta) * height/6 
            + sin(curr_theta*2) * height/8
            + cos(curr_theta*3.7) * height/12
            + height/2;
    path.vertex(x, y);
    
    ellipse(x, y, 42, 42);
    
    interaction.y = map(mouseY, 0, height, 0, 1.50);
    curr_theta += interaction.y;
    //curr_theta += 0.2;
  }
  path.endShape();
  
  if (debug) {
    shape(path);
  }
  
  interaction.x = map(mouseX, 0, width, 0, 1.00);
  init_theta += interaction.x;
  //init_theta += 0.05;
  
  textSize(40);
  text(interaction.toString(), 10, height - 10);
}

void keyPressed() {
  if (key == 'd' || key == 'D') debug = !debug;
  if (key == 's' || key == 'S') saveFrame("Combined_Wave_####.png");

}
