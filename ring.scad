$fn=360;
cw = 1.5; // circle width
cr =9.8;
rwMod = 9.2; // ring wall width (increase to descrease wall size)
desiredRingHole = 19.5;
ringD = (desiredRingHole + 1.5) / 2; // ring hole diameter

// 5 = 8.5
// 6 = 10.5
// 7 = 12.5
// 10 = 18.5
// 12.5 = 22.5
// 15 = 28.5

module cIntSym() {
  intersection() {
    translate([rwMod,0,0])
      circle(r = cr, $fn = 100);
    translate([-rwMod,0,0])
      circle(r = cr, $fn = 100);
  }
}

module cIntASym() {
  intersection() {
    translate([cr*5-0.25,0,0])
      circle(r = cr*10, $fn = 100);
    cIntSym();
  }
}


module extrudePiece() {
  intersection() {
    #cIntASym();
    square([cw*2,cw*3], center=true);
  }
}

module ring() {
  rotate_extrude(convexity = 10)
    translate([ringD,0,0])
      extrudePiece();
}


// extrudePiece();
ring();