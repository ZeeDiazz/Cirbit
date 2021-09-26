class Game {  
  BallAndRope ball;
  ArrayList<ArrayList<Wall>> wallList = new ArrayList<ArrayList<Wall>>();
  ArrayList<ArrayList<Coin>> coinList = new ArrayList<ArrayList<Coin>>();
  ArrayList<Star> starList = new ArrayList<Star>();
  int currentLevel = 1;
  Button button = new Button(200, 100, 100, 70, 20, "Home", 50, 35, true, 0, 1);

  void setup() {
    ball = new BallAndRope(new PVector (width/2, 200), 535, new PVector(width/2, 115) );
    for (int i = 1; i<=10; i++) {
      wallList.add(new ArrayList<Wall>());
    }
    for (int i = 1; i<=10; i++) {
      coinList.add(new ArrayList<Coin>());
    }
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));
    starList.add(new Star(650, 690));

    for (int i = 1; i<=10; i++) {
      switch(i) {
      case 1:
        wallList.get(i).add(new Wall(700, height, 700, 530, 735, 530, 735, height));
        wallList.get(i).add(new Wall(700, 0, 700, 290, 735, 290, 735, 0));
        coinList.get(i).add(new Coin(1270, 370));
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
    button.display();
    button.display();
    if (mousePressed && button.checkMouse()) {
      menu.showTab = 1;
      InMenu = true;
    }
    forLevels(currentLevel);
    ball.display();
    ball.update();
  }

  void star() {
    if (starList.get(currentLevel).collected) {
      starList.get(currentLevel).collected = false;
      InMenu = true;
      if (currentLevel <10) {
        data.setInt(currentLevel, 0, 1);

        menu.showTab = 5;
      }
      currentLevel++;
      saveTable(data, "data/data.csv");
      reset();
    }
  }

  void forLevels(int i) {
    for (Wall w : wallList.get(i)) {
      w.update();
      w.display();
    }
    for (Coin c : coinList.get(i)) {
      c.update();
      c.display();
    }
    for (Star s : starList) {
      s.update();
      s.display();
    }
  }

  void reset() {
    ball.reset();
  }
}
