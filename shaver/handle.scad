$fn = $preview ? 16 : 300;

module base() {
    offset(-1) offset(2) union() {
        for (i = [0:2])
            rotate([0,0,120*i])
            translate([2,0,0])
            circle(1, $fn=6);
    }
}

union() {

    linear_extrude(50,twist=360)
        difference() {
            base();
            offset(0.3) offset(-1.3) base();
        }
}