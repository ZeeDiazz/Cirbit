class Shop {
  float scroll;
  float textY = 100;
  ArrayList<Button> buttonList = new ArrayList<Button>();
  void setup() {
    buttonList.add(new Button(width/2-200, 200+250*0, 400, 200, 18, "Default ball", 320, 180, true, 7,0));
    buttonList.add(new Button(width/2-200, 200+250*1, 400, 200, 18, "Yellow ball", 320, 180, true, 7,0));  //x,y,w,h,textsize,"text",textX,textY
    buttonList.add(new Button(width/2-200, 200+250*2, 400, 200, 18, "Green/Blue ball", 320, 180, true, 7,0));  
    buttonList.add(new Button(width/2-200, 200+250*3, 400, 200, 18, "Flame ball", 320, 180, true, 7,0));  
    buttonList.add(new Button(width/2-200, 200+250*4, 400, 200, 18, "Rainbow Ball", 320, 180, true, 7,0));
    buttonList.add(new Button(width/2-200, 200+250*5, 400, 200, 18, "Dr Phil M&M", 320, 180, true, 7,0));
  }

  void update() {
    for (Button b : buttonList) {
      b.y = b.y+scroll;
    }
  }

  void display() {
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Shop", width/2, textY);
    textY+=scroll;
    scroll = 0;
    textAlign(CORNER, CORNER);
  }

  void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    if (e<0) {
      if (textY < 100) {
        scroll+=20;
      }
    } else if (e>0) {
      scroll-=20;
    }
  }
  void mousePressed() {
  }

  void mouseReleased() {
  }
}
