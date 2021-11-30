PImage img;
ArrayList<Integer> pointLocations = new ArrayList<Integer>();

/*
 *    SETUP
 *    - Get predefined starting points drawn on an image
 */
void setup() {

  // Size manually set the exact same as the image that contains particle system starting positions
  size(1836, 2470);
  background(230, 51, 140, 0);

  // Load an image that contains particle system starting points
  img = loadImage("flower-sketch-points.jpg");

  loadPixels();
  img.loadPixels();

  // Go through the pixels
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      // Find the marked pixels and save the locations
      if (r < 200 && g < 200 && b < 200) {
        pointLocations.add(loc);
      }
    }
  }
  
  println(pointLocations.size());

  for (int i = 0; i < pointLocations.size(); i++) {

    // Convert list of positions into x, y 
    int x = pointLocations.get(i) % img.width;
    int y = pointLocations.get(i) / img.width;
    
    // Draw an ellipse to the point
    ellipse(x, y, 20, 20);
  }
}

/*
 *    DRAW
 *    - Generate animation to start from predefined locations
 */
void draw() {
  
}
