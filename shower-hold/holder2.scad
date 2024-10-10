
$fn = $preview ? 32 : 128;
steps = $preview ? 32 : 128;

render()
difference() {
    translate([-25,0,-25])
    cube([50,50,50]);

    shift = 25;

    for(i = [0:steps-1]) {
        hull() {
            translate([0,shift*(i/steps),0])
            rotate([0,90-90*(i/steps)^2,0])
            translate([0,0,-50])
            cylinder(100,d=22);
    
            translate([0,shift*((i+1)/steps),0])
            rotate([0,90-90*((i+1)/steps)^2,0])
            translate([0,0,-50])
            cylinder(100,d=22);
        }
    }
    translate([20,75,-20])
    rotate([90,0,0])
    {
        cylinder(100,d=5);
        translate([0,-1,0])
        cube([20,2,100],center=false);

        translate([10,0,50])
        rotate([0,90,0])
        cylinder(h=20,d=2.5,center=true);
        // rotate([45,0,0])
        // cube([20,2.5,2.5],center=true);
    }
}