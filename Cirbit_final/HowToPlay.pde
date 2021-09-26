class HowToPlay {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  void setup() {
  }

  void display() {
    fill(255);
    textSize(100);
    text("How to play", 200, 100);
  }
  void update() {
    println("HERE");
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
  void mousePressed() {
  }
  void mouseReleased() {
  }
}
