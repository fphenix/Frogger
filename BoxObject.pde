class BoxObject {

  int xN, yN, wN, hN; // normalized, (0,0) is bottom-left
  int xMaxN, yMaxN; // normalized
  float x, y, w, h; // pix (0,0) is top-left

  color c; // color!
  int scl; // scale
  int radii = 0;

  float speed = 0;

  boolean isRect = true;

  boolean underwater = false;
  boolean inIt = false;

  public final int TYPECARS = 0;
  public final int TYPETURTLES = 1;
  public final int TYPELOGS = 2;
  public final int TYPENESTS = 3;
  public final int TYPEFROG = 4;
  public final int TYPEDEFAULT = 5;

  int type;

  BoxObject (int txn, int tyn, int twn, int thn, color tc) {
    this.construct(txn, tyn, twn, thn, tc);
  }

  BoxObject (int txn, int tyn, int twn, int thn) {
    color tc = this.rndColor();
    this.construct(txn, tyn, twn, thn, tc);
  }

  void construct (int txn, int tyn, int twn, int thn, color tc) {
    this.type = TYPEDEFAULT;
    this.xN = txn;
    this.yN = tyn;
    this.wN = twn;
    this.hN = thn;
    this.c = tc;
    this.scl = SCALE;
    this.xMaxN = floor(width / this.scl) - 1;
    this.yMaxN = floor(height / this.scl) - 1 - 1; // "-1" more for toppest row reserved for score/time/etc.
    this.updateCoord();
  }

  void reconstruct (int txn, int tyn) {
    this.construct(txn, tyn, this.wN, this.hN, this.c);
  }

  void updateCoord () {
    this.x = this.xN * scl;
    this.y = height - ((this.yN + 1) * this.scl);
    this.w = this.wN * this.scl;
    this.h = this.hN * this.scl;
  }

  void setShapeCircle () {
    this.isRect = false;
  }

  void setRoundCorners () {
    this.radii = 20;
  }

  void setSpeed (float s) {
    this.speed = s;
  }

  color rndColor () {
    int r, g, b;
    r = floor(random(3)) * 127;
    g = floor(random(3)) * 127;
    b = floor(random(3)) * 127;
    return color(r, g, b);
  }

  boolean intersects (BoxObject other) {
    return !( ((this.x + this.w) <= other.x) || (this.x >= (other.x + other.w)) || 
      ((this.y + this.h) <= other.y) || (this.y >= (other.y + other.h)) );
  }

  void move () {
    this.x += this.speed;
    if (this.x < (-2.0 * this.w)) {
      this.x = width + (2.0 * this.w);
    } else if (this.x > (width + (2.0 * this.w))) {
      this.x = -2.0 * this.w;
    }
  }

  void update() {
  }

  void bound() {
    this.x = constrain(this.x, 0, (width - this.w));
    this.y = constrain(this.y, this.h, (height - this.h));
  }

  void show () {
    this.update();
    stroke(0);
    strokeWeight(2);
    fill(this.c);
    if (this.isRect) {
      rectMode(CORNER);
      rect(this.x, this.y, this.w, this.h, this.radii);
    } else {
      ellipseMode(CENTER);
      // "this.h" is used in the turtle class, else the ellipse uses only "this.w".
      ellipse(this.x + (this.h / 2.0), this.y + (this.h / 2.0), this.w, this.w);
    }
  }
}