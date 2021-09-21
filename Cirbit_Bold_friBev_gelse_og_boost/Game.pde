class Game{
  
  Rope R1;
  Ball B1;
  
 void setup(){
   R1 = new Rope(new PVector(width/2,10+125),125, new PVector (width/2,10));
   B1 = new Ball(new PVector (R1.loc.x, R1.loc.y), R1.l, R1.ori);
 }
  
  void draw(){
    clear();
    R1.run();
    B1.run();
  }
  
  boolean connected(){
    if(B1.connected()){
      return true;
    }
    return false;
  }
}
