$fn = $preview ? 6 : 6;

module comment() {
}

module lala(i,r,ang) {
    rotate([0,0,i*120+ang])
        translate([r,0,0])
        scale([0.9,1.2,0])
        circle(r);
}

module lel(i,r,ang) {
    rotate([90,0,ang])
    translate([r,0,0])
    linear_extrude(0.01) lala(i,3,6*ang);
}

bla = $fn*6;

//comment()
color("#894")
//translate([-cos($t*360)*10,sin($t*360)*10,0])
rotate([0,sin(1*$t*360)*2,$t*360])
render(2)
intersection() {
    union() {
        rotate([-5,0,0])
        scale([0.95,0.95,1])
        translate([-181,-121,12])
        import("rabbitor_Z55.stl");
        translate([0,0,2])
        for (i=[0:2], n = [0:bla-1]) {
            bz0 = 360*n/bla;
            bz1 = 360*(n+1)/bla;
            hull() {
                lel(i, 22, bz0);
                lel(i, 22, bz1);
            }
        }
        linear_extrude(1)
        circle(24);
    }
    linear_extrude(200)
        circle(50);
}