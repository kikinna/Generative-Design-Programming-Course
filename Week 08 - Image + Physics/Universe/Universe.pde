// Showcase of basic work with images using PImage class
// e.g. loadImage, image, imageMode, width/height of image.
// Made for PV259 by Kristina Zakopcanova

PImage rocket;

int star_count = 200;
int planet_count = 5;

// index for spaceships' filename
int ufo_i = 10;

Star[] stars = new Star[star_count];
ArrayList<NFO> planets;
ArrayList<UFO> ufos;

void setup() {
  size(1500, 1500);

  colorMode(HSB, 360, 100, 100, 100);
  
  background(240, 80, 35);
  
  planets = new ArrayList<NFO>();  
  ufos = new ArrayList<UFO>();
  
  initStars();
  initSpace();
  
  //rocket = loadImage("Rocket-1.png");
  imageMode(CENTER);
  
}


void draw() {
  background(240, 80, 35);
  
  for (int i = 0; i < star_count; i++) {
    stars[i].display();
  }
  for (NFO n : planets) {
    n.display();
  }
  for (UFO u : ufos) {
    u.display();
    u.update();
  }
  
  //image(rocket, mouseX, mouseY, rocket.width*0.7, rocket.height*0.7);
}

// When mouse is clicked, create new spaceship, an UFO object
void mouseClicked() {
  ufos.add(new UFO("Spaceship-" + ufo_i + ".png"));
  ufo_i++;
  if (ufo_i > 10) ufo_i = 1;
}

// Create a list of star objects
void initStars() {
  for (int i = 0; i < star_count; i++) {
    stars[i] = new Star();
  }
}

// Create a list of space objects such as planets
void initSpace() {
  for (int i = 1; i <= planet_count; i++) {
    planets.add(new NFO("Planet-" + i + ".png"));
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') { saveFrame("Universe-####.png"); }
}
