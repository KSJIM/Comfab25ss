import Turtle.*;

Turtle t;

void setup() {
  size(600, 600);
  background(255);
  t = new Turtle(this);

  for (int i = 0; i < 5; i++) {
    t.forward(120);
    t.right(72); 
  }
}
