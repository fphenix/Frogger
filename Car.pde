class Car extends BoxObject {

  Car (int txn, int tyn, int twn, float ts) {
    super(txn, tyn, twn, 1);
    this.setSpeed(ts);
    this.setRoundCorners();
  }
}