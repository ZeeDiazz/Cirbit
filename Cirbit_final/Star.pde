class Star {
  boolean collected = false;

  float x, y;
  Star(float _x, float _y) {
    x = _x;
    y = _y;
  }

  void update() {
    if (dist(game.ball.location.x, game.ball.location.y, x, y) < 30) {
      collected = true;
    }
    game.star();
  }

  void display() {
    fill(170, 170, 0);
    circle(x, y, 30);
  }
}
