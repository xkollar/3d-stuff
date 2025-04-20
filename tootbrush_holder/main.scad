$fn = $preview ? 32 : 256;


module stand() {
    union() {
        translate([0,0,1.5/2])
        cylinder(h=1.5, d=8, center=true);

        let (h = (2/(7.75-5.5))*7.75) {
            translate([0,0,h/2+1.5])
            cylinder(h=h, d1=7.75, d2=0, center=true);
        }
    }




    let (
        d1 = 7.6,
        d2 = 7.5,
        w1 = 5.4,
        w2 = 5.1,
        scale = d2/d1,
        h1 = sqrt((d1/2)^2 - (w2/2)^2),
        h2 = w1/2 * 2*h1/(w1-w2)
    ) linear_extrude(15, center=false, scale=scale)
        difference() {
            intersection() {
            circle(d=7.5);
            polygon([
                [w1/2,0],
                [0,h2],
                [-w1/2,0],
                [0,-h2]
            ]);
        }
        // circle(d = 4);
        translate([w1/2,0])
        rotate([0,0,30])
        square([1.2,2.2]);
    }
}

n=5;
space_w = 25;
space_h = 35;

module rrect(x,y,r) {
    translate([r,r])
    hull() {
        for (dx = [0,x-2*r], dy = [0,y-2*r]) {
            translate([dx,dy])
            circle(r=r);
        }
    }
}

linear_extrude(2)
rrect(space_w*n, space_h, 2);

translate([space_w/2,space_h/2,2])
for ( i = [0:n-1] ) {
    translate([i*space_w,0,0]) {
        translate([0,0,1])
        rotate([0,0,20])
        stand();
        difference() {
            cylinder(h=1, d1=14, d2=12);
            translate([-0.5,0,0])
            cube([1,7,2]);
        }
        cylinder(h=1, d1=14, d2=8);
    }
}

//function t(n=1) = 0.5+sin(n*360*$t)/2;
//
//$vpr = [45+30*t(),10*t()^2,45+90*t()];
//$vpt = [space*n/2,space/2,0];
//$vpd = 250+t(2)^2*50;