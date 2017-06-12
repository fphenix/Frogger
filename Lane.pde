class Lane extends BoxObject {

  int nbelmt; // number of elements in the lane
  float speed; // negative = left, else right
  int len;

  ArrayList<BoxObject> list = new ArrayList<BoxObject>();

  Lane (int tt, int tyn, int tn, float ts, int te) {
    super(0, tyn, floor(width / SCALE), 1, color(0, 0, 0, 0));
    this.type = tt;
    this.nbelmt = tn;
    this.speed = ts;
    this.len = te;
    this.build();
  }

  boolean isInLane (float ty) {
    return (floor(ty) == floor(this.y)) ? true : false;
  }

  void build() {
    int offx = floor(random(4));
    ArrayList<Boolean> elmtPos = new ArrayList<Boolean>();
    for (int i = 0; i < this.xMaxN; i++) {
      elmtPos.add(false);
    }
    for (int i = 0; i < this.nbelmt; i++) {
      switch (this.type) {
      case TYPETURTLES:
        while (true) {
          offx = floor(random(this.xMaxN));
          if (!elmtPos.get(offx)) {
            elmtPos.set(offx, true);
            this.list.add(new Turtle(offx, this.yN));
            break;
          }
        }
        break;
      case TYPENESTS:
        while (true) {
          offx = floor(random(this.xMaxN));
          if (!elmtPos.get(offx)) {
            elmtPos.set(offx, true);
            this.list.add(new Nest(offx, this.yN));
            break;
          }
        }
        break;
      case TYPELOGS:
        this.list.add(new Log(offx, this.yN, this.len, this.speed));
        offx += this.len + 1 + floor(random(4));
        break;
      case TYPECARS:
        this.list.add(new Car(offx, this.yN, this.len, this.speed));
        offx += this.len + 1 + floor(random(5));
        break;
      default:
        //
      }
    }
  }

  void display (Frog frog) {
    boolean onTurtle = false;
    boolean onLog = false;
    boolean inRiverT = false;
    boolean inRiverL = false;
    for (BoxObject e : this.list) {
      e.move();
      e.show();
      boolean inter = e.intersects(frog);
      if (this.isInLane(frog.y)) {
        switch (this.type) {
        case TYPECARS:
          if (inter) {
            frog.reset("Splatch, a 2D version of yourself is on the road!");
          }
          break;
        case TYPETURTLES:
          inRiverT = true;
          if (inter && !e.underwater && !onTurtle) {
            onTurtle = true;
            break;
          }
          break;
        case TYPELOGS:
          inRiverL = true;
          if (inter && !onLog) {
            frog.x += e.speed;
            frog.bound();
            onLog = true;
          }
          break;
        default:
          //
        } // end switch
      } // end if isInLane
    } // end for each
    if (inRiverT && !onTurtle) {
      frog.reset("Plouf, Turtle went down, so did you!");
    }
    if (inRiverL && !onLog) {
      frog.reset("Plouf, off the log, Piranhas got you!");
    }
  }
}