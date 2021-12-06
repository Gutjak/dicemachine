use <MCAD/boxes.scad>
$fa = 1;
$fs = 0.4;

outer_box_width = 150;
outer_box_depth = 60;
outer_box_height = 50;

frame = 3;
tollerance = 1;

inner_box_width = outer_box_width - (2* frame);
inner_box_depth = outer_box_depth - (2* frame);
inner_box_height = outer_box_height + (2* frame);


//main box
difference(){
    //Main box
    cube([outer_box_width, outer_box_depth, outer_box_height], center=true);

    //cut out inner box to make frames. Rounded corners to make in pretty
    translate([0,0,frame*2])
        roundedBox(size=[inner_box_width, inner_box_depth, inner_box_height],radius=5,sidesonly=false);
    
    //Seperate lid from box
    translate([0,0,-outer_box_height/2+frame+tollerance])
        cube([outer_box_width+tollerance*2, outer_box_depth+tollerance*2, tollerance], center=true);
    
    //Make room for hinge
    translate([-outer_box_width/2-tollerance, -outer_box_depth/2, -outer_box_height/2+2])
        rotate([0,90,0])
        cylinder(h=outer_box_width+tollerance*2, d=8);
    /*
    //holes for screws x4
    #translate([-outer_box_width/4, -outer_box_depth/2+4, -outer_box_height/4])
        rotate([90,0,0])
        cylinder(h=frame*2, d=4);

    translate([outer_box_width/4, -outer_box_depth/2+4, -outer_box_height/4])
        rotate([90,0,0])
        cylinder(h=frame*2, d=4);

    translate([-outer_box_width/4, -outer_box_depth/2+4, outer_box_height/4])
        rotate([90,0,0])
        cylinder(h=frame*2, d=4);

    translate([outer_box_width/4, -outer_box_depth/2+4, outer_box_height/4])
        rotate([90,0,0])
        cylinder(h=frame*2, d=4);
        */
}

//Hinge
difference(){
    //Outer cylinder for hinge
    translate([-outer_box_width/2, -outer_box_depth/2, -outer_box_height/2+2])
        rotate([0,90,0])
        cylinder(h=outer_box_width, d=6);

    //Make room for rod
    translate([-outer_box_width/2-tollerance, -outer_box_depth/2, -outer_box_height/2+2])
        rotate([0,90,0])
        cylinder(h=outer_box_width+tollerance*2, d=4);

    //Cut the cylinder twice to make three pieces
    translate([-outer_box_width/4, -outer_box_depth/2, -outer_box_height/2+2])
        cube([2,10,10], center=true);

    translate([outer_box_width/4, -outer_box_depth/2, -outer_box_height/2+2])
        cube([2,10,10], center=true);
}

//Connect hinge to lid
translate([-outer_box_width/2.7, -outer_box_depth/2+4.5, -outer_box_height/2+1])
    cube([outer_box_width/4.5, 5, frame], center=true);

//Connect hinge to lid
translate([outer_box_width/2.7, -outer_box_depth/2+4.5, -outer_box_height/2+1])
    cube([outer_box_width/4.5, 5, frame], center=true);

//Connect hinge to box
translate([0, -outer_box_depth/2, -outer_box_height/2+6.5])
    cube([outer_box_width/2, frame, 5], center=true);

//Lip to catch opening mechanism
translate([0, outer_box_depth/2.5+3, -outer_box_height/2+1.5])
    cube([outer_box_width+20, 13, frame], center=true);   

//Hooks to attach 
module hook(x,y,z){
    translate([x,y,z])
        rotate([0,90,0])
        cylinder(h=8, d=5);

    translate([x+7,y,z])
        rotate([0,90,0])
        cylinder(h=2, d=8);
}

module hooks(){
    hook(outer_box_width/2-1, outer_box_depth/4, -outer_box_height/4);

    rotate([0,90,0])
        hook(outer_box_height/2-1, outer_box_depth/4, -outer_box_width/2+10);

    rotate([0,90,0])
        hook(outer_box_height/2-1, outer_box_depth/4, -outer_box_width/2+25);

    rotate([0,90,0])
        hook(outer_box_height/2-1, outer_box_depth/4, -outer_box_width/2+40);

    rotate([0,90,0])
        hook(outer_box_height/2-1, outer_box_depth/4, -outer_box_width/2+55);
        
    rotate([0,90,0])
        hook(outer_box_height/2-1, outer_box_depth/4, -outer_box_width/2+68);
}

hooks();

mirror([1,0,0])
    hooks();