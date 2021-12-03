// Inspiration taken from Ibby EL-Serafy https://theibbster.medium.com/a-gentle-introduction-to-coding-by-making-generative-art-c7f0a7b744a6
// Credit the original artist if you use the code!

int step = 30;
int sizeOfLine = 30;

void setup() {
  size(1000, 1000);
  strokeWeight(5);

  /*  1st part  */
  // You can use noLoop() for only calling draw() once
  // Make sure noLoop() is uncommented before going forward
  noLoop();
}

void draw() {
  println("Am I looping?");
  background(255);

  /*  2nd part  */
  // For loop can be used for generating different lines
  // Uncomment one line of code at a time and see what types of lines are generated (and then comment the line again)
  // Leave the last (4th) line uncommented
  for (int i = 0; i < height; i += step) {
    // 1
    line(i, 0, i, i);

    // 2
    //line(i, 0, height, height);

    // 3
    //line(i, height, height, i);

    // 4
    //line(i, 0, i, height);  // COMMENT THIS AFTER TESTING 3RD PART
  }

  /*  3rd part  */
  // Using another for loop creates a grid
  // Uncomment the line of codeto see the grid and then comment the line again
  // After testing, comment the 2nd part 4th line again
  for (int j = 0; j < width; j += step) {
    //line(0, j, width, j);  // UNCOMMENT, RUN AND THEN COMMENT THIS LINE AGAIN
  }

  /*  4th part  */
  // Playing with the for loop creates different compositions
  // Here the lines are only drawn in the middle of the window
  // Uncomment the line of code, test how it looks and then comment it again
  for (int j = 100; j < width - 100; j += step) {
    //line(100, j, width-100, j + step * 2);
  }

  /*  5th part  */
  // Two nested for loops can cause interesting compositions
  // Uncomment one line of code at a time and see what kind of compositions are generated (and then comment the line again)
  // Make sure all the lines are commented before going to 6th part
  for (var x = 0; x < width; x += step) {
    for (var y = 0; y < height; y += step) {
      // 1
      //line(x, y, x + step, y + step);

      // 2
      //line(x, y, x + 20, y + 20);

      // 3
      /*strokeWeight(1 + x / step);
      line(x, y, x + (step/2), y + (step/2));
      strokeWeight(1 + x/step/10);
      line(x + (step/2), y + (step/2), x + step, y + step);*/
    }
  }

  /*  6th part  */
  // Let's use a function for generating lines with different stroke weights
  // It uses random for setting a thin stroke to a lines going to other direction,
  // and setting thicker stroke to lines going to another direction
  // Uncomment DrawRandomLine(a, b) and see what it looks like
  for (int a = 0; a < width; a += step) {
    for (int b = 0; b < height; b += step) {
       //DrawRandomLine(a, b);
    }
  }
}

/*  EXTRA:  Test what the application looks like when noLoop() in setup() is commented out  */

void DrawRandomLine(int x, int y) {
  if (random(0, 1) > 0.5) {
    strokeWeight(sizeOfLine/2);
    line(x, y, x + step, y + step);
  } else {
    strokeWeight(1);
    line(x + step, y, x, y + step);
  }
}
