Menu menu = new Menu();
Table data;
ArrayList<Button> buttons = new ArrayList<Button>();

void setup(){
  size(1600,800);
  menu.setup();  
  data = loadTable("data/data.csv", "header");
  //csv
  float numb = 1;
  for(TableRow row : data.rows()){
    println("numb: " + numb);
    numb++;
    int r = row.getInt("levelcompleted");
    println("r: " + r);
    
  }
}

void draw(){
  clear();
  background(120);
  menu.draw();
  buttons();
}

void buttons(){
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
void mouseWheel(MouseEvent event) {
  //menu.shop.mouseWheel(event);
}
