class Game{
  ArrayList<Wall> wallList = new ArrayList<Wall>();
  
  void setup(){
    wallList.add(new Wall(800,300,820,350,800,430,700,400));
  }
  
  void draw(){
    for(Wall w : wallList){
      w.update();
      w.display();
    }
  }
}
