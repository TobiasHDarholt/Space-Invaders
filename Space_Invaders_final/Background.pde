abstract class samling {
  float x, y, dx, dy;

  samling() {
  }

  void show() {
  }

  void act() {
  }

  boolean hasDied() {
    return false;
  }
}

class Star extends samling {
  Star() {
    x = random(0, width);
    y = 0;
    dx = 0;
    dy = random(3, 5);
  }

  void show() {
    rect(x, y, dy, dy);
  }

  void act() {
    x = x + dx;
    y = y + dy;
  }

  boolean hasDied() {
    return y > height;
  }
}
