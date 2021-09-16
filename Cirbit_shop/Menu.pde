class Menu{
  
  Shop shop = new Shop();
  
  void setup(){
    shop.setup();
  }
  
  void draw(){
    shop.update();
    shop.display();
  }
  
}
