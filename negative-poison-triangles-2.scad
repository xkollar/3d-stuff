$fn = $preview ? 32 : 256;
$loop = ((-cos($t*360)+1)/2)^2;
$tol = 0.03;

$peg = 2.5;

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
                translate([a-$peg,0,0]-centre)
                circle($peg);
            }
        }
        triangle(a*2/3);
        for (i = [0:2]) {
            rotate([0,0,-90+120*i])
            translate(-centre)
            rotate([0,0,-240])
            translate([-$peg,0,0])
            circle($peg+$tol);
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
            translate([a-$peg,0,0]-centre)
            difference() {
                circle($peg+$tol);
                circle($peg/2);
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
                translate([a-$peg,0,0]-centre)
                circle($peg/2+$tol);
            }
        }
        for (i = [0:2]) {
            translate([0,0,th/2-$tol/2])
            rotate([0,0,-90+120*i])
            translate([a-$peg,0,0]-centre)
            linear_extrude(th/2+$tol)
            difference() {
                circle($peg+$tol);
                circle($peg/2);
            }
        }
    }
}


$a = 20;
$th = 2;

translate([10+$a/sqrt(3),0,0])
color("#966") render(4) thing_peg($a, $th);

translate([10,0,$th]) rotate([180,0,60])
color("#669") render(4) thing_hole($a, $th);