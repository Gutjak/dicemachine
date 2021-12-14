$fa = 1;
$fs = 0.4;

frame = 3;
dice = 12.4;
disc_diameter = 79;

sled_width = 83 + frame*2; //x
sled_length = disc_diameter + dice + 2 + 20; //y
sled_height = frame+1 + 10 + 3.5; //z

disc_y = sled_length/2+6.4;
bridge_y = 48;

difference(){
    union(){
        cube([sled_width, sled_length, sled_height]); //Main box

        cube([sled_width, 20, 25]);

        translate([0, disc_y-bridge_y, sled_height])
            cube([sled_width, bridge_y, 6.5]); //Bridge for motor

        translate([-30, 32, 0])
            cube([sled_width+60, 30, sled_height]); //Bracket for attaching to project
    }
    translate([frame, -1, -1])
        cube([83, dice + 4, sled_height*2]); //Cutout for dice box

    translate([frame+2.25, 0, frame])
        cube([78.5, sled_length+1, 10.5]); //Cutout for comb

    translate([sled_width/2, disc_y, frame+10])
        cylinder(h=9, d=disc_diameter); //Cutout for disc

    translate([sled_width/2, disc_y, frame+10])
        cylinder(h=15, d= 10); //Cutout for motor pin

    translate([sled_width/2-17.5, disc_y-8, frame+10])
        cylinder(h=15, d=4.2); //Screwhole motor

    translate([sled_width/2+17.5, disc_y-8, frame+10])
        cylinder(h=15, d=4.2); //Screwhole motor

    translate([-15, 47, -1])
        cylinder(h=frame+2, d=6); //Screwhole project

    translate([-15, 47, frame])
        cylinder(h=sled_height, d=20); //Room for washer

    translate([-31, 31, frame])
        rotate([0, -30, 0])
        cube([35, 32, sled_height]);

    translate([sled_width+15, 47, -1])
        cylinder(h=frame+2, d=6); //Screwhole project
    
    translate([sled_width+15, 47, frame])
        cylinder(h=sled_height, d=20); //Room for washer

    translate([sled_width+1, 31, frame+sled_height])
        rotate([0, 30, 0])
        cube([35, 32, sled_height]);  

    translate([-1, 7.5, frame+5])
        rotate([0,90,0])
        cylinder(h=sled_width+2, d=6);
    
    translate([-1, 7.5, frame+5+dice])
        rotate([0,90,0])
        cylinder(h=sled_width+2, d=6);

}
