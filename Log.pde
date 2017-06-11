class Log extends BoxObject {

  Log (int tx, int ty, int tw, float ts) {
    super(tx, ty, tw, 1, color(0x90, 0x50, 0x00));
    this.setSpeed(ts);
    this.setRoundCorners();
  }
}