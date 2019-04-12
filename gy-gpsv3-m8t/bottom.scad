//circuitry dimensions
W=26;
L=36;
T=2;
H=13;

//screw pattern dimensions
SL=31;
SW=21;

// extension for wire restraint dimensions
EL=23;
EW=8;

// wire diameter
WW=6;


module footprint() {
linear_extrude(height = .0001, center = true, convexity = 10, twist = 0)
polygon(points=[
  [-W/2,-L/2],[W/2,-L/2],[W/2,L/2],
  [EW/2,L/2+EL],
  [-EW/2,L/2+EL],
  [-W/2,L/2]
  ]);
    
}

difference() {

minkowski() {
  footprint();
  cylinder(d=2*T,h=H/2+T,$fn=64);
}


translate([0,0,T])
minkowski() {
  footprint();
  cylinder(d=.001,h=H/2+T,$fn=16);
}

translate([0,0,H/2+T/2])
minkowski() {
  footprint();
  cylinder(d=T,h=H/2+T,$fn=16);
}

translate([0,0,H/2+T])
rotate([-90,0,0])
cylinder(d=WW,h=50,$fn=64);
  

translate([-SW/2,-SL/2,-.01])
cylinder(d1=5.7,d2=3.2,h=T+.02,$fn=32);
translate([-SW/2,SL/2,-.01])
cylinder(d1=5.7,d2=3.2,h=T+.02,$fn=32);
translate([SW/2,-SL/2,-.01])
cylinder(d1=5.7,d2=3.2,h=T+.02,$fn=32);
translate([SW/2,SL/2,-.01])
cylinder(d1=5.7,d2=3.2,h=T+.02,$fn=32);

translate([0,SL/2+.6,T/2])
cube_center([12,3,T]);

}



difference() {
translate([0,L/2+EL-8/2,0])
cube_center([8,8,H/2+T]);
translate([0,0,H/2+T])
rotate([-90,0,0]) {
    difference() {
    cylinder(d=WW+1,h=50,$fn=64);
        
    translate([0,0,33])
    difference() {
    cylinder(d=WW+1,h=1,$fn=64);
    cylinder(d=WW,h=1,$fn=64);
    }
    translate([0,0,35])
    difference() {
    cylinder(d=WW+1,h=1,$fn=64);
    cylinder(d=WW,h=1,$fn=64);
    }
    translate([0,0,37])
    difference() {
    cylinder(d=WW+1,h=1,$fn=64);
    cylinder(d=WW,h=1,$fn=64);
    }
    translate([0,0,39])
    difference() {
    cylinder(d=WW+1,h=1,$fn=64);
    cylinder(d=WW,h=1,$fn=64);
    }
        
    }
}
    

}





module standoff() {
  cylinder(d=3,h=5.5,$fn=32);
}

/*


difference() {
union() {
    cube_center([L+2*T,W+2*T,H+T]);
    cube_center([L+2*T,W+2*T,H+T]);
}

translate([0,0,T])
cube_center([L,W,H*2]);

}

*/

module cube_center(dims) {
    translate([-dims[0]/2, -dims[1]/2, 0])
    cube(dims);
}