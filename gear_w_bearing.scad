$fa=1;
$fs=0.4;

/*
Gear is made out of two known factors. Number of teeth and measured center between what it need to grab.
It takes the number of teeth "n" and calculate the angles on a regular polugon wuth n-sides.
It uses half at the angle in a isoceles triangle and the Tooth Step to calculate the length from outer rim to center
The size of the dip should be a little bigger than half the size of it needs to grab plus some tolorance
*/
n = 6; // number of teeth
tooth_step = 21.35; // measured space between teeth
dip = 3.4; // radius of dip

thickness = 14; // how broad it is
bearing = 10.2; // outer diameter of ball bearing

iso = (1/n * (n-2) * 180)/2; // Calculater the angles of an polygon with n sides and takes half of that
out_r = tooth_step / (2*cos(iso)); // Use angle and distance between dips to calculate the sides of an isosceles triangle

in_r = out_r - dip; // Used for positioning the cutout. 

module cut() {
    // Cuts dips with a cylinder between each tooth
    translate([0,0,0])
        cylinder(h=thickness*2, r=out_r-in_r, center=true);
}

difference() {
    // Outer cylinder
    cylinder(h=thickness, r=out_r, center=true);
    // Calling cut module n number of times
    step = 360/n;
    for (i=[0:step:359]) {
        angle = i;
        dx = out_r*cos(angle);
        dy = out_r*sin(angle);
        translate([dx,dy,0])
            cut();
    }
    // cutout for conection rod, axle or motor pin
    translate([0,0,-2])
    cylinder(h=thickness*2, d=bearing  , center=true);
}