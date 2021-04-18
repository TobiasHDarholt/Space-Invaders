class Fjende {
  //ejendomme
  float size;
  PVector pos;
  int hp;
  int randomEnemy;
  int Delay;

  //constructor
  Fjende(float x, float y, float s, int liv, int Delay2) {
    pos = new PVector(x, y);
    size = s;
    hp = liv;
    Delay = Delay2;
  }

  //metoder
  void display() {
    fill(255,0,0);
    rect(pos.x, pos.y, size, size);
  }

  void move() {
    switch(retning) {
    case "højre":
      pos.x++;
      break;
    case "venstre":
      pos.x--;
      break;
    }
  }

  void shoot() {
    randomEnemy = (int) random(0, enemies.size());
    if (skudDelayEnemy + Delay < millis()) {
      skudDelayEnemy = millis();
      bullets.add(new Skud(enemies.get(randomEnemy).pos.x, enemies.get(randomEnemy).pos.y, "enemy"));
    }
  }

 void die() {
    if (hp < 1) {
      switch((int) random(0,10)) {
      case 0:
      powerups.add(new Powerups(pos.x,pos.y, "fasterShooting"));
      break;
      case 1:
      powerups.add(new Powerups(pos.x,pos.y, "addHealth"));
      break;
      }
      print("die");
      Score += 100;
      enemies.remove(this);
    }
  }

  void collide() {
    if (pos.x>width) {
      retning = "venstre";
    } 
    if (pos.x<0) {
      retning = "højre";
    }
  }
}
