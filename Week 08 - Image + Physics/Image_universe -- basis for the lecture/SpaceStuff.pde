class SpaceStuff {
  PImage img;

  PVector position;  // current position
  PVector speed;     // speed vector

  float scale;

  SpaceStuff(String path) {
    img = loadImage(path);

    position = new PVector(random(width), random(height));
    speed = PVector.random2D().mult(random(0.05, 0.15));

    scale = random(0.02, 0.45);
  }

  void display() {
    // Tinting 
    //colorMode(RGB);
    //tint(0, 0, 255);
    //colorMode(HSB, 360, 100, 100, 100);
    image(img, position.x, position.y, img.width * scale, img.height * scale);
    //noTint();
  }

  void update() {
    position.add(speed);
  }
}
