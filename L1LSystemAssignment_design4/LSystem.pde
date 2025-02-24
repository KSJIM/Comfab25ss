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
      case 'C':
        softCurve(t, dist);
        break;

      case '+':
        t.left(random(rotateAngle - 20, rotateAngle + 20));
        break;

      case '-':
        t.right(random(rotateAngle - 30, rotateAngle + 30));
        break;



      case '[':
        t.push();
        break;

      case ']':
        t.pop();
        break;

      default:
        throw new IllegalArgumentException("Unknown character: " + c);
      }
    }
  }


  void softCurve(Turtle t, float dist) {
    int points = 100;
    float step = dist*random(0.5, 2.5);

    stroke(0, random(20, 50));
    strokeWeight(random(1, 4));
    noFill();

    pushMatrix();
    translate(t.getX(), t.getY());
    rotate(radians(t.getHeading()));
    beginShape();
    for (int i = 0; i <= points; i++) {
      float angle = PI * i / points;
      float x = step * cos(angle)* random(-1, 1);
      float y = 6*step * sin(angle);
      curveVertex(x, y);
    }
    endShape();
    popMatrix();
  }
}
