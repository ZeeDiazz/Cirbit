class Game {  
  BallAndRope ball;
  ArrayList<ArrayList<Wall>> wallList = new ArrayList<ArrayList<Wall>>();

  int currentLevel = 2;


  void setup() {
    ball = new BallAndRope(new PVector (width/2, 200), 535, new PVector(width/2, 115) );
    for (int i = 1; i<=10; i++) {
      wallList.add(new ArrayList<Wall>());
    }

    for (int i = 1; i<=10; i++) {
      switch(i) {
      case 1:
        wallList.get(i).add(new Wall(700, height, 700, 530, 735, 530, 735, height));
        wallList.get(i).add(new Wall(700, 0, 700, 290, 735, 290, 735, 0));
        break;
      case 2:
        wallList.get(i).add(new Wall(750, 270, 750, 250, 425, 250, 425, 270));
        wallList.get(i).add(new Wall(1350, 630, 1125, 390, 1095, 413, 1318, 658));
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        break;
      case 10:
        break;
      }
    }
  }

  void draw() {
    clear();
    forLevels(currentLevel);
    ball.display();
    ball.update();
  }

  void forLevels(int i) {
    for (Wall w : wallList.get(i)) {
      w.display();
      w.update();
    }
  }
}
