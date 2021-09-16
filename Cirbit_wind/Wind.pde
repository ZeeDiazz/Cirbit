class Wind {
  //Data
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector wind = new PVector(0.1, 0);
  
  PVector windsuport = new PVector(random(-0.2,7), 0);
  float mass;
  
  boolean windcome= true;
  int time = 0;
  
  
  //Constructor
  Wind (float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
  
  //Method
  void applyForce(PVector force) { //Newtons second law 
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  // Method is used for wind force
  void time (){
    time++;
    println(time);
    
    float num = random (100,800);
    
    if (time > num){
      windcome = !windcome; //changes from plus to minus vica versa
      time = 0;
    }   
   if (windcome == true && time > 400){
      applyForce(wind.mult(0));
    
    } else if (windcome == false && time < 400){
      applyForce(wind.mult(-0.1));
      applyForce(wind.add(windsuport));
    }
    print(windcome);
  }

  void update (){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  } 
  
  //This will be deleted later on
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x + 10, location.y + 10, mass * 16, mass * 16);
  }
  
  //This method will also be deleted with display
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= 1;
      location.x = 0;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
  //This method has all the method we need, so that we only have to write wind.run, instead of all of these method in class Game  
  void run (){
    update();
    display();
    time();
    checkEdges();
  }
}
