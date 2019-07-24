ArrayList<String> cup;

String[] students = {
  "Martina", "Kuba", "Bruno", "Sam G", "Martin", 
  "Verča", "Vojta", "Magda", "Áron", "Matúš K", 
  "David", "Kristy", "Míša", "Henrieta", "Broňo", 
  "Matúš R", "Marko", "Matúš T", "Barča", "Adam", 
  "Juraj", "Petr Žák", "Petr Žemla"};

PFont font;
float y = 450;
float y_start = 450;
float y_shift = 120;

int challenge_index = 1;

void setup() {
  fullScreen();
  //size(1500, 1500);
  colorMode(HSB, 360, 100, 100, 100);

  background(33);
  noStroke();

  font = createFont("IBMPlexSans-Bold.ttf", 64);
  textFont(font);

  cup = new ArrayList<String>();
  for (int i = 0; i < students.length; i++) {
    cup.add(students[i]);
  }
}

void draw() {
}

void initChallenge() {
  initStudentList();
  writeHeader();
}

void writeHeader() {
  background(33);

  textAlign(LEFT, TOP);
  textSize(300);
  textLeading(250);

  for (int i = 0; i < 2; i++) {
    fill(360, i*50 + 40);
    text("CUR–", random(600), 300);
    text("–RY", random(600), 600);
    text("COD–", random(600), 900);
    text("–ING", random(600), 1200);
    text("#" + challenge_index, random(600), 1500);
  }
}

void keyPressed() {
  if (key == 'i') initChallenge();
  if (key == 'p') pickStudent();
  if (key == 's') saveFrame("Curry coding " + challenge_index + " - ####.png");

  if (keyCode == RIGHT) { 
    challenge_index++; 
    initChallenge();
  }
  if (keyCode == LEFT) { 
    challenge_index--; 
    initChallenge();
  }
}

void initStudentList() {
  cup.clear();
  for (int i = 0; i < students.length; i++) {
    cup.add(students[i]);
  }

  y = y_start;
}

void mouseClicked() {
  initChallenge();
}

void pickStudent() {
  textSize(64);

  pushMatrix();
  translate(500, 0);

  if (cup.size() > 0) {
    println(cup.size());
    int index = int(random(cup.size()));
    String student = cup.get(index);
    cup.remove(index);

    if ((students.length - cup.size()) % 2 != 0) {
      if (cup.size() == 0) {
        textAlign(RIGHT);
        text(student, width/2 + 820, y-120);
      } else {
        println(false, student);
        textAlign(RIGHT);
        text(student, width/2 - 120, y);
      }
    } else {

      println(true, student);
      textAlign(LEFT);
      text(student, width/2 + 120, y);

      float y_mid = 20;

      stroke(48, 69, 99);
      stroke(#008E76);
      stroke(360, 20);
      strokeWeight(random(5, 15));
      strokeWeight(5);
      strokeCap(SQUARE);
      //line(width/2 - 115, y - y_mid, width/2 + 115, y - y_mid);

      //float length = random(400, 1000);
      float x1 = random(width/2 - 400, width/2-100);
      float x2 = random(width/2 + 400, width/2 + 800);
      if (cup.size() == 1) {
        x2 = random(width/2 + 600, width/2 + 1000);
      }
      line(x1, y - y_mid, x2, y - y_mid);
      //line(width/2 - 400, y - y_mid, width/2 + 400, y - y_mid);
      noStroke();

      y += y_shift;
      //fill(random(40, 60), random(50, 90), random(90, 100));
    }
  }

  popMatrix();
}
