//bracket for holder 90 degree motor
$fa = 1;
$fs = 0.4;

motor_width = 32; //x
motor_length = 46; //y
motor_height = 60; //z

frame = 3;
tollerance = 1;

outer_bracket_width = motor_width + frame*2; //x
outer_bracket_length = motor_length + frame; //y
outer_bracket_height = motor_height + frame; //z

lip = 10;

module screw_hole(x,y,z){
    translate([x,y,z-1])
        cylinder(h=5, d=4);
}

difference(){
    union(){
        cube([outer_bracket_width, outer_bracket_length, outer_bracket_height]);

        translate([-lip, 0, outer_bracket_height-frame])
            cube([outer_bracket_width+lip*2, outer_bracket_length, frame]);
    }
    translate([frame, frame, frame])
        cube([motor_width, motor_length+tollerance, motor_height+tollerance]);

    //Holes for attacing motor
    screw_hole(7+frame, 6+frame, 0);
    screw_hole(25+frame, 6+frame, 0);
    screw_hole(7+frame, 39+frame, 0);
    screw_hole(25+frame, 39+frame, 0);
    
    //Holes for attacing bracket to project
    screw_hole(-5, 6, outer_bracket_height-frame);
    screw_hole(outer_bracket_width+5, 6, outer_bracket_height-frame);
    screw_hole(-5, 39+frame, outer_bracket_height-frame);
    screw_hole(outer_bracket_width+5, 39+frame, outer_bracket_height-frame);

    //Hole for motorpin
    translate([frame+motor_width/2, frame+15, -1])
        cylinder(h=5, d=7);

}