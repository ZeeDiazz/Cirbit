class Shop {
  PImage ball1;
  PImage ball2;
  PImage ball3;
  PImage ball4;
  PImage ball5;
  PImage ball6;

  float scroll;
  float textY = 100;
  ArrayList<Button> buttonList = new ArrayList<Button>();
  Button button = new Button(200, 100, 100, 70, 20, "Home", 50, 35, true, 0, 1);

  void setup() {
    buttonList.add(new Button(width/2-200, 200+250*0, 400, 200, 18, "Default ball", 320, 180, true, 7, 0));
    buttonList.add(new Button(width/2-200, 200+250*1, 400, 200, 18, "Yellow ball", 320, 180, true, 7, 0));  //x,y,w,h,textsize,"text",textX,textY
    buttonList.add(new Button(width/2-200, 200+250*2, 400, 200, 18, "V Ball", 320, 180, true, 7, 0));  
    buttonList.add(new Button(width/2-200, 200+250*3, 400, 200, 18, "Green ball", 320, 180, true, 7, 0));  
    buttonList.add(new Button(width/2-200, 200+250*4, 400, 200, 18, "Rainbow Ball", 320, 180, true, 7, 0));
    buttonList.add(new Button(width/2-200, 200+250*5, 400, 200, 18, "Uganda knuckle ball", 300, 180, true, 7, 0));

    ball1 = loadImage("Ball1.png");
    ball2 = loadImage("Ball 2.png");
    ball3 = loadImage("Ball 3.png");
    ball4 = loadImage("Ball 4.png");
    ball5 = loadImage("Ball 5.png");
    ball6 = loadImage("Ball 6.png");
    imageMode(CENTER);
  }

  void update() {
    for (Button b : buttonList) {
      b.y = b.y+scroll;
    }
    button.update();
  }

  void display() {
    button.display();
    textSize(120);
    textAlign(CENTER, CENTER);
    text("Shop", width/2, textY);
    textY+=scroll;
    scroll = 0;
    textAlign(CORNER, CORNER);
    for (Button b : buttonList) {
      b.display();
    }
    println(mouseX, mouseY);
    image(ball1, 800, textY+200, 100, 100);
    image(ball2, 800, textY+450, 100, 100);
    image(ball3, 800, textY+700, 100, 100);
    image(ball4, 800, textY+950, 100, 100);
    image(ball5, 800, textY+1200, 100, 100);
    image(ball6, 800, textY+1450, 100, 100);
  }

  void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    if (e<0) {
      if (textY < 100) {
        scroll+=60;
      }
    } else if (e>0) {
      scroll-=60;
    }
  }
  void mousePressed() {
  }

  void mouseReleased() {
    if (button.checkMouse()) {
      menu.showTab = 1;
    }
  }
}
