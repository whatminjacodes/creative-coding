
RandomWalker rLine1, rLine2, rLine3;

void setup() {
  size(960, 1080);
  surface.setLocation(957, 0);
  background(255);

  // Line adjustments
  stroke(40);
  strokeWeight(10); // 10

  rLine1 = new RandomWalker(20, 20, 1, 0, 0);
  rLine2 = new RandomWalker(20, 20, 0, 1, 0);
  rLine3 = new RandomWalker(20, 20, 0, 0, 1);
}

void draw() {
  for (int n = 0; n < 100; n++) {
    rLine1.update();
    rLine2.update();
    rLine3.update();
  }
}

class RandomWalker {
  float x1, y1, x2, y2;
  float xStep = 10, yStep = 5; // 5
  float rOff, black, red, green, blue;

  RandomWalker(float xStep_, float  yStep_, float red_, float green_, float blue_) {
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

    // Using Perlin Noise to create a random sequence ofvalues for the color of the stroke
    // This mimics a brush
    rOff += 0.01;
    //black = noise(rOff) * 200;
    //stroke(black);

    if (red > 0) {
      red = noise(rOff) * 200;
    }

    if (green > 0) {
      green = noise(rOff) * 200;
    }

    if (blue > 0) {
      blue = noise(rOff) * 200;
    }
    //red = noise(rOff) * 200;
    //stroke(red, 0, 0);

    //green = noise(rOff) * 200;
    //stroke(0, green, 0);

    //blue = noise(rOff) * 200;
    //stroke(0, 0, blue);

    stroke(red, green, blue);
    line(x1, y1, x2, y2);
  }
}
