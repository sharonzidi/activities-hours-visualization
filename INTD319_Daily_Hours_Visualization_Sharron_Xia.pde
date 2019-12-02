Table myTable;
PFont myFont;
int columnCount;
boolean isFolded;

void setup() {
  size(1400, 800);
  myTable = loadTable("hour.tsv", "header");
  columnCount = myTable.getColumnCount();
  myFont = createFont("centurygothic.ttf", 32, true);
  isFolded = false;
}

void draw() {
  background(0);
  textAlign(CENTER);
  textFont(myFont, 14);
  fill(255);
  text("/hr", 210, 140);
  text("Student", 125, 140);
  String description ="Here's the data gatherded from 15 students in ECUAD INTD 319 class. \n Hover over different bars and click your mouse to highlight and make comparision.";
  text(description, 700, 90);
  String title="How Many Hours You Spend on the Different Types of Activity on An Average Day?";
  textSize(32);
  text(title, 700, 50);
  textSize(12);
  text("Design by Sharon Xia", 1240, 790);


  for (int i = 0; i < myTable.getRowCount(); i++) { 
    TableRow line =myTable.getRow(i);

    textAlign(LEFT, CENTER);
    textFont(myFont, 22);
    fill(255);
    text(i +1, 100, 40*i+150);

    int a = line.getInt("sleep")*20; 
    int b = line.getInt("creative")*20;
    int c = line.getInt("work")*20; 
    int d = line.getInt("leisure")*20;
    int e = line.getInt("exercise")*20;
    int f = line.getInt("other")*20;

    if (isFolded) {

      fill(40, 108, 239);
      rect(200, 40*i+150, a *2.2, 20); 
      fill(2, 254, 186);
      rect(200 + a*2.2, 40*i+150, b *2.2, 20);
      fill(254, 69, 20);
      rect((200 + (a + b) * 2.2), 40*i+150, c *2.2, 20);
      fill(250, 249, 7);
      rect((200 + (a + b + c) * 2.2), 40*i+150, d *2.2, 20);
      fill(255, 133, 16);
      rect((200 + (a + b + c + d) * 2.2), 40*i+150, e *2.2, 20);
      fill(199, 134, 64);
      rect((200 + (a + b + c + d + e) * 2.2), 40*i+150, f *2.2, 20);
    } else {

      fill(40);
      rect(200, 40*i+150, line.getInt("sleep")*20, 20); 
      rect(400, 40*i+150, line.getInt("creative")*20, 20);
      rect(600, 40*i+150, line.getInt("work")*20, 20);
      rect(800, 40*i+150, line.getInt("leisure")*20, 20);
      rect(1000, 40*i+150, line.getInt("exercise")*20, 20);
      rect(1200, 40*i+150, line.getInt("other")*20, 20);

      textSize(18);
      if ((mouseX > 100) && (mouseX < 390) && (mouseY > 200)) {
        fill(40, 108, 239);
        rect(200, 40*i+150, a, 20); 
        fill(0);
        text(line.getString("sleep"), 203, 40*i+157);
      } else if ((mouseX > 400) && (mouseX < 600) && (mouseY > 200)) {
        fill(2, 254, 186);
        rect(400, 40*i+150, b, 20);
        fill(0);
        text(line.getString("creative"), 403, 40*i+157);
      } else if ((mouseX > 600) && (mouseX < 800) && (mouseY > 200)) {
        fill(254, 69, 20);
        rect(600, 40*i+150, c, 20);
        fill(0);
        text(line.getString("work"), 603, 40*i+157);
      } else if ((mouseX > 800) && (mouseX < 1000) && (mouseY > 200)) {
        fill(250, 249, 7);
        rect(800, 40*i+150, d, 20);
        fill(0);
        text(line.getString("leisure"), 803, 40*i+157);
      } else if ((mouseX > 1000) && (mouseX < 1200) && (mouseY > 200)) {
        fill(255, 133, 16);
        rect(1000, 40*i+150, e, 20);
        fill(0);
        text(line.getString("exercise"), 1003, 40*i+157);
      } else if ((mouseX > 1200) && (mouseY > 200)) {
        fill(199, 134, 64);
        rect(1200, 40*i+150, f, 20);
        fill(0);
        text(line.getString("other"), 1203, 40*i+157);
      }
    }  

    for (int column = 0; column < myTable.getColumnCount(); column++) { 
      String category = myTable.getColumnTitle(column);
      textAlign(LEFT, CENTER);
      textSize(30);
      fill(255);
      text(category, column*200+200, 750);
    }
  }
}

// switch flag when release the mouse
void mouseReleased() {
  isFolded = !isFolded;
}
