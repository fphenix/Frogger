class Turtle extends BoxObject {

  boolean dive = false;
  int diveSpeed = 200;
  int divingSpeed = 150;
  int diveCounter;
  int divingCounter;

  Turtle (int txn, int tyn) {
    super(txn, tyn, 1, 1, color(0xB0, 0x40, 0x10));
    this.setShapeCircle();
    this.diveSpeed += floor(random(800));
    this.diveCounter = this.diveSpeed;
    this.divingCounter = -1;
    this.underwater = true;
  }

  void update () {
    this.diveCounter--;
    this.underwater = false;
    if (this.diveCounter <= 0) {
      this.diveCounter = this.diveSpeed;
      this.divingCounter = this.divingSpeed;
      this.dive = !this.dive;
    }
    if (this.divingCounter >= 0) {
      if (this.dive) { // diving
        this.w = floor(this.h * (1.0 * this.divingCounter / this.divingSpeed));
      } else { // surfacing
        this.w = floor(this.h * ((1.0 * this.divingSpeed - this.divingCounter) / this.divingSpeed));
      }
      this.divingCounter--;
    } else {
      if (this.dive) {
        this.underwater = true;
      }
    }
  }
}