// ExampleLSystemDesigns - contains helper methods to create and
// initialize an LSystem
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// [TODO]: create your own L-System initialization methods
// and use/test in the setup() method of L1LSystemAssignment file.
// See example for Square Lsystem below.

// Square Lsystem initialization
// This method returns an Lsystem object that uses
// The rules and axioms for a square based system
LSystem initSquare() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;

  // The intial axiom / input string
  String axiom = "F+F+F+F";

  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F-F-FF+F+F-F");

  // Create and return the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}


LSystem initInkTree() {
  float moveDist = 200;
  float rotateAngle = 15;
  float scaleFactor = 7.0;

  String axiom = "[~T][~T][+F][-F][R][R][R]";

  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+[+F~F]-[-F~F]+[+F~F]-[-F~F]");
  rules.put('R', "R[*R][!R]R");
  rules.put('T', "[~T~T]");

  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem Cells() {
  float moveDist = 200;
  float rotateAngle = 50;
  float scaleFactor = 8;

  String axiom = "C";

  HashMap<Character, String> rules = new HashMap<>();


  rules.put('C', "[+C][-C]C~[+C][-C]C");

  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}
