$fa = 1;
$fs = 0.4;

difference(){
    union(){
        cylinder(h=4, d=78);
        cylinder(h=6, d=12);
}
    translate([0, 0, -1])
        cylinder(h=8, d=5.2);

    translate([32, 0, -1])
        cylinder(h=8, d=3);
    translate([32, 0, -1])
        cylinder(h=2, d=11);
}

translate([1.5, -3, 0])
    cube([3, 6, 6]);

translate([-4.5, -3, 0])
    cube([3, 6, 6]);