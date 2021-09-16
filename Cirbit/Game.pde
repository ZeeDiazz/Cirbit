class Game{
  ArrayList<Electricity> EList = new ArrayList<Electricity>();
  void setup(){
    EList.add(new Electricity(1200,700, 450,399));
  }
  
  void draw(){
    for(Electricity e : EList){
      e.display();
      e.update();
    }
  }
}
