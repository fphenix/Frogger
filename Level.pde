class Level {
  Zone safe1;
  Zone road;
  Zone safe2;
  Zone river;
  Zone home;

  Lane cars1;
  Lane cars2;
  Lane cars3;
  Lane cars4;
  Lane cars5;

  Lane turtles1;
  Lane turtles2;
  Lane logs1;
  Lane logs2;
  Lane logs3;
  Lane logs4;

  Lane constant;
  
  Level () {
    this.safe1 = new Zone(0, 1, color(0, 0x60, 0x20));
    this.road  = new Zone(5, 5, color(0x40, 0x40, 0x40));
    this.safe2 = new Zone(6, 1, color(0, 0x60, 0x20));
    this.river = new Zone(12, 6, color(0x0, 0x30, 0xC0));
    this.home  = new Zone(13, 1, color(0, 0x40, 0x00));

    this.constant = new Lane(0, 0, 0, 0, 0);
    this.cars1 = new Lane(1, this.constant.TYPECARS, 3, 1.5, 1);
    this.cars2 = new Lane(2, this.constant.TYPECARS, 4, -2.0, 1);
    this.cars3 = new Lane(3, this.constant.TYPECARS, 2, 1.0, 3);
    this.cars4 = new Lane(4, this.constant.TYPECARS, 6, -3.0, 1);
    this.cars5 = new Lane(5, this.constant.TYPECARS, 2, 0.5, 2);

    this.turtles1 = new Lane(7, this.constant.TYPETURTLES, 6, 0, 1);
    this.logs1    = new Lane(8, this.constant.TYPELOGS, 3, -2.0, 3);
    this.logs2    = new Lane(9, this.constant.TYPELOGS, 2, 3.0, 4);
    this.turtles2 = new Lane(10, this.constant.TYPETURTLES, 5, 0, 1);
    this.logs3    = new Lane(11, this.constant.TYPELOGS, 5, -2.0, 2);
    this.logs4    = new Lane(12, this.constant.TYPELOGS, 2, 0.5, 3);
  }

  void show () {
    this.safe1.show();
    this.road.show();
    this.safe2.show();
    this.river.show();
    this.home.show();
    this.cars1.display();
    this.cars2.display();
    this.cars3.display();
    this.cars4.display();
    this.cars5.display();
    this.turtles1.display();
    this.logs1.display();
    this.logs2.display();
    this.turtles2.display();
    this.logs3.display();
    this.logs4.display();
  }
}