class Menu {
  boolean viewFrontPage = true; 
  boolean viewHowToPlay = false;
  

  //Shop shop = new Shop();
  FrontPage frontpage = new FrontPage();
  Howtoplay howtoplay = new Howtoplay();

  void setup() {
    //shop.setup();
    frontpage.setup();
    //htp.setup();
  }

  void draw() {
    //shop.update();
    //shop.display();

    if (viewHowToPlay) {
      howtoplay.display();
      viewFrontPage = false;
    }
    if (viewFrontPage) {
      frontpage.display();
      viewHowToPlay = false;
      //htpBtn.display();
      //htpBtn.update();
    }
  }
  void check(){
   for(Button b : buttons){
      if(b.checkMouse()){
        
      }
    } 
  }
  
}
