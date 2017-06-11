class Frog extends BoxObject {

  Frog (int tx, int ty) {
    super(tx, ty, 1, 1, color(0x20, 0xB0, 0x30));
    this.setShapeCircle();
  }

  void move (int xm, int ym) {
    this.xN += xm;
    this.yN += ym;
    this.bound();
    this.update();
  }
}