$fn= $preview ? 64 : 256;

module comment() {
}

module one() {
    scale([1,1.2,1])
    circle(20);
}

module shape() {
    translate([0,5,0]) one();
    translate([0,-5,0]) one();
    translate([5,0,0]) one();
    translate([-5,0,0]) one();
}

module tsuba() {
    intersection() {
        render(4)
        linear_extrude(10)
        difference() {
            offset(-5) shape();
            offset(-0.5)
            translate([-6.5,-11.1,0])
            import("profile-orig.svg");
        }
        render(4)
        union() {
            scale([1.03,0.95,0.6])
            translate([0,0,-0.3])
            rotate([-3,0,0])
            render(20)
            import("ascii-cnt-2.stl");
            linear_extrude(4)
            shape();
        }
    }
}

render(4)
linear_extrude(5)
difference() {
    shape();
    offset(-5) shape();
}

tsuba();