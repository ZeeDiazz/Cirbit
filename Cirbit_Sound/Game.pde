class Game {

  void setup() {
  }

  void draw() {
  }
}

void keyPressed() {
  if (key == 'b') {
    buy.play();
  }
  if (key == 'w') {
    wind.play();
  }
  if (key == 'c') {
    click.play();
  }
  if (key == 'd') {
    death.play();
  }
  if (key == 'D') {
    detach.play();
  }
  if (key == 'e') {
    electricity.play();
  }
  if (key == 'C') {
    coinCollect.play();
  }
}
