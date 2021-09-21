class Ball {

  PVector ori;       // origin
  PVector loc;       // location
  PVector gravity;   // gravity

  float l;           // length of rope
  float angle;       // angle
  float aVel;        // angled velocity
  float aAccel;      // angled acceleration
  float damping;     // the dampening of velocity

  Ball(PVector loc_, float l_, PVector ori_) {
    loc = loc_;
    l = l_;
    ori = ori_;
    angle= PI/4;

    aVel = 0.0;
    aAccel = 0.0;

    damping = 0.995;
  }

  void run() {
    update();
    display();
  }

  void update() {

    gravity = new PVector(0, 0.4);

    if (game.connected()) {
      aAccel = (-1 * gravity.y / l) * sin(angle);
      aVel += aAccel;
      angle += aVel;
      aVel *= damping;
    }
    if (!connected()) {
      l += gravity.y;
    }
  }
  void display() {
    loc.set(l*sin(angle), l*cos(angle), 0);
    loc.add(ori);


    fill(175);
    ellipse(loc.x, loc.y, 16, 16);
  }

  boolean connected() {
    if (keyPressed && key == 'f') {
      return false;
    }
    return true;
  }
}
