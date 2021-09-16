Game game = new Game();
float distance;
float mouseDistance;
color c;
void setup(){
  size(1600,800);
  game.setup();
}

void draw(){
  clear();
  game.draw();
  
  circle(mouseX, mouseY, 30);
  textSize(32);
  text("Distance between two points: " + distance, 30, 30);
  fill(255,0,0);
  text("Mouse distance: " + mouseDistance, 30, 60);
  fill(255);
}
