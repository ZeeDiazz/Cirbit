Game game = new Game();

import processing.sound.*;

SoundFile buy;
SoundFile wind;
SoundFile click; 
SoundFile death; 
SoundFile detach;
SoundFile electricity; 

void setup() {
  size(1600, 800);
  game.setup();

  buy = new SoundFile(this, "click");
  wind = new SoundFile(this, "wind"); 
  click = new SoundFile(this, "click");
  death = new SoundFile(this, "death");
  detach = new SoundFile(this, "detach");
  electricity = new SoundFile(this, "electricity");
}

void draw() {
  clear();
  game.draw();
}
