Game game = new Game();
Menu menu = new Menu();
Table data;

Boolean InMenu = true;

void setup() {
  size(1600, 800);
  frameRate(60);

  game.setup();
  menu.setup();  

  data = loadTable("data/data.csv", "header");

  testing();
}

void draw() {
  if (menu.showTab == 0) {
    InMenu = false;
  }
  if (InMenu) {
    menu.draw();
  }
  if (!InMenu) {
    game.draw();
  }
}

void keyPressed() {
  if (!InMenu) {
    game.ball.keyPressed();
  }
}

void keyReleased() {
  if (!InMenu) {
    game.ball.keyReleased();
  }
}

void mousePressed() {
  menu.mousePressed();
}

void mouseReleased() {
  menu.mouseReleased();
}

void mouseWheel(MouseEvent event) {
  menu.shop.mouseWheel(event);
}

void testing() {

  for (int i = 0; i<= 9; i++) {
    println("Level " + i);

    int r = data.getInt(i,0);

    if (r == 1) {
      println(" has been completed");
    }
    if (r == 0) {
      println(" has not been completed");
    }
  }
  println();
  println("SKINS UNLOCKED");
  for (int i = 0; i<= 5; i++) {
    println("Skin " + i);
    int r = data.getInt(i, 1);
    if (r == 1) {
      println(" has been unlocked");
    }
    if (r == 0) {
      println(" has not been unlocked");
    }
  }
  println();
  println("CASH MONEY");
  int r = data.getInt(0, 2);
  println("cashmoney: " + r );
}
