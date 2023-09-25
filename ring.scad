$fn=360;
cw = 1.5; // circle width
cr = 6;
rwMod = cr/1.3; // ring wall width (increase to descrease wall size)
desiredRingHole = 19.5;
ringD = (desiredRingHole + 0.75) / 2; // ring hole diameter

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
    translate([cr*3-0.25,0,0])
      circle(r = cr*3, $fn = 100);
    cIntSym();
  }
}



module extrudePiece() {
  intersection() {
    cIntASym();
    square([cw*2,cw*3], center=true);
  }
}

module ring() {
  rotate_extrude(convexity = 10)
    translate([ringD,0,0])
      extrudePiece();
}

// cIntSym();
// extrudePiece();
ring();