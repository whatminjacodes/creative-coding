// Inspiration taken from thedotisblack https://www.youtube.com/watch?v=9ZL9qSag7CY

BrushStroke brush1, brush2, brush3;

void setup() {
  size(1000, 1000);
  surface.setLocation(957, 0);
  background(255);

  /* 1st part */
  // Line adjustments
  // Uncomment one line of code at a time and see how the brush stroke changes (and then comment the line again)
  // Leave the last (3rd) line uncommented
  
  // 1
  strokeWeight(10);
  
  // 2
  //strokeWeight(50);
  
  // 3
  //strokeWeight(200);

  /*  2nd part */
  // The first two values inside BrushStroke() set the amount of random movement
  // Uncomment one line of code at a time and see how the brush movement changes (and then comment the line again)
  // Leave the last (4th) line uncommented
  
  // 1 - no movement
  brush1 = new BrushStroke(0, 0, 1, 0, 0);
  
  // 2 - movement in x direction
  //brush1 = new BrushStroke(10, 0, 1, 0, 0);
  
  // 3 - movement in y direction
  //brush1 = new BrushStroke(0, 10, 1, 0, 0);
  
  // 4 - movement in both directions
  //brush1 = new BrushStroke(20, 20, 1, 0, 0);
  
  /*  3rd part */
  // Next let's add more brushes
  // The next three values in BrushStroke define the color of the brush in this order: red, green, blue
  // The value 1 means the color is chosen, so brush1 is red, brush2 is green and brush3 is blue (the color is changed in 4th part)
  
  // Uncomment brush2 and brush3 below
  // IMPORTANT: Also uncomment brush2.update() and brush3.update() from draw function
  // Then move to the update() function inside BrushStroke class (4th part)
  
  //brush2 = new BrushStroke(20, 20, 0, 1, 0);
  //brush3 = new BrushStroke(20, 20, 0, 0, 1);
}

void draw() {
  for (int n = 0; n < 10; n++) {
    brush1.update();
    //brush2.update();
    //brush3.update();
  }
}

class BrushStroke {
  float x1, y1, x2, y2;
  float xStep = 10, yStep = 5; // 5
  float rOff, black, red, green, blue;

  BrushStroke(float xStep_, float  yStep_, float red_, float green_, float blue_) {
    xStep = xStep_;
    yStep = yStep_;

    // Make starting location to the middle of the window
    x1 = width/2;
    y1 = height/2;
    x2 = width/2;
    y2 = height/2;

    // Set color
    red = red_;
    green = green_;
    blue = blue_;
  }

  void update() {
    // Generate random location
    x1 += random(-xStep, xStep);
    y1 += random(-yStep, yStep);
    x2 += random(-xStep, xStep);
    y2 += random(-yStep, yStep);

    // Constraint the locations inside the window
    x1 = constrain(x1, 0, width);
    y1 = constrain(y1, 0, height);
    x2 = constrain(x2, 0, width);
    y2 = constrain(y2, 0, height);

    /* 4th part */
    // We are using Perlin Noise to create a random sequence of values for the color of the stroke, this mimics a brush
    // Currently the color is set to be black, comment the two lines of code below and uncomment the lines coming after them
    
    rOff += 0.01;               // DON'T COMMENT THIS
    // BLACK
    black = noise(rOff) * 200;  // COMMENT THIS
    stroke(black);              // COMMENT THIS

    // COLORFUL
    // UNCOMMENT STARTING FROM HERE //
    /*if (red > 0) {  // If the color is set to be red, add noise
      red = noise(rOff) * 200;
    }

    if (green > 0) {  // If the color is set to be green, add noise
      green = noise(rOff) * 200;
    }

    if (blue > 0) {  // If the color is set to be blue, add noise
      blue = noise(rOff) * 200;
    }
    
    stroke(red, green, blue);*/
    // UNCOMMENT THE LINES ABOVE //
    
    /*  EXTRA  */
    // The code above colors the lines in red, green and blue
    // Test changing the values when creating the brush objects (rLine1 = new BrushStroke(20, 20, 1, 1, 0);)
    // For example changing the last three values to 1, 1, 0 (new BrushStroke(1, 1, 0);) makes the line yellow,
    // changing the values to 1, 0, 1 (new BrushStroke(1, 0, 1);) makes the line purple and
    // changing the values to 1, 1, 1 (new BrushStroke(1, 1, 1);) makes the line black & white
    
    line(x1, y1, x2, y2);
  }
}
