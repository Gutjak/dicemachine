module screw_hole(pos_x, pos_y){
    translate([pos_x, pos_y, -1])
        cylinder(h=13, d=3, $fn=64);
    translate([pos_x,pos_y, 5])
        cylinder(h=6, d=5.8, $fn=6);
}

difference(){
//body
cube([30,50,10]);

screw_hole(5,5);
screw_hole(15,5);
screw_hole(25,5);
screw_hole(5,45);
screw_hole(15,45);
screw_hole(25,45);

    
//Motor mount
//Center with indent
translate([15,25,-1])
    cylinder(h=13, d=7, $fn=64);
translate([15,25,-1])
    cylinder(h=5, d=26, $fn=64);
//Holes for screws    
translate([15,16.5,-1])
    cylinder(h=13, d=3, $fn=64);
translate([15,16.5,7])
    cylinder(h=13, d=6, $fn=64);

translate([15, 33.5,-1])
    cylinder(h=13, d=3, $fn=64);
translate([15,33.5,7])
    cylinder(h=13, d=6, $fn=64);

 
}    