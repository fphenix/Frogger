class Nest extends BoxObject {

  Nest (int txn, int tyn) {
    super(txn, tyn, 1, 1, color(0x10, 0x10, 0x10));
    this.setRoundCorners();
  }
}