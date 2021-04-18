ArrayList<samling> engine;
ArrayList<Skud> bullets = new ArrayList<Skud>();
ArrayList<Fjende> enemies = new ArrayList<Fjende>();
ArrayList<Powerups> powerups = new ArrayList<Powerups>();

boolean left, right;
boolean shooting = true;

String retning = "højre";

Spiller s;

float skudDelayPlayer;
float skudDelayEnemy;
float playerTimer = 500;

int knapX, knapY;
int knapW = 500;
int knapH = 150;

int stage = 0;

int Score = 0;

float farve1, farve2, farve3;

void setup() {
  fullScreen();
  rectMode(CENTER);
  textMode(CENTER);
  noStroke();

  engine = new ArrayList<samling>(100);

  s = new Spiller();

  knapX = width/2;
  knapY = height/2;
}

void draw() {

  farve1 = random(255-1);
  farve2 = random(255-1);
  farve3 = random(255-1);

  println(playerTimer);

  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  switch(stage) {

  case -1:
    background(255, 0, 0);
    fill(0);
    textSize(200);
    text("Game Over", width/2-550, height/2);
    textSize(20);
    text("Press Q to exit the game", width/2-150, height/2+150);
    Tilbage();
    fill(0);
    textSize(50);
    text("Score: "+ Score, knapX-200, knapY-400);

    int q = engine.size()-1;
    while (q >= 0) {
      samling obj = engine.get(q);
      obj.show();
      obj.act();
      if (obj.hasDied()) {
        engine.remove(q);
      }
      q--;
    }

    break;

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  case 0:
    background(100);
    fill(0);
    rect(knapX, knapY-200, knapW, knapH);
    if (mousePressed) {
      if (mouseX>knapX-knapW/2 && mouseX<knapX+knapW/2 && mouseY>knapY-200-knapH/2 && mouseY<knapY-200+knapH/2) {
        int antalFjender = 10;
        for (int i = 0; i < antalFjender; i++) {
          enemies.add(new Fjende(20+(i*75), 50, 50, 1, 500));
        }
        stage = 1;
      }
    }
    rect(knapX, knapY, knapW, knapH);
    if (mousePressed) {
      if (mouseX>knapX-knapW/2 && mouseX<knapX+knapW/2 && mouseY>knapY-knapH/2 && mouseY<knapY+knapH/2) {
        int antalFjender = 20;
        for (int i = 0; i < antalFjender; i++) {
          enemies.add(new Fjende(20+(i*75), 40, 40, 2, 200));
        }
        stage = 2;
      }
    }
    rect(knapX, knapY+200, knapW, knapH);
    if (mousePressed) {
      if (mouseX>knapX-knapW/2 && mouseX<knapX+knapW/2 && mouseY>knapY+200-knapH/2 && mouseY<knapY+200+knapH/2) {
        int antalFjender = 40;
        for (int i = 0; i < antalFjender; i++) {
          enemies.add(new Fjende(20+(i*50), 20, 20, 3, 50));
        }
        stage = 3;
      }
    }
    textSize(50);
    fill(0, 255, 0);
    text("Easy", knapX-55, knapY-185);
    fill(255, 255, 0);
    text("Medium", knapX-90, knapY+15);
    fill(255, 0, 0);
    text("Hard", knapX-55, knapY+215);
    fill(0);
    text("Score: "+ Score, knapX-100, knapY-400);
    textSize(20);
    fill(255,0,0);
    text("!Warning flashy images!", knapX-110, knapY+250);
    break;

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  case 1:
    clear();
    background(0);
    s.update();
    s.display();
    s.die();

    if (enemies.size()<1) {
      stage = 0;
      s.hp = 3;
      powerups.clear();
      bullets.clear();
    }

    for (Fjende f : enemies) {
      f.collide();
      f.move();
      f.display();
      f.shoot();
      playerTimer = 500;
    }

    for (int i = 0; i < enemies.size(); i++) {
      enemies.get(i).die();
    }

    for (int i = 0; i < powerups.size(); i++) {
      powerups.get(i).collide();
    }

    for (Powerups p : powerups) {
      p.display();
    }
    for (Powerups p : powerups) {
      p.move();
    }

    fill(255, 0, 0);

    textSize(50);
    Score();
    showHP();
    Tilbage();

    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).hitEnemy();
    }


    for (int i = 0; i < bullets.size(); i++) {
      bullets.get(i).Move();
      bullets.get(i).hitPlayer();
    }

    for (Skud ss : bullets) {
      ss.Display();
    }


    fill(255);
    int i = engine.size()-1;
    while (i >= 0) {
      samling obj = engine.get(i);
      obj.show();
      obj.act();
      if (obj.hasDied()) {
        engine.remove(i);
      }
      i--;
    }

    break;

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  case 2:
    clear();
    background(0);
    s.update();
    s.display();
    s.die();

    if (enemies.size()<1) {
      stage = 0;
      s.hp = 3;
      powerups.clear();
      bullets.clear();
      playerTimer = 500;
    }

    for (Fjende f : enemies) {
      f.collide();
      f.move();
      f.display();
      f.shoot();
    }
    for (int e = 0; e < enemies.size(); e++) {
      enemies.get(e).die();
    }

    for (int e = 0; e < powerups.size(); e++) {
      powerups.get(e).collide();
    }

    for (Powerups p : powerups) {
      p.display();
    }
    for (Powerups p : powerups) {
      p.move();
    }

    fill(255, 0, 0);

    textSize(50);
    Score();
    showHP();
    Tilbage();

    for (int e = 0; e < bullets.size(); e++) {
      bullets.get(e).hitEnemy();
    }

    for (int e = 0; e < bullets.size(); e++) {
      bullets.get(e).Move();
      bullets.get(e).hitPlayer();
    }

    for (Skud ss : bullets) {
      ss.Display();
    }

    fill(255, 165, 0);
    int e = engine.size()-1;
    while (e >= 0) {
      samling obj = engine.get(e);
      obj.show();
      obj.act();
      if (obj.hasDied()) {
        engine.remove(e);
      }
      e--;
    }
    break;

    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  case 3:
    clear();
    background(random(50-0));
    s.update();
    s.display();
    s.die();

    if (enemies.size()<1) {
      stage = 0;
      s.hp = 3;
      powerups.clear();
      bullets.clear();
      playerTimer = 500;
    }

    for (Fjende f : enemies) {
      f.collide();
      f.move();
      f.display();
      f.shoot();
    }
    for (int f = 0; f < enemies.size(); f++) {
      enemies.get(f).die();
    }

    for (int f = 0; f < powerups.size(); f++) {
      powerups.get(f).collide();
    }

    for (Powerups p : powerups) {
      p.display();
    }
    for (Powerups p : powerups) {
      p.move();
    }

    fill(255, 0, 0);

    textSize(50);
    Score();
    showHP();
    Tilbage();

    for (int f = 0; f < bullets.size(); f++) {
      bullets.get(f).hitEnemy();
    }

    for (int f = 0; f < bullets.size(); f++) {
      bullets.get(f).Move();
      bullets.get(f).hitPlayer();
    }

    for (Skud ss : bullets) {
      ss.Display();
    }

    fill(farve1, farve2, farve3);
    int r = engine.size()-1;
    while (r >= 0) {
      samling obj = engine.get(r);
      obj.show();
      obj.act();
      if (obj.hasDied()) {
        engine.remove(r);
      }
      r--;
    }
    break;
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  engine.add(new Star());
}


void keyPressed() {
  if (shooting && key == ' ' && millis()>skudDelayPlayer+playerTimer) {
    skudDelayPlayer = millis();
    bullets.add(new Skud(s.x, s.y, "player"));
    shooting = false;
  }
  switch(keyCode) {
  case 37: //left
    left = true;
    break;
  case 39: //right
    right = true;
    break;
  }
}

void keyReleased() {
  shooting = true;
  switch(keyCode) {
  case 37: //left
    left = false;
    break;
  case 39: //right
    right = false;
    break;
  }
}

void Score() {
  text("score: "+Score, 20, height-20);
}

void Tilbage() {
  if (keyPressed) {
    if (key == 'q') {
      exit();
    }
  }
}

void showHP() {
  text("Liv: "+ s.hp, width-150, height-20);
}
