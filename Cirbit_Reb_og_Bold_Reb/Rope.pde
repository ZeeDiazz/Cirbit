class Rope {
  
  PVector ori;                      // origin
  PVector locR;                      // location
  
  float l;                          // length of rope
  float angle;                      // angle
  float aVel;                       // angled velocity
  float aAccel;                     // angled acceleration
  float damping;                    // the dampening of velocity
 
  Rope(PVector ori_, float l_) {
    ori = ori_.get();
    locR = new PVector();
    l = l_;
    angle = PI/4;
    
    aVel = 0.0;
    aAccel = 0.0;
    
    damping = 0.995;
    
  }
  
    void run(){
    update();
    display();
  }
  
  void update(){
    float gravity = 0.4;


      aAccel = (-1 * gravity / l) * sin(angle);

    aVel += aAccel;
    angle += aVel;

    aVel *= damping;
  }
  
  void display(){
    locR.set(l*sin(angle),l*cos(angle),0);
    locR.add(ori);
    
    stroke(100);
    
    if(game.connected()){
    line(ori.x, ori.y, locR.x, locR.y);
    }
  }
}
