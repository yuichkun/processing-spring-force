class Point {
  PVector pos;
  PVector velocity;
  boolean isLocked = false;

  Point(PVector pos) {
    this.pos=pos;
    this.velocity = new PVector(0, 0);
  }

  void lock() {
    this.isLocked = true;
  }

  void applyForce(PVector force) {
    this.velocity.add(force);
  }

  void update() {
    if (!this.isLocked) {
      this.pos.add(this.velocity);
      this.velocity.mult(FRICTION);
    }
  }

  void show() {
    int s = 10;
    ellipse(this.pos.x, this.pos.y, s, s);
  }
}

ArrayList<Point> initPoints(float x, float distance) {
  ArrayList<Point> points = new ArrayList<Point>();
  for (int i = 0; i < NUM_OF_POINTS; i++) {
    float y = i * distance;
    PVector pos = new PVector(x, y);
    Point point = new Point(pos);
    points.add(point);
  }
  return points;
}
