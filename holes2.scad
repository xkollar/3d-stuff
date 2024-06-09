$fn = $preview ? 30 : 300;

module hexgrid(d,n) {
    for(x=[1:n], y=[(x%2==0?0:1):n])
        translate([x*sqrt(3)*d/2,y*d+(x%2==0?d/4:-d/4),0]) children();
}

linear_extrude(20, twist=30, slices=20/0.15, scale = 1)
translate([-25,-25,0])
difference() {
    offset(-1) offset(2) hexgrid(10,5) {
        circle(r=5, $fn=6);
    }
    offset(3) hexgrid(10,5) {
        circle(r=2, $fn=6);
    }
}