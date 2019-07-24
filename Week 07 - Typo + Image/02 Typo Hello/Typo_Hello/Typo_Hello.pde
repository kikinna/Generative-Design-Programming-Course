// Basic functions related to Typography in processing
// and intro to PFont class
// Functions:  PFont.list(), createFont, textFont, textLeading
// Made for PV259 by Kristina Zakopcanova


PFont ibm_bold;
PFont ibm_light;

void setup() {
  size(1500, 1500);
  background(33);
  textSize(100);
  
  // print a list of installed fonts into console
  printArray(PFont.list());
  
  // initialize PFont objects
  ibm_bold = createFont("IBM Plex Sans Bold", 250);
  ibm_light = createFont("IBM Plex Sans Light", 100);
  
  // use selected PFont object as a current font
  textFont(ibm_bold);
  
  // set up leading height in px (distance between text lines)
  textLeading(30);
}

void draw() {
  background(33);

  strokeWeight(50);
  fill(#40FFC1, 100);
  
  text("Hello. Hello. Hello.", width/2, height/2, width/2, height/2);
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("Hello.png");
}
