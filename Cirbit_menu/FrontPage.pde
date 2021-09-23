class FrontPage {

  float textY = 100;
  void setup() {
    buttons.add(new Button(width/2-200, 250, 400, 60, 50, "Play", 200, 20, true, 7));
    buttons.add(new Button(650, 480, 100, 100, 18, "Settings", 0, 0, false, 0));
    buttons.add(new Button(800, 650, 140, 140, 18, "How to play?", 0, 0, false, 0));
    buttons.add(new Button(920, 450, 120, 120, 18, "Shop", 0, 0, false, 0));
  }

  void update() {
    
  }

  void display() {
    line(650, 430, 650, 300);
    line(800, 580, 800, 300);
    line(920, 400, 920, 300);

    textSize(120);
    textAlign(CENTER, CENTER);
    text("Cirbit", width/2, textY);
    textAlign(CORNER, CORNER);
  }
}
