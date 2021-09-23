class PointSystem {
  int coinCount;

  void update() {
    if (game.collision()) { 
      coinCount ++;
    }
    if (!game.collision()) {
      coinCount --;
    }
  }

  void display() {
    text(coinCount, 300, 300);
  }
}
