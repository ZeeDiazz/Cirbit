class Game {
  int i;
  
  PointSystem pointSystem;
  //Coin[] coin = new Coin[50];
  ArrayList<Coin> coin;

  void setup() {
    pointSystem = new PointSystem();
    coin = new ArrayList<Coin>();
  }

  void draw() {
    pointSystem.display();
    coin.add(new Coin(50,50,50,50));
    
    try{
    for (Coin c : coin){
      c.display();
      if (c.isCollected()){
        coin.remove(c);
       }
     }
   }
   catch(Exception e){}
  }


  Boolean collision() {
    if (coin.Collision()) {
      return true;
    }
    return false;
  }
}
