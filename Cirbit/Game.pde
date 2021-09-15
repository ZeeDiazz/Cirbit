class Game{
  Wind wind = new Wind(random(10,15),10,height/2);
  
  void setup(){
  }
   
  void draw(){
      wind.run();
  }
}
