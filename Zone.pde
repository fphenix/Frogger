class Zone extends BoxObject {

  Zone (int tyn, int thn, color tc) {
    super(0, tyn, floor(width / SCALE), thn, tc);
  }
}