class Star {
  PVector position;
  float size;
  color star_color;
  
  Star() {
    position = new PVector(random(width), random(height));
    size = random(1, 8);
    star_color = color(random(45, 60), 40, 100);
  }
  
  void display() {
    fill(star_color);
    ellipse(position.x, position.y, size, size);
  }
}
