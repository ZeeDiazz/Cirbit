class FrontPage {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  float textY = 100;

  void setup() {
    buttonList.add(new Button(width/2-200, 250, 400, 60, 50, "Play", 200, 20, true, 7,0));
    buttonList.add(new Button(650, 480, 100, 100, 18, "Settings", 0, 0, false, 0,4));
    buttonList.add(new Button(800, 650, 140, 140, 18, "How to play?", 0, 0, false, 0,2));
    buttonList.add(new Button(920, 450, 120, 120, 18, "Shop", 0, 0, false, 0,3));
  }

  void update() {
    for (Button b : buttonList) {
      b.update();
    }
    boolean changeCursor = false;
    for (Button b : buttonList) {
      if (b.checkMouse()) {
        changeCursor = true;
      }
    }
    if (changeCursor) {
      cursor(HAND);
    } else {
      cursor(ARROW);
    }
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    line(650, 430, 650, 300);
    line(800, 580, 800, 300);
    line(920, 400, 920, 300);
    
    for (Button b : buttonList) {
      b.display(); 
    }
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Cirbit", width/2, textY);
    textAlign(CORNER, CORNER);
  }

  void mousePressed() {
    for (Button b : buttonList) {
      if (b.checkMouse()) {
        b.isPressed = true;
        b.isReleased = false;
      }
    }
  }

  void mouseReleased() {
    for (Button b : buttonList) {
      b.isPressed = false;
      b.isReleased = true;
      if(b.checkMouse()){
        menu.showTab = b.leadingToTab;
      }
    }
  }
}
