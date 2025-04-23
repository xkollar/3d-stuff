$fn = $preview ? 32 : 128;

module rrect(x,y,r) {
    translate([r,r])
    hull()
    for (dx=[0,x-2*r], dy=[0,y-2*r])
        translate([dx,dy])
        circle(r);
}

module paddle(w=68, h=33, hw=50, hh=20, r=5) {
    union() {
        translate([0,-h/2,0])
        rrect(w, h, 5);

        translate([-hw+r,-hh/2,0])
        rrect(hw,hh,r);
    }
}

module xoff(o) {
    for (i=[0:$children-1]) {
        offset(o) offset(-2*o) children(i);
    }
}


translate([0,50,0])
let (w=68, h=33, hw=50, hh=20, r=5, o=1.5) {
    linear_extrude(3)
    difference() {
        paddle(w,h,hw,hh,r);
        translate([w/2+2, 0, 0])
        offset(-1) offset(2)
        text("MX", size=25, halign="center", valign="center", spacing=1.1);
    }
}

let (w=68, h=33, hw=50, hh=20, r=5, o=1.5) {
    translate([0,0,1.5])
    linear_extrude(1.5)
    paddle(w,h,hw,hh,r);
    linear_extrude(3)
    difference() {
        paddle(w,h,hw,hh,r);
        translate([w/2+2, 0, 0])
        offset(-1) offset(2)
        text("MX", size=25, halign="center", valign="center", spacing=1.1);
    }
}

translate([0,100,0])
linear_extrude(3)
let (w=68, h=33, hw=50, hh=20, r=5, o=1.5) {
    difference() {
        paddle(w,h,hw,hh,r);
        xoff(o) {
            polygon([
                [w-r*3,0],
                [w-r+o, h/2-r+o],
                [w-r+o, -h/2+r-o],
            ]);
            polygon([
                [w-r*3,0],
                [w-r, h/2-r+o],
                [w-r*5-o, h/2-r+o],
            ]);
            polygon([
                [w-r*3,0],
                [w-r, -h/2+r-o],
                [w-r*5-o, -h/2+r-o],
            ]);
            polygon([
                [w-r*3,0],
                [w-r*5-o, h/2-r+o],
                [w-r*6, h/2-r+o],
                [w-r*6, -h/2+r-o],
                [w-r*5-o, -h/2+r-o],
            ]);
            polygon([
                [w-r*6, h/2-r+o+o+o],
                [w-r*6, -h/2+r-o],
                [w-r*9-o, -h/2+r-o],
            ]);
            polygon([
                [w-r*6-o-o, h/2-r+o],
                [w-r*12+o-o, h/2-r+o],
                [w-r*9-o, -h/2+r-o+o],
            ]);
            polygon([
                [w-r*12-o, h/2-r+o+o+o],
                [w-r*12-o, -h/2+r-o],
                [w-r*9-o, -h/2+r-o],
            ]);
        }
    }
}