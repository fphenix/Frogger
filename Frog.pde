class Frog extends BoxObject {

  Frog (int txn, int tyn) {
    super(txn, tyn, 1, 1, color(0x20, 0xB0, 0x30, 0xC0));
    this.type = TYPEFROG;
    this.setShapeCircle();
  }

  void move (int xm, int ym) {
    this.x += xm * this.w;
    this.y -= ym * this.h;
    this.bound();
  }

  void stepBack () {
    this.y += this.h;
  }

  void regen (boolean recons, String str, color c) {
    fill(c);
    rect(0, 0, width, height);
    if (recons) {
      this.reconstruct(5, 0);
    }
    fill(0);
    text(str, 50, 30);
  }

  void win () {
    this.regen(false, "You win!", color(0, 255, 0));
  }

  void reset (String str) {
    color c = color(255, 0, 0);
    this.regen(true, str, c);
  }

  void saved (int sc) {
    color c = color(0, 255, 0);
    String str = str(sc) + ((sc < 2) ? " froggy saved..." : " Froggies saved!!!");
    this.regen(true, str, c);
  }
}