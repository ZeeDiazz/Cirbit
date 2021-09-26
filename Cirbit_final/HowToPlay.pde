class HowToPlay {
  PImage img1;
  PImage img2;
  float scroll;
  float textX = 100;
  float textY = 100;
  Button button = new Button(200, 100, 100, 70, 20, "Home", 50, 35, true, 0, 1);
  void setup() {
    img1 = loadImage("Show.png");
    img2 = loadImage("Example.png");
  }

  void update() {
    println("HERE");
    cursor(ARROW);
    button.update();
  }
  void display() {
    button.display();
    image(img1, 800, textY+250, 600, 400);

    fill(255);
    textSize(100);
    text("How to play", 500, textY);


    textSize(20);
    text("Get to the star and collect all the coins. You can move by pressing 'A' and 'D'. You can deteah the ball, by pressing 'space' you can also use the", textX, textY+520);
    text("boost function by pressing 'SHIFT'.", textX, textY+542);

    text("You can also buy skins/costume in the shop, with the coins you collect.", textX, textY+590);

    textSize(50);
    text("Example of how to play", textX, textY+650);
    image(img2, 800, textY+875, 600, 400);

    textSize(20);
    text("This example shows how to complete this level with a redline. The redline shows where to move the ball to collect the star. ", textX, textY+1110);
    text("The red striped line shows, where you detach form the rope, in order to complete the level.", textX, textY+1130);
    textY+=scroll;
    scroll = 0;
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
    button.isPressed = true;
    button.isReleased = false;
  }
  void mouseReleased() {
    button.isPressed = false;
    button.isReleased = true;
    if (button.checkMouse()) {
      menu.showTab = 1;
    }
  }
}
