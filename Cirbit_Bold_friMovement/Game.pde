class Game {  
  BallAndRope ball;

  void setup() {
    ball = new BallAndRope(new PVector (width/2, 200), 400, new PVector(width/2, 300) );
  }

  void draw() {
    clear();
    ball.run();
  }
}
