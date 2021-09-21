class Game {
  // Rope and Ball
  Rope R1;
  Ball B1;
  Wall W1;

  //Obstacles
  ArrayList<Wall> wallList = new ArrayList<Wall>();

  void setup() {
    // Rope and Ball
    R1 = new Rope(new PVector(width/2, 10), 400);
    B1 = new Ball(new PVector (R1.locR.x, R1.locR.y), new PVector (R1.ori.x, R1.ori.y), R1.l);

    // Obstacles
    wallList.add(new Wall(800, 300, 820, 350, 800, 430, 700, 400));
    W1 = new Wall(800, 300, 820, 350, 800, 430, 700, 400);
  }

  void draw() {

    //Rope and Ball
    R1.run();
    B1.run();

    //Obstacles
    for (Wall w : wallList) {
      w.update();
      w.display();
    }
  }
  boolean connected() {
    if (B1.connect()) {
      return true;
    }
    return false;
  }

  boolean ballIsDead() {
    if (!W1.killZone()) {
      return false;
    }
    return true;
  }
}
