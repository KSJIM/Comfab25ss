// This is an implementation of an L-System that extends the class 
// "BaseLSystem", which makes it easy to make new types of LSystems (e.g., probabalistic)
// without repeating lots of code.
// It assumes all input vocabulary not given a rule are constants. 
// Though you could give an explicit rule for a constant using "F" --> "F"
// It contains a StringBuffer (currentIterationBuffer) that should be used
// to handle production rules when computing the currentIteration string as part of iterate
// in order avoid wasteful creation of strings and memory problems.
// The StringBuffer is used in the iterate method of the LSystem.
// @author: @mriveralee
import java.util.HashMap;

class LSystem extends BaseLSystem {
  
 // Production rules
  private HashMap<Character, String> rules;

  // Constructor for making an Lsystem object
  public LSystem(String axiom, HashMap<Character, String> rules, 
    float moveDistance, float rotateAngle, float scaleFactor) {            
    
    // Call Super Class constructor to initialize variables
    // You must always call this.
    super(axiom, moveDistance, rotateAngle, scaleFactor);
    
    // Set the Rules
    this.rules = rules;
    
    // Reset the state
    this.reset();
  }
  
  // runs 1 iteration, performing the rules for each character
  // on the current string. The result of the replacement is added to the currentIterationBuffer.
  public void iterate() {
    // get a copy of the current iteration string
    String current = this.getIterationString();
    
    // Now clear the current interation string
    this.clearCurrentStringBuffer();
    
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    String replacement = rules.get(c);
    if (replacement != null) {
      currentIterationBuffer.append(replacement);
    } else {
      currentIterationBuffer.append(c);
    }
  }

  iterationNum += 1;
}

    // [TODO]: Implement the procedure for using the rules to replace characters in the current string, 
    // and append them them to the currentIterationBuffer (DONE)

 
     // Increment our iteration after we are done
  
  // This function uses the turtle to draw based on each character in the LSystem's 
  // iteration string. It also handles scaling the moveDistance (to keep the image in frame), if desired
  public void drawLSystem(Turtle t) {
  float dist = this.moveDistance / (scaleFactor * (iterationNum + 1));
  
  String currentIteration = this.getIterationString(); 

  for (int i = 0; i < currentIteration.length(); i++) {
    char c = currentIteration.charAt(i); 

    switch (c) {
      case 'F':
        inkStroke(t, dist);
        break;
      case '+':
        t.left(random(rotateAngle - 5, rotateAngle + 15));
        break;
      case '-':
        t.right(random(rotateAngle - 10, rotateAngle +25));
        break;
      case '[':
        t.push();
        break;
      case ']':
        t.pop();
        break;
        case 'R':
  t.penUp();
  t.goToPoint(width/2, height - 200);
  t.setHeading(random(100, 260)); 
  float offset = random(10, 30); 
  t.forward(offset);
  t.penDown();
  rootStroke(t, dist); 
  break;

        case '*':
        t.right(random(160, 180));
         break;
        case '!':
         t.left(random(160, 180));
          break;
         case 'T':
         trunkStroke(t, dist); 
          break;
         case '~':
         t.right(90);
         t.penUp();
         t.forward(random(-15, 15));
         t.penDown();
         t.left(90);
          break;
      default:
       throw new IllegalArgumentException("Missing a drawing operation case for character: " + c);
     
    }
  }
}

void inkStroke(Turtle t, float dist) {
  int points = (int)random(30, 40); 
  float step = dist / points * 6;
  for (int i = 0; i < points; i++) {
    t.penUp();
    t.forward(step);
    t.penDown();
   float alpha = random(20,60);
  float sz = map(i, 0, points, 10, 2);
    fill(0, alpha);
    noStroke();
    ellipse(t.getX(), t.getY(), sz, sz); 
  }
}
void rootStroke(Turtle t, float dist) {
  int points = (int)random(50, 100); 
  float step = dist / points * 50;
  for (int i = 0; i < points; i++) {
    t.penUp();
    t.forward(step);
    t.penDown();
   float alpha = map(i, 0, points, 130, 40);
   float sz = random(1, 10);
    fill(0, alpha);
    noStroke();
    ellipse(t.getX(), t.getY(), sz, sz); 
  }
}

void trunkStroke(Turtle t, float dist) {
  int points = (int)random(5, 10);
  float step = dist / points * 4;
  
  for (int i = 0; i < points; i++) {
    t.penUp();
    t.forward(step);
    t.penDown();
    float alpha = random(20, 50);
    float sz = random(10, 15);  // 树干更粗大明显
    fill(0, alpha);
    noStroke();
    ellipse(t.getX(), t.getY(), sz, random(2*sz,3*sz));
  }
}

}
