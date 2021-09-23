class Coin {
  float x, y, w, h;
  boolean Collision;

  Coin(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void display() {
    ellipse(x,y,w,h);
  }

  boolean Collision() {
    if (mouseX > x - w && mouseX < x + w) { // replace mouse with the location of the ball
      if (mouseY > y - h && mouseY < y + h) {
        return true;
      }
    }
    return false;
  }
  

  boolean isCollected() {
    if (Collision()) {
      return true;
    }
    return false;
  }
}
