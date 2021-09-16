ArrayList<Button> buttons = new ArrayList<Button>();

void setup(){
  size(1600,800);
  buttons.add(new Button(500,500,100,100,10,"test")); //x,y,w,h,textsize,text
  buttons.add(new Button(600,700,120,70,10,"test")); //x,y,w,h,textsize,text
  buttons.add(new Button(600,400,120,70,10,"testinginging")); //x,y,w,h,textsize,text
}

void draw(){
  clear();
  background(100);
  
  boolean cursorNormal = true;
  for(Button b : buttons){
    b.update();
    b.mouseHover();
    b.display();
    if(b.checkMouse()){
      cursorNormal = false;
    }
  }
  
  if(cursorNormal){
    cursor(ARROW);
  }
}

void mousePressed(){
  for(Button b : buttons){
    if(b.checkMouse()){
      b.isPressed = true;
      b.isReleased = false;
    }
  }
}

void mouseReleased(){
  for(Button b : buttons){
    b.isReleased = true;
  }
}
