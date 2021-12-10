$fa = 1;
$fs = 0.4;

dice = 12.4; // dice are 12x12mm, added .2 for light tollerance
guide_rail = 0.5; //support the dice down a cullomb
frame = 2; // thickness of frame

guide_rail_step = dice + guide_rail; //12.9

number_dice = 6; // number af dice in a row

inner_box_width = dice * number_dice + guide_rail*number_dice; 

hole_start = frame + dice/2 + guide_rail; //8.7

for (hole=[hole_start : guide_rail_step : inner_box_width]) {
    translate([hole-dice/6, -1, 0])
        rotate([270,0,0])
        cylinder(h=1*dice + dice*((hole-hole_start)/guide_rail_step), d=dice/3);
}

pushing_box = inner_box_width; // x and y
thickness = 10;

bearing = 10.4;

difference(){
    translate([0, -pushing_box/2, -thickness/2])
    cube([pushing_box, pushing_box/2, thickness]);

    translate([35, -20, -thickness/2+2])
        cube([pushing_box+5, bearing, thickness]);

    translate([35, -14.8, -thickness/2+2])
        cylinder(h=thickness, d=bearing);
}
