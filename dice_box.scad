$fa = 1;
$fs = 0.4;

 
dice = 12.4; // dice are 12x12mm, added .2 for light tollerance
guide_rail = 0.5; //support the dice down a cullomb

number_dice = 6; // number af dice in a row

inner_box_width = dice * number_dice + guide_rail*number_dice; // x 
inner_box_height = 100; // y
inner_box_depth = dice;  // z

frame = 2; // thickness of frame
opener = 2; // just to break through walls

outer_box_width = inner_box_width + frame*2; // x
outer_box_height = inner_box_height + frame; // y
outer_box_depth = inner_box_depth + frame; // z

snap_height = 4;
snap_diameter = 5;

// its starts from the top and is subtracted. Thats why the low number is top and high is bottom 
snap_top = 10; 
snap_bottom = 70;

// inner box makes room for dice. 
difference(){
    cube([outer_box_width, outer_box_height, outer_box_depth]);

    translate([frame, frame, frame])
        cube([inner_box_width, inner_box_height+opener, inner_box_depth+opener]);    

    hole_start = frame + dice/2 + guide_rail;
    for (hole=[hole_start : guide_rail_step : inner_box_width]) {
        translate([hole, dice/2, 0])
            cylinder(h=frame*4, d=dice/2, center=true);
    }
    
}

//For loop with guiderails
guide_rail_start_pos = frame + dice + guide_rail/2;
guide_rail_step = dice + guide_rail;

for (rail=[guide_rail_start_pos : guide_rail_step : inner_box_width]) {
    translate([rail, frame, frame])
        cube([guide_rail, inner_box_height, inner_box_depth/2]);
}

//snap pins
module snap_pin(x,y,z){
    difference(){
        translate([x,y,z])
        rotate([0,90,0])
            cylinder(h=snap_height, d=snap_diameter);
        
        translate([x,y-snap_diameter/2,z+snap_diameter/2])
            rotate([0,45,0])
            cube([10,10,10]);

    }
}
//Right side lid snaps
snap_pin(outer_box_width,outer_box_height-snap_top, outer_box_depth/2);
snap_pin(outer_box_width,outer_box_height-snap_bottom, outer_box_depth/2);

//Left side lid snaps
mirror([1,0,0])
    snap_pin(0,outer_box_height-snap_top,outer_box_depth/2);
mirror([1,0,0])
    snap_pin(0,outer_box_height-snap_bottom,outer_box_depth/2);

//Right side comb helper snaps
mirror([0,0,1])
    snap_pin(outer_box_width, dice/2, -outer_box_depth/2);
mirror([0,0,1])
    snap_pin(outer_box_width, dice*1.5, -outer_box_depth/2);

//Left side comp helper snaps
mirror([1,0,0])
    mirror([0,0,1])
    snap_pin(0, dice/2, -outer_box_depth/2);
mirror([1,0,0])
    mirror([0,0,1])
    snap_pin(0, dice*1.5, -outer_box_depth/2);