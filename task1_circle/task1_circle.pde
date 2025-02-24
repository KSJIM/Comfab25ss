import Turtle.*;

Turtle t;

void setup() {
  size(600, 600);
  background(255);
  t = new Turtle(this);

  float radius = 100;
  int steps = 360;        
  float stepLength = TWO_PI * radius / steps;

  for (int i = 0; i < steps; i++) {
    t.forward(stepLength);
    t.right(360 / steps);
  }
}
