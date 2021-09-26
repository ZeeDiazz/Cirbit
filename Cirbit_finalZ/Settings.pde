class Settings {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  Settings() {
  }
  void setup() {
    //float _x, float _y, float _w, float _h, float _textSize, String _text, float _textX, float _textY, boolean _rectTrue, float _round, int _leadingToTab
    buttonList.add(new Button(650, 200, 300, 50, 20, "Disable Sound", 150, 25, true, 0, 4));
    buttonList.add(new Button(650, 300, 300, 50, 20, "Disable Music", 150, 25, true, 0, 4));
    buttonList.add(new Button(650, 400, 300, 50, 20, "Reset Progress", 150, 25, true, 0, 4));
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
    for (Button b : buttonList) {
      b.display();
    }

    textSize(120);
    textAlign(CENTER, CENTER);
    text("Settings", width/2, 100);
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
      if (b.checkMouse()) {
        menu.showTab = b.leadingToTab;
      }
    }
  }
}
