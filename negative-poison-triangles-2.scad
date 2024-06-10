$fn = $preview ? 32 : 256;
$loop = ((-cos($t*360)+1)/2)^2;
$tol = 0.03;

module comment() {}

module rotate_around(pt,ang) {
    translate(pt) rotate(ang) translate(-pt) children();
}

module triangle(a) {
    r = a/sqrt(3);

    circle(r=r, $fn=3);
}

module base(a) {
    centre = [a/2, a/2/sqrt(3)];

    offset(-$tol/2)
    difference() {
        union() {
            triangle(a);
            for (i = [0:2]) {
                rotate([0,0,-90+120*i])
                translate([a-1,0,0]-centre)
                circle(1);
            }
        }
        triangle(a*2/3);
        for (i = [0:2]) {
            rotate([0,0,-90+120*i])
            translate(-centre)
            rotate([0,0,-240])
            translate([-1,0,0])
            circle(1+$tol);
        }
    }
}

module thing_peg(a,th=1) {
    centre = [a/2, a/2/sqrt(3)];

    difference() {
        linear_extrude(th) base(a);

        for (i = [0:2]) {
            translate([0,0,th/2-$tol/2])
            linear_extrude(th/2+$tol)
            rotate([0,0,-90+120*i])
            translate([a-1,0,0]-centre)
            difference() {
                circle(1+$tol);
                circle(0.5);
            }
        }
    }
}

module thing_hole(a,th=1) {
    centre = [a/2, a/2/sqrt(3)];

    difference() {
        linear_extrude(th) difference() {
            base(a);
            for (i = [0:2]) {
                rotate([0,0,-90+120*i])
                translate([a-1,0,0]-centre)
                circle(0.5+$tol);
            }
        }
        for (i = [0:2]) {
            translate([0,0,th/2-$tol/2])
            rotate([0,0,-90+120*i])
            translate([a-1,0,0]-centre)
            linear_extrude(th/2+$tol)
            difference() {
                circle(1+$tol);
                circle(0.5);
            }
        }
    }
}


$a = 20;

translate([10+20/sqrt(3),0,0])
color("#966") render(4) thing_peg($a);

// translate([10,0,1]) rotate([180,0,60])
color("#669") render(4) thing_hole($a);