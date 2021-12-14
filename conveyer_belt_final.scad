$fa = 1;
$fs = 0.4;
//Oriontation using a clock: X is 4, Y is 2 and Z is 12
//Linked Conveyer Belt
belt_width = 100; //Generaly how wide each link will be.
belt_length = 20; //Do not adjust this to set gap between links
belt_height = 3; //Thickness

//Main board
translate([-belt_length/2,-belt_width/2,-belt_height/2])
    cube([belt_length, belt_width, belt_height]);

//Link mechanism
link_width = 5;
link_length = 10;
link_height = 10;
connect_length = 37;
connect_diameter = 5;
gap_overset = 0; //Changes this to add gap between belt pieces
gap_offset = 6+gap_overset; //Dont change this

module link() {
    
    //Connection rod
    difference(){
        translate([0, 0, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=connect_length, d=connect_diameter, center=true);
        translate([0, connect_length/2, belt_height+(link_height/2)+0.01])
            rotate([0,0,60]) //set angle for right slope
            cube([connect_diameter, connect_diameter*2, connect_diameter], center=true); 
        translate([0, -connect_length/2, belt_height+(link_height/2)+0.01])
            rotate([0,0,120]) //set angle for left slope
            cube([connect_diameter, connect_diameter*2, connect_diameter], center=true);
    }

    difference(){
        union(){
        //Connection to board right
        translate([-belt_length*0.125, belt_length/2, belt_height+0.01])
            cube([belt_length*0.75,link_width,link_height], center=true);
        //right round connector
        translate([0, belt_length/2, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width, d=link_length, center=true);
        //right inner extender
        translate([-connect_diameter, belt_length/2, belt_height+(link_height/2)+0.01])
            cube([link_length+1,link_width,link_height], center=true);
        //right connection between inner and outer extender
        translate([-link_length+1.75, (belt_length/2)+(link_width/2)+0.5, belt_height+(link_height/2)+0.01])
            cube([(link_length/2)-0.5,link_width*2,link_height], center=true);
        translate([-link_length+2, (belt_length/2)+(link_width/2)+0.5, belt_height])
            cube([(link_length/2)-1,link_width*2,link_height], center=true);
        
            }
        //slight angle to steer gear teeth
        translate([0,belt_length/2.8,belt_height+link_height-1])
            rotate([170,0,0])
            cube([50,link_width/2,link_height*1.5], center=true);
     } 

    difference(){
        union(){
        //Connection to board left
        translate([-belt_length*0.125, -belt_length/2, belt_height+0.01])
            cube([belt_length*0.75,link_width,link_height], center=true);
        //left round connector
        translate([0, -belt_length/2, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width, d=link_length, center=true);
        //left inner extender
        translate([-connect_diameter, -belt_length/2, belt_height+(link_height/2)+0.01])
            cube([link_length+1,link_width,link_height], center=true);
        //left connection between inner and outer extender    
        translate([-link_length+1.75, -(belt_length/2)-(link_width/2)-0.5, belt_height+(link_height/2)+0.01])
            cube([(link_length/2)-0.5,link_width*2,link_height], center=true);
        translate([-link_length+2, -(belt_length/2)-(link_width/2)-0.5, belt_height])
            cube([(link_length/2)-1,link_width*2,link_height], center=true);
        }
        //slight angle to steer gear teeth
        translate([0,-belt_length/2.8, belt_height+link_height-1])
            rotate([10,0,0])
            cube([50,link_width/2,link_height*1.5], center=true);
    }

    //Right outer extender
    difference(){
            union(){
        translate([-link_length-gap_offset, (belt_length/2)+link_width+0.5, belt_height+(link_height/2)+0.01])
            cube([link_length,link_width,link_height], center=true);
        translate([-link_length-1, (belt_length/2)+link_width+0.5, belt_height+(link_height/2)+0.01])
            cube([link_length,link_width,link_height], center=true);
        translate([(-link_length*1.5)-gap_offset, (belt_length/2)+link_width+0.5, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width, d=link_length, center=true);
            }
        //Hole in outer right extender 
       translate([(-link_length*1.5)-gap_offset, (belt_length/2)+link_width+0.5, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width+2, d=connect_diameter+1, center=true);
    }

    //Left outer extender
    difference(){
            union(){
        translate([-link_length-gap_offset, -(belt_length/2)-link_width-0.5, belt_height+(link_height/2)+0.01])
            cube([link_length,link_width,link_height], center=true);
        translate([-link_length-1, -(belt_length/2)-link_width-0.5, belt_height+(link_height/2)+0.01])
            cube([link_length,link_width,link_height], center=true);
        translate([(-link_length*1.5)-gap_offset, -(belt_length/2)-link_width-0.5, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width, d=link_length, center=true);
            }
        //Hole in outer left extender
       translate([(-link_length*1.5)-gap_offset, -(belt_length/2)-link_width-1, belt_height+(link_height/2)+0.01])
            rotate([90,0,0])
            cylinder(h=link_width+2, d=connect_diameter+1, center=true);
    }     
}
translate([0,0,belt_height/2])
link();