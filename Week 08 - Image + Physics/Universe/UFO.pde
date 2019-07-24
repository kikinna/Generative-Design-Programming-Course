// UFO object
class UFO {
  PImage nfo;
  PVector position;
  PVector speed;
  float scale;
  float coef;
  
  UFO(String s) {
    nfo = loadImage(s);
    position = new PVector(mouseX, mouseY);
    speed = new PVector(0, 0);
    scale = random(0.1, 0.5);
    coef = random(1,3);
  }
  
  void display() {
    image(nfo, position.x, position.y, nfo.width*scale, nfo.height*scale);
  }
  
  void update() {
    // compute the directional vector from this ufo object to user's mouse
    PVector dir = new PVector(mouseX - position.x, mouseY - position.y);
    // normalize the directional vector -> magnitude = 1 and then multiply by coefficient
    dir.normalize().mult(coef);
    
    // acceleration
    speed.add(dir);
    // change of position 
    position.add(speed);
    // dummy friction
    speed.mult(0.98);
  }
  
}
