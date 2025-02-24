import Turtle.*;
Turtle t;

void setup() {
  size(600, 600);
  background(255);
  t = new Turtle(this);
  t.penUp();
  t.goToPoint(200, 200); // start for letter I
  t.penDown();
  t.forward(-100);   // vertical line of I
  t.penUp();
  t.goToPoint(180, 200); 
  t.penDown();
  t.right(90);
  t.forward(40); // horizontal line of I
  t.penUp();
  t.goToPoint(180, 300); 
  t.penDown();
  t.forward(40); // horizontal line of I
  

  t.penUp();
  t.goToPoint(400, 200); // start for letter I
  t.penDown();
  t.forward(80);   // horizontal line of T
  t.penUp();
  t.goToPoint(440, 200); 
  t.penDown();
  t.right(90);
  t.forward(100); // vertical line of I




}
