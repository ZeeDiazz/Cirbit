class Game{
  
  Rope R1;
  Ball B1;
  
 void setup(){
   R1 = new Rope(new PVector(width/2,10),125);
   B1 = new Ball(new PVector (R1.locR.x, R1.locR.y),new PVector (R1.ori.x,R1.ori.y));
 }
  
  void draw(){
    clear();
    R1.run();
    B1.run();
  }
  
  boolean connected(){
    if(B1.connect()){
      return true;
    }
    return false;
  }
}
