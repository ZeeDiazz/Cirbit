class Wall extends Obstacle {
  float ax, ay;
  float bx, by;
  float cx, cy;
  float dx, dy;

  Wall(float _ax, float _ay, float _bx, float _by, float _cx, float _cy, float _dx, float _dy) {
    super();
    ax = _ax;
    ay = _ay;
    bx = _bx;
    by = _by;
    cx = _cx;
    cy = _cy;
    dx = _dx; 
    dy = _dy;
  }

  void update() {
  }

  void display() {

    noStroke();
    if (!killZone()) {
      fill(200, 0, 0);
    } else {
      fill(255);
    }
    beginShape();
    vertex(ax, ay);
    vertex(bx, by);
    vertex(cx, cy);
    vertex(dx, dy);
    endShape();
  }

  boolean killZone() {
    float areaPoint = 0;
    for (int i = 0; i<=3; i++) {
      areaPoint += calculateArea(i);
    }

    // https://www.mathopenref.com/coordpolygonarea.html
    float areaShape = abs( (ax*by - bx*ay) + (bx*cy - cx*by) + (cx*dy - dx*cy) + (dx*ay - ax*dy)) /2;
    if (areaPoint > areaShape) {
      return true;
    }

    return false;
  }

  float calculateArea(int i) {
    float x1, y1, x2, y2;
    x1 = 0;
    x2 = 0;
    y1 = 0;
    y2 = 0;

    switch(i) {
    case 0:
      x1 = ax;
      y1 = ay;
      x2 = bx;
      y2 = by;
      break;
    case 1:
      x1 = bx;
      y1 = by;
      x2 = cx;
      y2 = cy;
      break;
    case 2:
      x1 = cx;
      y1 = cy;
      x2 = dx;
      y2 = dy;
      break;
    case 3:
      x1 = dx;
      y1 = dy;
      x2 = ax;
      y2 = ay;
      break;
    }
    //Area  -  https://www.mathopenref.com/coordtrianglearea.html
    float area = abs( x1*(y2-game.ball.location.y) + x2*(game.ball.location.y-y1) + game.ball.location.x*(y1-y2) ) /2;
    //float area = abs( x1*(y2-mouseY) + x2*(mouseY-y1) + mouseX*(y1-y2) ) /2;
    return area;
  }
}
