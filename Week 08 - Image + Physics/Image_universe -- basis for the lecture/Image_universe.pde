  int star_count = 200;
int space_stuff_count = 7;

PImage ship;
int spaceship_index = 10;

ArrayList<Star> stars;
ArrayList<SpaceStuff> space;
ArrayList<FlyingObject> flying;

void setup() {
  size(1500, 1500);
  
  colorMode(HSB, 360, 100, 100, 100);
  imageMode(CENTER);
  
  background(210, 100, 50);
  
  // Initialize arraylists
  stars = new ArrayList<Star>();
  space = new ArrayList<SpaceStuff>();
  flying = new ArrayList<  FlyingObject>();
  
  generateSpace();
}

void draw() {
  fill(210, 100, 50, 50);
  rect(0, 0, width, height);
  
  // first draw stars
  for (Star s : stars) {
    s.display();
    s.update();
  }
  
  // then draw other space stuff like planets
  for (SpaceStuff s : space) {
    s.display();
    s.update();
  }
  
  // then draw the spaceships
  for (FlyingObject fo : flying) {
    fo.display();
    fo.update();
  }
  
  
}

void generateSpace() {
  // Generates plannets or maybe other space things
  for (int i  = 0; i < space_stuff_count; i++) {
    if (random(1) < 0.9) {
      space.add(new SpaceStuff("Planet-" + int(random(1, 6)) + ".png"));
    } else {
      space.add(new SpaceStuff("Thingy-" + int(random(1, 9)) + ".png"));
    }
  }
  
  // generate stars
  for (int i = 0; i < star_count; i++) {
    stars.add(new Star());
  }
}

void mouseClicked() {
  // create new spaceship
  flying.add(new FlyingObject("Spaceship-" + spaceship_index + ".png"));
  spaceship_index++;
  if (spaceship_index > 10) spaceship_index = 1;
  
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Space-####.png");
}
