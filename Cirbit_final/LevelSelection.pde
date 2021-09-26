class LevelSelection {
  ArrayList<Button> buttonList = new ArrayList<Button>();
  LevelSelection() {
  }
  Button button = new Button(200, 100, 100, 70, 20, "Home", 50, 35, true, 0, 1);
  void setup() {
    //float _x, float _y, float _w, float _h, float _textSize, String _text, float _textX, float _textY, boolean _rectTrue, float _round, int _leadingToTab
    buttonList.add(new Button(600, 300, 50, 50, 20, "1", 25, 25, true, 0, 0));
    buttonList.add(new Button(700, 300, 50, 50, 20, "2", 25, 25, true, 0, 0));
    buttonList.add(new Button(800, 300, 50, 50, 20, "3", 25, 25, true, 0, 0));
    buttonList.add(new Button(900, 300, 50, 50, 20, "4", 25, 25, true, 0, 0));
    buttonList.add(new Button(1000, 300, 50, 50, 20, "5", 25, 25, true, 0, 0));
    buttonList.add(new Button(600, 400, 50, 50, 20, "6", 25, 25, true, 0, 0));
    buttonList.add(new Button(700, 400, 50, 50, 20, "7", 25, 25, true, 0, 0));
    buttonList.add(new Button(800, 400, 50, 50, 20, "8", 25, 25, true, 0, 0));
    buttonList.add(new Button(900, 400, 50, 50, 20, "9", 25, 25, true, 0, 0));
    buttonList.add(new Button(1000, 400, 50, 50, 20, "10", 25, 25, true, 0, 0));
  }
  void update() {
    button.update();
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
    button.display();
    int i = 0;
    for (Button b : buttonList) {
      if (data.getInt(i, 0) == 1) {
        b.c = color(100, 255, 100);
      } else {
        b.c = color(255, 100, 100);
      }
      b.display();
      i++;
    }
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Level Selection", width/2, 100);
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
    int i = 1;
    for (Button b : buttonList) {
      b.isPressed = false;
      b.isReleased = true;
      if (b.checkMouse()) {
        if (data.getInt(i-1, 0) == 1) {
          InMenu = false;
          game.currentLevel = i;
        }
      }
      i++;
    }
    if (button.checkMouse()) {
      menu.showTab = 1;
    }
  }
}
