$fn = $preview ? 32 : 256;


module base(w=50, l=100, r=6) {
    r_b = w/2;
    difference() {
        union() {
            translate([r_b,l-r_b,0])
            circle(r=r_b);
            square([w,l-r_b]);
        }
        translate([r_b,l-r_b,0])
        circle(r=r);
    }
}


th = 6;
jr = 15;
hr = 10;

linear_extrude(th)
base(l=150,r=hr);

translate([0, th, 0])
rotate([90,0,0])
linear_extrude(th)
base(l=75, r=hr);

difference() {
    cube([50, th+jr, th+jr]);
    translate([-0.5, th+jr, th+jr])
        rotate([0, 90, 0])
        cylinder(51, jr, jr);
}