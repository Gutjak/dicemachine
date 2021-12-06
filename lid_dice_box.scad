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

difference(){
    //outer frame. Translated to help compare to the dice holding box
    translate([-frame, 0, 0])
        cube([outer_box_width+frame*2, outer_box_height, outer_box_depth]);
    
    //remove inner box to make a frame
    translate([0, 0, frame])
        cube([outer_box_width, outer_box_height+opener, outer_box_depth+opener]);    

    //remove bottom to let dice out
    translate([-frame-opener, -opener, -opener])
        cube([outer_box_width+frame*2+opener*2, dice+frame+opener, frame+opener*2]);

    //remove side wall
    #translate([-frame-opener, -opener, frame])
        cube([outer_box_width+frame*2+opener*2, dice*2+opener, outer_box_depth]);

    translate([outer_box_width/2, outer_box_height-snap_top, outer_box_depth/2+frame/2])
        rotate([0, 90, 0])
        cylinder(h=outer_box_width+frame*2+opener*2, d=snap_diameter, center=true);

    translate([outer_box_width/2, outer_box_height-snap_bottom, outer_box_depth/2+frame/2])
        rotate([0, 90, 0])
        cylinder(h=outer_box_width+frame*2+opener*2, d=snap_diameter, center=true);
}