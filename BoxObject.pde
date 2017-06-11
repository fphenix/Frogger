class BoxObject {

  int xN, yN, wN, hN; // normalized, (0,0) is bottom-left
  int xMaxN, yMaxN; // normalized
  float x, y, w, h; // pix (0,0) is top-left

  color c; // color!
  int scl; // scale
  int radii = 0;

  float speed = 0;

  boolean isRect = true;

  BoxObject (int tx, int ty, int tw, int th, color tc) {
    this.construct(tx, ty, tw, th, tc);
  }

  BoxObject (int tx, int ty, int tw, int th) {
    color tc = this.rndColor();
    this.construct(tx, ty, tw, th, tc);
  }

  void construct (int tx, int ty, int tw, int th, color tc) {
    this.xN = tx;
    this.yN = ty;
    this.wN = tw;
    this.hN = th;
    this.c = tc;
    this.scl = SCALE;
    this.xMaxN = floor(width / SCALE) - 1;
    this.yMaxN = floor(height / SCALE) - 1 - 1; // "-1" more for toppest row reserved for score/time/etc.
    this.update();
  }

  void update () {
    this.x = this.xN * scl;
    this.y = height - ((this.yN + 1) * scl);
    this.w = this.wN * scl;
    this.h = this.hN * scl;
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
    return !( ((this.xN + 1) < other.xN) || (this.xN > (other.xN + 1)) || 
      (this.yN < (other.yN - 1)) || ((this.yN - 1) > other.yN) );
  }

  void move () {
    this.x += this.speed;
    if (this.x < (-2.0 * this.w)) {
      this.x = width + (2.0 * this.w);
    } else if (this.x > (width + (2.0 * this.w))) {
      this.x = -2.0 * this.w;
    }
  }

  void bound() {
    this.xN =  constrain(this.xN, 0, xMaxN);
    this.yN =  constrain(this.yN, 0, yMaxN);
  }

  void show () {
    stroke(0);
    strokeWeight(2);
    fill(this.c);
    if (this.isRect) {
      rectMode(CORNER);
      rect(this.x, this.y, this.w, this.h, this.radii);
    } else {
      ellipseMode(CORNER);
      ellipse(this.x, this.y, this.w, this.h);
    }
  }
}