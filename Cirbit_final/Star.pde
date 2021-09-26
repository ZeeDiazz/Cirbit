class Star {
  boolean collected;

  float x, y;
  Star(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void update() {
    if (dist(game.ball.location.x, game.ball.location.y, x, y) < 30/2) {
      collected = true;
    }
  }

  void display() {
    fill(170, 170, 0);
    circle(x, y, 30);
  }
}
