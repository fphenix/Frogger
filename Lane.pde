class Lane extends BoxObject {

  public final int TYPECARS = 0;
  public final int TYPETURTLES = 1;
  public final int TYPELOGS = 2;

  int type;
  int nbelmt; // number of elements in the lane
  float speed; // negative = left, else right
  int len;

  ArrayList<BoxObject> list = new ArrayList<BoxObject>();

  Lane (int ty, int tt, int tn, float ts, int te) {
    super(0, ty, floor(width / SCALE), 1, color(0, 0, 0, 0));
    this.type = tt;
    this.nbelmt = tn;
    this.speed = ts;
    this.len = te;
    this.build();
  }

  void build() {
    int offx = floor(random(4));
    ArrayList<Boolean> turtlesPos = new ArrayList<Boolean>();
    for (int i = 0; i < this.xMaxN; i++) {
      turtlesPos.add(false);
    }
    for (int i = 0; i < this.nbelmt; i++) {
      switch (this.type) {
      case TYPETURTLES:
        while (true) {
          offx = floor(random(this.xMaxN));
          if (!turtlesPos.get(offx)) {
            turtlesPos.set(offx, true);
            this.list.add(new Turtle(offx, this.yN));
            break;
          }
        }
        break;
      case TYPELOGS:
        this.list.add(new Log(offx, this.yN, this.len, this.speed));
        offx += this.len + 1 + floor(random(4));
        break;
      default: // cars
        this.list.add(new Car(offx, this.yN, this.len, this.speed));
        offx += this.len + 1 + floor(random(5));
      }
    }
  }

  void display () {
    for (BoxObject e : this.list) {
      e.move();
      e.show();
    }
  }
}