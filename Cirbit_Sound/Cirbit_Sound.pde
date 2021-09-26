Game game = new Game();

import processing.sound.*;

SoundFile buy; 
SoundFile wind; //
SoundFile click; // 
SoundFile death; // 
SoundFile detach; 
SoundFile electricity;
SoundFile coinCollect; // 

void setup() {
  size(1600, 800);
  game.setup();

  buy = new SoundFile(this, "");
  wind = new SoundFile(this, ""); 
  click = new SoundFile(this, "");
  death = new SoundFile(this, "");
  detach = new SoundFile(this, "");
  electricity = new SoundFile(this, "");
  coinCollect = new SoundFile(this, "");
}

void draw() {
  clear();
  game.draw();
}
