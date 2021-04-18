class Powerups {
  //ejendomme
  float w, h;
  PVector pos;
  String type;
  float skudPowerupDelay;
  //contructor
  Powerups(float x, float y, String inputType) {
    pos = new PVector(x, y);
    w = 25;
    h = 25;
    type = inputType;
  }

  //metoder
  void move() {
    pos.y+=5;
  }

  void collide() {
    if (pos.x < s.x+s.w/2+w/2 && pos.x > s.x - s.w/2-w/2 && pos.y < s.y + s.h/2+h/2 && pos.y > s.y - s.h/2-h/2) {
      enhancement();
      powerups.remove(this);
    }
  }

  void display() {
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, w, h);
    println(skudPowerupDelay);
  }


  void enhancement() {
    switch(type) {
    case "addHealth":
      s.hp += 1;
      break;

    case "fasterShooting":
      if (playerTimer > 100) {
        playerTimer -= 100;
      }
      break;
    }
  }
}
