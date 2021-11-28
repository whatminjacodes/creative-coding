// Tutorial takes inspiration from thedotisblack youtube https://www.youtube.com/watch?v=ehT7d9JPulQ
// Credit the original artist if you use the code!

float x = 300;
float y = 300;

float lineAngle = 0;
float pointAngle = 0;
float rotateAngle = 90;

float diameter = 20;

void setup() {
  /* Switch between fullscreen and windowed */
  size(1000, 1000);
  surface.setLocation(987, 70);
  //fullScreen();
}

void draw() {
  background(#151515);
  
  /* Specifies an amount to displace objects within the display window. */
  // Moves the drawing to the middle
  translate(width/2, height/2);
  
  /* Make everything rotate */
  rotate(radians(rotateAngle/3));
  
  for(float a = 0; a < 360; a += 10) {
    // Pushes the current transformation matrix onto the matrix stack
    // Understanding pushMatrix() and popMatrix() requires understanding the concept of a matrix stack. 
    // The pushMatrix() function saves the current coordinate system to the stack and popMatrix() restores the prior coordinate system. pushMatrix() and popMatrix() 
    // are used in conjuction with the other transformation functions and may be embedded to control the scope of the transformations. 
    
    // Test this for loop with and without pushMatrix & popMatrix (located in the end of the code) (without these lines are not evenly spread)
    pushMatrix();
    rotate(radians(a));
    
    /* 1st part */
    
    // Adjustments to the lines
    stroke(255);
    strokeWeight(3);
    
    // Uncomment first part and see what happens. Then comment the first line again and uncomment the second part,
    // repeat until you have gone through all six. Leave the last line uncommented.
    
    // 1. With just X it creates a circle with lines
    //line(x, 0, 0, 0);
    
    // 2. With sin and angle it animates the circle lines going from zero to full width (middle point stays there, the length changes to full width)
    //line(x*sin(radians(lineAngle)), 0, 0, 0);
    
    // 3. With x (300) in line's x-coordinate of the second point, it animates the line so the end points of line stays there, and the length of line changes to full width towards middle
    //line(x*sin(radians(lineAngle)), 0, x, 0);
    
    // 4. Adding y makes the middle ends of the lines move from middle to the side
    //line(x*sin(radians(lineAngle)), 0, x, y);
    
    // 5. Removing x value makes the lines move even more, so the middle point of line touches the outer points
    //line(x*sin(radians(lineAngle)), 0, 0, y);
    
    // 6. Make the line a little smaller so th line doesn't overlap with the outer point ellipse (that doesn't have fill)
    // (Can't really see the difference before ellipses have been added)
     line(x*sin(radians(lineAngle)), 0, 0, y-diameter/2);
    
    /* 2nd part */
    
    // Uncomment the lines of code
    
    // 1
    // Adds ellipses to the outer point of the lines
    // Draws just outline, doesn't fill the ellipse
    stroke(255);
    noFill();
    ellipse(0, y, diameter, diameter);
    
    // 2
    // Adds ellipses to the middle end of the lines and make them move with the lines
    // If the pointsAngle is changed, for example the starting number would be 250, the points would move differently than the lines
    // Doesn't draw the outline, just fills the ellipse
    noStroke();
    fill(255);
    ellipse(x*sin(radians(pointAngle)), 0, diameter/2, diameter/2);
    
   popMatrix();
  }
  
  lineAngle++;
  pointAngle++;
  rotateAngle++;
}
