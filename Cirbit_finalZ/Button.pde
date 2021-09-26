class Button {
  //PImage bg;

  float x, y, w, h, textSize;
  String text;
  boolean isPressed = false;
  boolean isReleased = true;
  boolean rectTrue = true;
  float textX, textY;
  float round;
  int leadingToTab = 0;

  color c = 255;
  Button(float _x, float _y, float _w, float _h, float _textSize, String _text, float _textX, float _textY, boolean _rectTrue, float _round, int _leadingToTab) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textSize = _textSize;
    text = _text;
    textX = _textX;
    textY = _textY;
    rectTrue = _rectTrue;
    round = _round;
    leadingToTab = _leadingToTab;
  }

  void update() {
  }

  void display() {
    if (rectTrue) {
      fill(c);
      if (isPressed) {
        strokeWeight(3);
        rect(x, y, w, h, round);
      }
      if (isReleased) {
        strokeWeight(1);
        rect(x, y, w, h, round);
      }
    }
    if (!rectTrue) {
      if (isPressed) {
        strokeWeight(3);
        ellipse(x, y, w, h);
      }
      if (isReleased) {
        strokeWeight(1);
        ellipse(x, y, w, h);
      }
    }
    push();
    textAlign(CENTER, CENTER);
    translate(x, y);
    textSize(textSize);
    fill(10);
    text(text, textX, textY);
    pop();
  }

  //Returns true if the mouse is in the button
  boolean checkMouse() {
    if (rectTrue) {
      if (mouseX > x && mouseX < x + w) {
        if (mouseY > y && mouseY < y + h) {
          return true;
        }
      }
    } else if (dist(mouseX, mouseY, x, y)<w/2) {
      return true;
    }
    return false;
  }
}
