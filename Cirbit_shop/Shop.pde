class Shop{
  float scroll;
  float textY = 100;
  void setup(){
    buttons.add(new Button(width/2-200,200, 400,200, 18,"Skin 1",320,180));  //x,y,w,h,textsize,"text",textX,textY
    buttons.add(new Button(width/2-200,450, 400,200, 18,"Skin 2",320,180));  //x,y,w,h,textsize,"text",textX,textY
    buttons.add(new Button(width/2-200,700, 400,200, 18,"Skin 3",320,180));  //x,y,w,h,textsize,"text",textX,textY
  }
  
  void update(){
    for(int i = 0; i<3; i++){
      Button b = buttons.get(i);
      b.y = b.y+scroll;
    }
    
  }
  
  void display(){
    textSize(120);
    textAlign(CENTER,CENTER);
    text("Shop",width/2, textY);
    textY+=scroll;
    scroll = 0;
    textAlign(CORNER,CORNER);
    
    
  }
  void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    if(e<0){
      if(textY < 100){
        scroll+=20;
      }
    }else if(e>0){
      scroll-=20;
    }
  }

}
