class Star {
  PVector position;    // current position
  PVector speed;       // speed vector
  float size;          // radius of stars
  color star_color;    // star color
  
  Star() {
    position = new PVector(random(width), random(height));
    speed = PVector.random2D().mult(random(0.1, 0.2));
    size = random(8);
    star_color = color(random(45, 60), 100, 100);
  }
  
  void display() {
    noStroke();
    
    fill(star_color, 5);
    ellipse(position.x, position.y, 2*size, 2*size);
    
    fill(star_color);
    ellipse(position.x, position.y, size, size);
  }
  
  void update() {
    position.add(speed);
  }
  
}
