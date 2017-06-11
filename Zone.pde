class Zone extends BoxObject {

  Zone (int ty, int th, color tc) {
     super(0, ty, floor(width / SCALE), th, tc);
  }
  
}