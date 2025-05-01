$fn = $preview ? 64 : 256;

module reuleaux(d, n=3) {
    module go(a) {
        if (a>0) {
            intersection() {
                circle(r=d);
                rotate(180+360/n/2)
                translate([-d,0])
                go(a-1);
            }
        } else {
            circle(r=d);
        }
    }
    if (n%2 == 1)
        rotate(360/n/4)
        translate([-d/2,0,0])
        rotate(-360/n/4)
        go(n);
    else
        circle(d=d);
}

module rrect(w,h,r=1) {
    hull()
    for(dx = [r,w-r], dy = [r,h-r])
    translate([dx,dy])
    circle(r=r);
}

difference() {

    linear_extrude(2)
    translate([-31,-16])
    rrect(62, 32, 5);

    for (i = [-1,1])
    translate([i*15, 0, 0.5]) {
        linear_extrude(2)
        reuleaux(27.3, 7);

        linear_extrude(4.2, center=true)
        reuleaux(26, 7);
    }
}
