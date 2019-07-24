class FlyingObject {
  PImage img;
  
  PVector position;  // current position
  PVector speed;     // speed vector
  PVector acc;       // acceleration vector
  float friction;    // dummy friction
  
  float scale;
  
  FlyingObject(String path) {
    img = loadImage(path);
    scale = random(0.1, 0.4);
    
    position = new PVector(mouseX, mouseY);
    speed = new PVector(0, 0);
    acc = PVector.random2D();
    
    friction = random(0.015);
  }
  
  void display() {
    image(img, position.x, position.y, img.width * scale, img.height * scale);
  }
  
  void update() {
    // compute current acceleration based on mouse position
    acc = new PVector(mouseX - position.x, mouseY - position.y).normalize();
    acc.mult(2);
    
    // add the acceleration to speed
    speed.add(acc);
    
    // update current position
    position.add(speed);
    // and apply dummy friction to it
    speed.mult(1-friction);
  }
}
