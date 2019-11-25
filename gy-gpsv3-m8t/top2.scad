//circuitry dimensions
W=26;
L=36;
T=2;
H=14.5;

//screw pattern dimensions
SL=31;
SW=21;

// extension for wire restraint dimensions
EL=23;
EW=10;

// wire diameter
WW=6;

translate([0,0,T]) {
    
difference() {
cube_center([25+1.4*T,25+1.4*T,4]);
cube_center([25.2,25.2,4]);
cube_center([2,40,4]);
    
}

}

module footprint() {
linear_extrude(height = .0001, center = true, convexity = 10, twist = 0)
polygon(points=[
  [-W/2,-L/2],[W/2,-L/2],[W/2,L/2],
  [W/2,L/2+EL],
  [-W/2,L/2+EL],
  [-W/2,L/2]
  ]);
    
}

translate([0,0,H/2+T])
difference() {

minkowski() {
  footprint();
  cylinder(d=T,h=T/2,$fn=64);
}

minkowski() {
  footprint();
  cylinder(d=.001,h=5*T,$fn=16,center=true);
}

translate([0,30,-.01])
cube_center([8,50,3]);
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

translate([0,0,H/2+T])
rotate([-90,0,0])
cylinder(d=WW,h=50,$fn=64);
  

translate([-SW/2,-SL/2,-.01])
cylinder(d=6.7,h=2*T,$fn=6);
translate([-SW/2,SL/2,-.01])
cylinder(d=6.7,h=2*T,$fn=6);
translate([-SW/2,SL/2+EL,-.01])
cylinder(d=6.7,h=2*T,$fn=6);
translate([SW/2,-SL/2,-.01])
cylinder(d=6.7,h=2*T,$fn=6);
translate([SW/2,SL/2+EL,-.01])
cylinder(d=6.7,h=2*T,$fn=6);
translate([SW/2,SL/2,-.01])
cylinder(d=6.7,h=2*T,$fn=6);

}


translate([0,0,T])
difference() {
    
    union() {
translate([-SW/2,-SL/2,0])
cube_center([6.5,5.5,2]);
translate([-SW/2,SL/2+EL,0])
cube_center([6.5,5.5,2]);
translate([-SW/2,SL/2,0])
cube_center([6.5,5.5,2]);
translate([SW/2,-SL/2,0])
cube_center([6.5,5.5,2]);
translate([SW/2,SL/2+EL,0])
cube_center([6.5,5.5,2]);
translate([SW/2,SL/2,0])
cube_center([6.5,5.5,2]);
    }
translate([-SW/2,-SL/2,0])
cylinder(d=3.4,h=4*T,$fn=32);
translate([-SW/2,SL/2+EL,0])
cylinder(d=3.4,h=4*T,$fn=32);
translate([-SW/2,SL/2,0])
cylinder(d=3.4,h=4*T,$fn=32);
translate([SW/2,-SL/2,0])
cylinder(d=3.4,h=4*T,$fn=32);
translate([SW/2,SL/2+EL,0])
cylinder(d=3.4,h=4*T,$fn=32);
translate([SW/2,SL/2,0])
cylinder(d=3.4,h=4*T,$fn=32);
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

module cube_center(dims) {
    translate([-dims[0]/2, -dims[1]/2, 0])
    cube(dims);
}