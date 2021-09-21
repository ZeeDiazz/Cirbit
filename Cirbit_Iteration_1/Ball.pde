class Ball {

  PVector locB;
  PVector ori;

  float l;
  float angle;
  float aVel;
  float aAccel;
  float damping;

  Ball(PVector locB_, PVector ori_, float l_) {
    locB = locB_;
    angle= PI/4;
    ori = ori_;
    l = l_;

    aVel = 0.0;
    aAccel = 0.0;

    damping = 0.995;
  }

  void run() {
    update();
    display();
  }

  void update() {

    float gravity = 0.4;

    aAccel = (-1 * gravity / l) * sin(angle);

    aVel += aAccel;
    angle += aVel;

    aVel *= damping;
  }

  void display() {
    if (game.ballIsDead()) {
      locB.set(l*sin(angle), l*cos(angle), 0);
      locB.add(ori);
      fill(175);
      ellipse(locB.x, locB.y, 16, 16);
    }
  }

  boolean connect() {
    if (keyPressed && key == 'f') {
      return false;
    }
    return true;
  }
}
