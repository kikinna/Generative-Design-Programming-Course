// Created during lecture PV259 in Autumn 2018

String timestamp;

void setup() {
  size(1520, 1520);
  //fullScreen();
  
  background(255);
  frameRate(5);
  timestamp = year() + "-" + minute() + "-" + millis();
  
  // (HSB, h, s, b, a)
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(13);
  //strokeWeight(5);
  noStroke();
  
  float cell_size = 80;
  
  float saturation = map(mouseX, 0, width, 0, 100);
  float brightness = map(mouseY, 0, height, 0, 100);
  println(saturation);
  
  for(int x = 0; x <= width; x += cell_size) {
    for(int y = 0; y <= height; y += cell_size) {
      //fill(250, 160, 140);
      //fill(frameCount % 256, frameCount % 256, frameCount % 256);
      
      fill(random(200, 260), saturation, brightness);
      ellipse(x + cell_size/2, y + cell_size/2, 50, 50);
    }
  }
  
}



void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Desne se nam dari-" + timestamp + "-####.png");
}
