class BallAndRope {

  PVector origin;
  PVector location;
  PVector gravity = new PVector(0, 0.4);

  float ropeLength;
  float angle;       
  float angledVelocity;  
  float angledAcceleration;
  float damping;

  float v;

  float movingValue;

  boolean movingLeft;
  boolean movingRight;

  boolean fallingRight;
  boolean fallingLeft;

  boolean boosting;
  boolean connected = true;

  PVector ballVelocity;
  PVector ballAcceleration;
  PVector ballGravity;

  PVector y = new PVector (0.3, 0);
  PVector temp3;

  BallAndRope(PVector location_, float ropeLength_, PVector origin_) {
    location = location_;
    ropeLength = ropeLength_;
    origin = origin_;
    angledVelocity = 0.0;
    angledAcceleration = 0.0;
    damping = 0.992;

    ballVelocity = new PVector(0, 0);

    ballAcceleration = new PVector(-0.001, 0.01);
    ballGravity = new PVector(0, 0.08);
    ballVelocity.limit(5);
  }

  void update() {
    if (connected) {
      connected();
    }

    if (!connected) {
      disconnected();
      calculateAngle();
    }

    textSize(32);
    text("angle: " +  degrees(angle) + "°", 20, 40);
    text("angledAcceleration: " + angledAcceleration, 20, 80);
    text("angledVelocity: " + angledVelocity, 20, 120);
    takeOff();
  }

  void display() {
    strokeWeight(1);
    stroke(255);
    if (connected) {
      line(origin.x, origin.y, location.x, location.y);
    }

    strokeWeight(1);
    stroke(0);
    if (boosting) {
      stroke(0, 0, 255);
    }
    fill(255, 127, 80);
    circle(location.x, location.y, 24);

    push();
    strokeWeight(2);
    stroke(0);
    circle(origin.x, origin.y, 30);
    pop();
  }

  void calculateAngle() {
    float a = location.y - origin.y;
    float c = dist(origin.x, origin.y, location.x, location.y);
    if (location.x>width/2) {
      v = acos(a/c);
    } else {
      v = -acos(a/c);
    }
  }

  void disconnected() {
    ropeLength += ballGravity.y;
    ballVelocity.add(ballAcceleration);
    location.add(ballVelocity);
    ballAcceleration.mult(0);
    applyForce(ballGravity);

    if (fallingRight) {
      ballAcceleration.x+=0.09;
    }
    if (fallingLeft) {
      ballAcceleration.x-=0.09;
    }
  }

  void connected() {
    location.set(ropeLength * sin(angle), ropeLength * cos(angle));
    location.add(origin);

    angledAcceleration = (-1 * gravity.y / ropeLength) * sin(angle);

    if (movingRight) {
      if (boosting) {
        angledAcceleration += 0.00035;
      }
      angledAcceleration += 0.0002;
    }
    if (movingLeft) {
      if (boosting) {
        angledAcceleration -= 0.00035;
      }
      angledAcceleration -= 0.0002;
    }
    angledVelocity *= damping;
    angledVelocity += angledAcceleration;
    angle += angledVelocity;
  }

  void reconnect() {
    ropeLength = dist(origin.x, origin.y, location.x, location.y);
    angle = v;
    ballVelocity = (temp3);
    if (ropeLength<100) {
      angledVelocity = ballVelocity.x/2000;
    } else {
      angledVelocity = ballVelocity.x/800;
    }
    angledAcceleration = 0;
    movingRight = false;
    movingLeft = false;
    boosting = false;
  }

  void applyForce(PVector force) {
    PVector f = force.copy();
    ballAcceleration.add(f);
  }

  void takeOff() {
    //Finder tværvektor og tilføjer til velocity
    PVector temp = new PVector(origin.x-location.x, origin.y-location.y);
    PVector temp2 = new PVector(-temp.y, temp.x);
    temp2.limit(1);
    temp3 = new PVector(temp2.x*angledVelocity*300, temp2.y*angledVelocity*250);
  }

  void keyPressed() {
    if (connected) {
      if (key == 'd') {
        movingRight = true;
      }
      if (key == 'a') {
        movingLeft = true;
      }
      if (key == ' ') {
        boosting = true;
      }
    }
    if (!connected) {
      if (key=='d') {
        fallingRight=true;
      }
      if (key=='a') {
        fallingLeft=true;
      }
    }
    if (key =='f') {
      connected = !connected;
      reconnect();
    }
  }

  void keyReleased() {
    if (connected) {
      if (key == 'd') {
        movingRight = false;
      }
      if (key == 'a') {
        movingLeft = false;
      }
      if (key == ' ') {
        boosting = false;
      }
    }
    if (!connected) {
      if (key=='d') {
        fallingRight=false;
      }
      if (key=='a') {
        fallingLeft=false;
      }
    }
  }
}
