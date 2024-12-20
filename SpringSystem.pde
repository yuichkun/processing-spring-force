class SpringSystem {
  ArrayList<Point> points;
  ArrayList<Spring> springs;
  SpringSystem(float x) {
    float restLength = height / NUM_OF_POINTS;
    points = initPoints(x,restLength);

    Point head = points.get(0);
    Point tail = points.get(points.size() - 1);
    head.lock();
    //tail.lock();

    springs = initSprings(points, restLength);
    fill(0, 0, 255);
    noFill();
  }

  void show() {
    Point head = points.get(0);
    Point tail = points.get(points.size() - 1);

    beginShape();
    curveVertex(head.pos.x, head.pos.y);
    curveVertex(head.pos.x, head.pos.y);
    for (Spring s : springs) {
      s.update();
      s.show();
    }
    curveVertex(tail.pos.x, tail.pos.y);
    endShape();

    for (Point p : points) {
      p.update();
      //repelMouse(p);
      p.applyForce(gravity);
    }
    if (mousePressed) {
      tail.pos.x = random(width);
      tail.pos.y = mouseY;
    }
  }
  void repelMouse(Point p){
    PVector mousePos = new PVector(mouseX,mouseY);
    PVector diffVec = PVector.sub(p.pos,mousePos);
    diffVec.normalize();
    float f = diffVec.mag() * 0.005;
    p.applyForce(PVector.mult(diffVec, f));
  }
}
