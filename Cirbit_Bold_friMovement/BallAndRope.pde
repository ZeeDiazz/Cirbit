class BallAndRope { //<>//

  PVector origin;
  PVector location;
  PVector gravity = new PVector(0, 0.4);
  ;

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

  void run() {
    update();
    display();
    takeOff();
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
  }

  void display() {
    strokeWeight(1);
    stroke(255);
    if (connected) {
      line(origin.x, origin.y, location.x, location.y);
    }
    stroke(0);
    strokeWeight(0);
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
      ballAcceleration.x+=0.05;
    }
    if (fallingLeft) {
      ballAcceleration.x-=0.05;
    }
  }

  void connected() {
    location.set(ropeLength * sin(angle), ropeLength * cos(angle));
    location.add(origin);

    angledAcceleration = (-1 * gravity.y / ropeLength) * sin(angle);

    if (movingRight) {
      if (location.y<origin.y) {
        angledAcceleration+=0.00005;
      }
      if (location.x>origin.y) {
        angledAcceleration+=0.0006;
      }
    }
    if (movingLeft) {
      if (location.y<origin.y) {
        angledAcceleration-=0.00005;
      }
      if (location.y>origin.y) {
        angledAcceleration-=0.0006;
      }
    }
    angledVelocity *= damping;
    angledVelocity += angledAcceleration;
    angle += angledVelocity;

    if (angledVelocity > 0.03 ||angledVelocity < -0.03) {
      if (angledVelocity < 0) {
        angledVelocity = -0.03;
      } else {
        angledVelocity = 0.03;
      }
    }
  }


  void reconnect() {
    ropeLength = dist(origin.x, origin.y, location.x, location.y);
    angle = v;
    ballVelocity = (temp3);
    if (ropeLength<20) {
      angledVelocity = ballVelocity.x/1600;
    } else {
      angledVelocity = ballVelocity.x/800;
    }
    angledAcceleration = 0;
    movingRight = false;
    movingLeft = false;
  }



  void applyForce(PVector force) {
    PVector f = force.copy();
    ballAcceleration.add(f);
  }

  void takeOff() {
    PVector temp = new PVector(origin.x-location.x, origin.y-location.y);
    PVector temp2 = new PVector(-temp.y, temp.x);
    temp2.limit(1);
    temp3 = new PVector(temp2.x*angledVelocity*300, temp2.y*angledVelocity*250);

    if (connected) {
      push();
      translate(location.x, location.y);
      strokeWeight(3);
      stroke(255);
      //line(0, 0, temp3.x*10, temp3.y*10);
      pop();
    }
  }

  void keyPressed() {
    if (connected) {
      if (key == 'd') {
        movingRight = true;
      }
      if (key == 'a') {
        movingLeft = true;
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
