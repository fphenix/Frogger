class Car extends BoxObject {

  Car (int tx, int ty, int tw, float ts) {
    super(tx, ty, tw, 1);
    this.setSpeed(ts);
    this.setRoundCorners();
  }
}