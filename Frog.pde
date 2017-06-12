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

  void reset (String str) {
    fill(255, 0, 0);
    rect(0, 0, width, height);
    this.reconstruct(5, 0);
    println(str);
  }
}