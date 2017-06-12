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

  Lane nests;

  BoxObject constants;

  Level () {
    this.constants = new BoxObject(0, 0, 0, 0, 0);

    this.safe1 = new Zone(0, 1, color(0, 0x60, 0x20));
    this.road  = new Zone(5, 5, color(0x40, 0x40, 0x40));
    this.safe2 = new Zone(6, 1, color(0, 0x60, 0x20));
    this.river = new Zone(12, 6, color(0x0, 0x30, 0xC0));
    this.home  = new Zone(13, 1, color(0, 0x40, 0x00));

    this.cars1 = new Lane(this.constants.TYPECARS, 1, 3, 1.5, 1);
    this.cars2 = new Lane(this.constants.TYPECARS, 2, 3, -5.0, 1);
    this.cars3 = new Lane(this.constants.TYPECARS, 3, 2, 3.0, 3);
    this.cars4 = new Lane(this.constants.TYPECARS, 4, 6, -2.1, 1);
    this.cars5 = new Lane(this.constants.TYPECARS, 5, 2, 0.5, 2);

    this.turtles1 = new Lane(this.constants.TYPETURTLES, 7, 6, 0, 1);
    this.logs1    = new Lane(this.constants.TYPELOGS, 8, 3, -2.0, 3);
    this.logs2    = new Lane(this.constants.TYPELOGS, 9, 2, 3.0, 4);
    this.turtles2 = new Lane(this.constants.TYPETURTLES, 10, 5, 0, 1);
    this.logs3    = new Lane(this.constants.TYPELOGS, 11, 5, -2.0, 2);
    this.logs4    = new Lane(this.constants.TYPELOGS, 12, 4, 0.5, 4);

    this.nests = new Lane(this.constants.TYPENESTS, 13, 4, 0, 1);
  }

  void show (Frog frog) {
    this.safe1.show();
    this.road.show();
    this.safe2.show();
    this.river.show();
    this.home.show();

    this.cars1.display(frog);
    this.cars2.display(frog);
    this.cars3.display(frog);
    this.cars4.display(frog);
    this.cars5.display(frog);
    this.turtles1.display(frog);
    this.logs1.display(frog);
    this.logs2.display(frog);
    this.turtles2.display(frog);
    this.logs3.display(frog);
    this.logs4.display(frog);
    this.nests.display(frog);
  }
}