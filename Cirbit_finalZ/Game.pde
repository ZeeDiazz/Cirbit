class Game {  
   PImage Zcoin;
     PImage Star;
   
  BallAndRope ball;
  Coin coin;
  ArrayList<ArrayList<Wall>> wallList = new ArrayList<ArrayList<Wall>>();
  ArrayList<ArrayList<Coin>> coinList = new ArrayList<ArrayList<Coin>>();
  ArrayList<Star> starList = new ArrayList<Star>();
  int currentLevel = 1;


  void setup() {
    Zcoin = loadImage("ZCoin.png");
     Star = loadImage("Star.png");
    ball = new BallAndRope(new PVector (width/2, 200), 535, new PVector(width/2, 115) );
    ball.setup();
    
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
    forLevels(currentLevel);
    ball.display();
    ball.update();
    star();
  }

  void star() {
    switch(currentLevel) {
    case 1:
      if(starList.get(currentLevel).collected){
        InMenu = true;
        menu.showTab = 5;
        currentLevel++;
        //data.getInt(i, 1);
      }
      break;
    case 2:

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
}
