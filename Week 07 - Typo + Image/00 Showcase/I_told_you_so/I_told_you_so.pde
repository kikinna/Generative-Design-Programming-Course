// Just being a smartass
// Made at AGD+M Plener 2016 in Banska Stiavnica
// @kikinnaz

PFont font;
String[] i_told_you_so = {"I", "TOLD", "YOU", "SO"};
int i_told_you_so_count = 0;

void setup() {
  size(540, 540);
  background(10);
  
  font = createFont(" Black", 40);
  textFont(font);
  frameRate(20);
}

void draw() {
  background(10);
  text(i_told_you_so[i_told_you_so_count % i_told_you_so.length], width/2, height/2);
  if (frameCount % 3 == 0) i_told_you_so_count++;
  
  //saveFrame("I told you so -- ##.png");
}
