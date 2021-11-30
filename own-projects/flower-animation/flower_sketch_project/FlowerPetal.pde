/*
 *    FlowerPetal
 *    - creates flower petal animations
 */
class FlowerPetal {
  float x1, y1, x2, y2;
  float xStep = 10, yStep = 5; // 5
  float rOff, black;

  FlowerPetal(float x, float y, float xStep_, float  yStep_) {
    xStep = xStep_;
    yStep = yStep_;

    x1 = x;
    y1 = y;
    x2 = x + xStep_;
    y2 = y + yStep_;

  }

  void update() {
    
    // Generate randomness to the location
    x1 += random(-xStep, xStep);
    y1 += random(-yStep, yStep);
    x2 += random(-xStep, xStep);
    y2 += random(-yStep, yStep);

    // Constraint the locations inside the window
    x1 = constrain(x1, 0, width);
    y1 = constrain(y1, 0, height);
    x2 = constrain(x2, 0, width);
    y2 = constrain(y2, 0, height);

    // Using Perlin Noise to create a random sequence ofvalues for the color of the stroke
    // This mimics a brush
    rOff += 0.01;
    black = noise(rOff) * 200;
    stroke(black);

    line(x1, y1, x2, y2);
  }
}
