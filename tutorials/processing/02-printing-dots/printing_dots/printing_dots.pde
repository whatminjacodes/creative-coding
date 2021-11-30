// Inspiration taken from FunProgramming.org https://funprogramming.org/27-Animating-while-rotating.html

PGraphics layer;
float r = 0;
float r2 = 0.15;
float ellipseWidth = 100;

void setup() {
  size(1400, 1400);
  layer = createGraphics(width, height);
  background(0);
  noStroke();
}

void draw() {

  // Uncomment the background(0) line and run the project to see what happens when background is set in draw()
  // then comment the line again and see the difference (leave it commented when you move forward)
  // The default layer background is reset but the extra layer is not (make sure you uncomment the extra part to see this)
  //background(0);

  /* Extra: creating another layer */
  // You can also draw on another layer. Uncomment the lines in extra to see white dots drawn on top of the default layer
  // Comment the lines again to see just the default layer

  // EXTRA FROM HERE //
  /*for (float b = 0; b < 10; b++) {
   layer.beginDraw();
   // Set the dot color white
   layer.fill(255);
   
   // Rotating the dots in an even, circular pattern
   layer.rotate(r2);
   
   // Generate randomness to the dot sizes
   float circle_size = random(5, 15);
   
   // Stop drawing dots when the window width is met
   if (ellipseWidth+r2 < width) {
   layer.ellipse(ellipseWidth+r2, 1, circle_size, circle_size);
   r2 = r2 + 0.2;
   }
   
   layer.endDraw();
   // Draw the layer to the window
   image(layer, 0, 0);
   }*/
  // TO HERE//

  /* The actual project */
  for (float a = 0; a < 360; a+=10) {
    pushMatrix();

    // Set random color to a dot
    float red = random(256);
    float green = random(256);
    float blue = random(256);
    fill(red, green, blue);

    /* 1st part */
    // 1. Rotating the dots in an even, circular pattern
    rotate(r);

    // 2. Generate randomess to the rotation pattern
    // Comment the rotation above and uncomment the next two lines
    //float randomRotation1 = random(2, 6);
    //rotate(r+randomRotation1);

    /* 2nd part */
    // 1. Rotate dots in even, straight lines
    // Comment all the code from the 1st part and uncomment the line below
    //rotate(radians(a));

    // 2. Generate randomness to the straight pattern
    // Comment the rotation above and uncomment the next two lines
    //float randomRotation = random(2, 7);
    //rotate(radians(a+randomRotation));

    /* Generate dots */
    // Generate randomness to the dot sizes
    float circle_size = random(5, 15);

    // Stop drawing dots when the window width is met
    if (ellipseWidth+r < width) {
      ellipse(ellipseWidth+r, 1, circle_size, circle_size);
      r = r + 0.2;
    }

    popMatrix();
  }
}
