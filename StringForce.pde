final int NUM_OF_POINTS = 30;
final int NUM_OF_SYSTEMS = 10;
final float k = 0.04;
final float FRICTION = 0.99;
PVector gravity = new PVector(0, 0.01);

ArrayList<SpringSystem> systems = new ArrayList<SpringSystem>();
void setup () {
  size(500, 500);
  for (int i =0; i < NUM_OF_SYSTEMS; i++) {
    float x = (width / (NUM_OF_SYSTEMS+1))* (i+1);
    systems.add(new SpringSystem(x));
  }
  background(0);
  strokeWeight(0.4);
  blendMode(ADD);
}

void draw() {
  //background(0);
  for (SpringSystem system : systems) {
    system.show();
  }
}