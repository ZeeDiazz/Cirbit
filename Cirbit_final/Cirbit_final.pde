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
}

void draw() {
  if(menu.showTab == 0){
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

void mouseReleased(){
  menu.mouseReleased();
}

void mouseWheel(MouseEvent event) {
  menu.shop.mouseWheel(event);
}
