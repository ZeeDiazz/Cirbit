Game game = new Game();

void setup(){
  size(1600,800);
  game.setup();
  frameRate(60);
}

void draw(){
  game.draw();
}

void keyPressed(){
  game.ball.keyPressed();
}

void keyReleased(){
  game.ball.keyReleased();
}
