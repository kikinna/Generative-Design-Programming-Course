// Non-Flying Object
class NFO {
  PImage nfo;
  PVector position;
  float scale;
  
  NFO(String s) {
    nfo = loadImage(s);
    position = new PVector(random(width), random(height));
    scale = random(0.1, 0.5);
  }
  
  void display() {
    image(nfo, position.x, position.y, nfo.width*scale, nfo.height*scale);
  }
  
}
