class Button{
  //PImage bg;
  
  float x,y,w,h,textSize;
  String text;
  boolean isPressed = false;
  boolean isReleased = true;
  float textX, textY;
  Button(float _x, float _y, float _w, float _h, float _textSize, String _text, float _textX, float _textY){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    textSize = _textSize;
    text = _text;
    textX = _textX;
    textY = _textY;
  }
  
  void update(){
    if(isReleased){
      isPressed = false;
    }
  }
  //Returns true if the mouse is in the button
  boolean checkMouse(){
    if(mouseX > x && mouseX < x + w){
      if(mouseY > y && mouseY < y + h){
        return true;
      }
    }
    return false;
  }
  
  void display(){
    mouseHover();
    if(isPressed){
      fill(255);
      strokeWeight(3);
      rect(x,y,w,h);

    }
    if(isReleased){
      fill(255);
      strokeWeight(1);
      rect(x,y,w,h);
    }
    
    
    push();
      textAlign(CENTER, CENTER);
      translate(x,y);
      textSize(textSize);
      fill(10);
      text(text,textX,textY);
    pop();
  }
  
  void mouseHover(){
    if(checkMouse()){
      cursor(HAND);
      return;
    }    
  }
}
