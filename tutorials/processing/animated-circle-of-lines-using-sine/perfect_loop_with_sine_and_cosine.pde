// thedotisblack youtube https://www.youtube.com/watch?v=ehT7d9JPulQ

float x = 400;
float y = 400;
float lineAngle = 0;
float pointAngle = 0;
float dia = 20;

void setup() {
  // Switch between fullscreen and windowed
  size(900, 900);
  surface.setLocation(987, 70);
  //fullScreen();
}

void draw() {
  background(#151515);
  
  // Specifies an amount to displace objects within the display window.
  translate(width/2, height/2);
  
  // Make everything rotate
  rotate(radians(lineAngle/3));
  
  for(float a = 0; a < 360; a += 10) {
    //Pushes the current transformation matrix onto the matrix stack
    //Understanding pushMatrix() and popMatrix() requires understanding the concept of a matrix stack. 
    //The pushMatrix() function saves the current coordinate system to the stack and popMatrix() restores the prior coordinate system. pushMatrix() and popMatrix() 
    //are used in conjuction with the other transformation functions and may be embedded to control the scope of the transformations. 
    
    // Test this for loop with and without pushMatrix & popMatrix (without the lines are not evenly spread)
    pushMatrix();
    rotate(radians(a));
    stroke(255);
    strokeWeight(3);
    
    // 1. with just X it creates a circle with lines
    //line(x), 0, 0, 0);
    
    // 2. with sin and angle it animates the circle lines going from zero to full width (middle point stays there, the length changes to full width)
    //line(x*sin(radians(angle)), 0, 0, 0);
    
    // 3. with x (300) in line's x-coordinate of the second point, it animates the line so the end points of line stays there, and the length of line changes to full width towards middle
    //line(x*sin(radians(angle)), 0, x, 0);
    
    // 4. adding y makes the lines move from middle to sizes
    //line(x*sin(radians(angle)), 0, x, y);
    
    // 5. removing x value makes the lines move even more, so the middle point of line touches the outer points
    //line(x*sin(radians(lineAngle)), 0, 0, y);
    
    // 6. Make the line a little smaller so th line doesn't overlap with the outer point ellipse (that doesn't have fill)
    line(x*sin(radians(lineAngle)), 0, 0, y-dia/2);
    
    // Adds ellipses to the outer point of the lines
    // draw just outline, don't fill
    stroke(255);
    noFill();
    ellipse(0, y, dia, dia);
    
    // 1. Adds ellipses to the middle point of the lines and moves it together with the line
    // If the pointsAngle is changed, for example the starting number would be 250, the points would move differently than the lines
    //ellipse(x*sin(radians(pointAngle)), 0, dia, dia);
    
    // 2. Make the middle ellipses smaller
    // Disables drawing the stroke (outline). If both noStroke() and noFill() are called, nothing will be drawn to the screen. 
    // don't draw outline, just fill
    noStroke();
    fill(255);
    ellipse(x*sin(radians(pointAngle)), 0, dia/2, dia/2);
    
    popMatrix();
  }
  
  lineAngle++;
  pointAngle++;
}
