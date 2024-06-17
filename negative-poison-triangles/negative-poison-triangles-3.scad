$fn = $preview ? 64 : 512;
$loop = ((-cos($t*360)+1)/2);
$tol = 0.1;

// width of bendy thing
$wi = 1.5;

module comment() {}

module rotate_around(pt,ang) {
    translate(pt) rotate(ang) translate(-pt) children();
}

module element(a) {
    r = a/sqrt(3);
    lel = a/2/sqrt(3);
    radius = a * sqrt(3)/2;
    module x(delta=0) {
        translate([radius-lel,0,0]) circle(r=radius-delta-$tol);
    }
    module y() {
        intersection() {
            circle(r=r, $fn=3);
            x();
            rotate([0,0,120]) x($wi+2*$tol);
        }
    }
    union() {
        difference() {
            y();
            x($wi);
        }
        intersection() {
            difference() {
                y();
                rotate([0,0,120]) x(3*$wi);
            }
            rotate([0,0,240]) x(2*$wi);
        }
    }
}

module stuff(a) {
    r = a/sqrt(3);
    centre = [a/2, a/2/sqrt(3)];
    
    translate([a/2/sqrt(3),0,0]) for (i = [0:2]) {
        rotate([0,0,120*i]) element(a);
    }

    // color("red") linear_extrude(0.1) circle(r=r, $fn=3);
}

module hexbase(a) {
    for (i=[0:2]) rotate([0,0,120*i]) translate([0,$a/2,0]) {
        stuff($a);
        rotate([0,180,0]) stuff($a);
    }
}

$a = 20;
$th = 1.5;

linear_extrude($th) {
    hexbase($a);
    for (i=[0:5]) {
        rotate([0,0,60*i])
        translate([$a*sqrt(3),0,0])
        rotate([0,0,180*i]) hexbase($a);
    }
}