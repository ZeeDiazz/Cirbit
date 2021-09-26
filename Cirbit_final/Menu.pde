class Menu {
  //Tab 1=Frontpage, Tab 2=HowToPlay, Tab 3=Shop, Tab 4=Settings, Tab 5=LevelSelection
  int showTab = 1;

  FrontPage frontPage = new FrontPage();
  HowToPlay howToPlay = new HowToPlay();
  Shop shop = new Shop();
  Settings settings = new Settings();
  LevelSelection levelSelection = new LevelSelection();


  void setup() {
    frontPage.setup();
    howToPlay.setup();
    shop.setup();
    settings.setup();
    levelSelection.setup();
  }

  void draw() {
    clear();
    background(160);
    switch(showTab) {
    case 1:
      frontPage.update();
      frontPage.display();
      break;
    case 2:
      howToPlay.update();
      howToPlay.display();
      break;
    case 3:
      shop.update();
      shop.display();
      break;
    case 4:
      settings.update();
      settings.display();
      break;
    case 5:
      levelSelection.update();
      levelSelection.display();
      break;
    }
  }

  void mousePressed() {
    switch(showTab) {
    case 1:
      frontPage.mousePressed();
      break;
    case 2:
      howToPlay.mousePressed();
      break;
    case 3:
      shop.mousePressed();
      break;
    case 4:
      settings.mousePressed();
      break;
    case 5:
      levelSelection.mousePressed();
      break;
    }
  }

  void mouseReleased() {
    switch(showTab) {
    case 1:
      frontPage.mouseReleased();
      break;
    case 2:
      howToPlay.mouseReleased();
      break;
    case 3:
      shop.mouseReleased();
      break;
    case 4:
      settings.mouseReleased();
      break;
    case 5:
      levelSelection.mouseReleased();
      break;
    }
  }
}
