class Coin{

  boolean collected;
  
  float x,y;
  Coin(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void display(){
    if(collected){
      fill(255, 170, 0,80);
    }else{
      fill(255, 170, 0);
    }
    //circle(x,y,30);
    
  }
  
  void update(){
    if(dist(game.ball.location.x, game.ball.location.y, x,y) < 30/2){
      collected = true;
    }
  }
}
