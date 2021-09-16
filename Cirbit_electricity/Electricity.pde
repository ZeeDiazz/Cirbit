class Electricity extends Obstacle{
  //First coordinate
  float x1,y1;
  //Second coordinate
  float x2,y2;
  
  float w = 50;
  boolean isDeactivated;
  
  Electricity(float _x1, float _y1, float _x2, float _y2){
    x1 = _x1;
    y1 = _y1;
    x2 = _x2;
    y2 = _y2;
  }
  
  void display(){
  
    rect(x1,y1,w,w);
    rect(x2,y2,w,w);
    
    distance = dist(x1+(w/2), y1+(w/2), x2+(w/2), y2+(w/2));
    
    stroke(c);
    strokeWeight(5);
    line(x1+(w/2), y1+(w/2), x2+(w/2), y2+(w/2)); 
    
    stroke(255);
    strokeWeight(2);
    
    stroke(255,0,0);
    mouseDistance = dist(x1+(w/2), y1+(w/2), mouseX, mouseY);
    mouseDistance += dist(mouseX, mouseY, x2+(w/2), y2+(w/2));
    
    line(x1+(w/2), y1+(w/2), mouseX, mouseY);
    line(mouseX, mouseY, x2+(w/2), y2+(w/2));
    stroke(255);
  }
  
  void update(){
    if(mouseDistance <= distance+5){
      c = color(0,0,255);
    }else{
      c = color(255);
    }
  }
  
  
}
