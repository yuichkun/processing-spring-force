class Spring {
  Point a;
  Point b;
  
  float restLength;
  Spring(Point a, Point b, float restLength) {
    this.a = a;
    this.b = b;
    this.restLength = restLength;
  }
  
  void update() {
    PVector diffVec = PVector.sub(this.a.pos, this.b.pos);
    float x = diffVec.mag() - this.restLength;
    diffVec.normalize();
    
    PVector f = PVector.mult(diffVec, k*x);
    this.b.applyForce(f);
    f.mult(-1);
    this.a.applyForce(f);
  }

  void show() {
    stroke(200,100,100, 255);
    curveVertex(a.pos.x, a.pos.y);
  }
}

ArrayList<Spring> initSprings(ArrayList<Point> points, float restLength) {
  ArrayList<Spring> springs = new ArrayList<Spring>();
  
  for(int i = 0; i < points.size(); i++) {
    if(i==0) continue;
    Point p = points.get(i);
    Point prevP = points.get(i-1);
    springs.add(new Spring(p, prevP, restLength));
  }
  
  return springs;
}
