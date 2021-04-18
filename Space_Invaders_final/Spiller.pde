class Spiller {
  //ejendomme
  float x, y, w, h;
  float xPos, xSpeed;
  int hp;
  float farve1, farve2, farve3;

  //contructor
  Spiller() {
    x = width/2;
    y = height-100;
    w = 25;
    h = 25;
    xSpeed = 10;
    xPos = 0;
    hp = 3;
  }

  //metoder
  void update() {

    if (left) {
      xPos = -xSpeed;
    }
    if (right) {
      xPos = xSpeed;
    }
    if ((!left && !right) || (left && right)) {
      xPos = 0;
    }

    if (x>width) {
      x=0;
    }

    if (x<0) {
      x=width;
    }

    //update position
    x += xPos;
    
    if(s.hp==3){
    farve1 = 0;
    farve2 = 255;
    farve3 = 0;
    }
    
    if(s.hp==2){
    farve1 = 255;
    farve2 = 165;
    farve3 = 0;
    }
    
    if(s.hp==1){
    farve1 = 255;
    farve2 = 0;
    farve3 = 0;
    }
  }

  void display() {

    fill(farve1, farve2, farve3);
    rect(x, y, w, h);
  }
  
  void die() {
    if(hp < 1) {
      stage = -1;
    }
  }
}
