class Skud {

  //ejendomme
  PVector pos;
  float w, h;
  float ySpeed;
  String type;

  //constructor
  Skud(float x, float y, String inputType) {
    pos = new PVector(x, y);
    w = 5;
    h = 25;
    ySpeed = 25;
    type = inputType;
  }



  void Display() {
    rect(pos.x, pos.y, w, h);
  }


  void Move() {
    if (type == "enemy") {
      pos.y += ySpeed;
    }
    if (type == "player") {
      pos.y -= ySpeed;
    }
  }


  void hitPlayer() {
    if (type == "enemy") {
      if (pos.x < s.x + s.w/2+w/2 && pos.x > s.x - s.w/2-w/2 && pos.y < s.y + s.h/2+h/2 && pos.y > s.y - s.h/2-h/2) {
        bullets.remove(this);
        s.hp -= 1;
      }
    }
  }

  void hitEnemy() {
    if (type == "player") {
      for (int i = 0; i < enemies.size(); i++) {
        if (pos.x < enemies.get(i).pos.x + enemies.get(i).size/2+w/2 && pos.x > enemies.get(i).pos.x - enemies.get(i).size/2-w/2 && pos.y < enemies.get(i).pos.y + enemies.get(i).size/2+h/2 && pos.y > enemies.get(i).pos.y - enemies.get(i).size/2-h/2) {
          bullets.remove(this);
          enemies.get(i).hp-=1;
          print(enemies.get(i).hp);
        }
      }
    }
  }
}
