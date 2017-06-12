class Log extends BoxObject {

  Log (int txn, int tyn, int twn, float ts) {
    super(txn, tyn, twn, 1, color(0x90, 0x50, 0x00));
    this.setSpeed(ts);
    this.setRoundCorners();
  }
}