
public final int SCALE = 50; 

Level level1;
Frog frog;

void setup () {
  size(600, 750);
  
  level1 = new Level();
  frog = new Frog(5, 0);
}

void draw () {
  level1.show();
  frog.show();
}

void keyPressed () {
  switch (keyCode) {
  case UP:
    frog.move(0, 1);
    break;
  case DOWN:
    frog.move(0, -1);
    break;
  case LEFT:
    frog.move(-1, 0);
    break;
  case RIGHT:
    frog.move(1, 0);
    break;
  default:
    //
  }
}