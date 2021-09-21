class Rope {
  
  PVector ori;       // origin
  PVector loc;       // location
  PVector gravity;   // gravity
  
  float l;           // length of rope
  float angle;       // angle
  float aVel;        // angled velocity
  float aAccel;      // angled acceleration
  float damping;     // the dampening of velocity
 
  Rope(PVector loc_, float l_, PVector ori_) {
    ori = ori_.get();
    loc = loc_.get();
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
    gravity = new PVector(0,0.4);

    aAccel = (-1 * gravity.y / l) * sin(angle);

    aVel += aAccel;
    angle += aVel;

    aVel *= damping;
    
    if(!game.connected()){
      l += gravity.y;      
    }
  }
  
  void display(){
    loc.set(l*sin(angle),l*cos(angle),0);
    loc.add(ori);
    
    stroke(100);
    
    if(game.connected()){
      line(ori.x, ori.y, loc.x, loc.y);
    }
  }
}
