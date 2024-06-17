$fn= $preview ? 64 : 256;

module comment() {
}

module tsuba() {
intersection() {
    
    linear_extrude(10)
    shape();
    scale([1,1,0.6])
    translate([0,0,-0.3])
    rotate([-3,0,0])
    render(20)
    import("ascii-cnt-2.stl");
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

//comment()
minkowski(){
linear_extrude(5)
difference() {
    shape();
    offset(-5) shape();
}
//sphere(0.5);
}
//comment()
linear_extrude(3)
shape();

comment()
difference() {
    $fn=6;
    cylinder(50,40,0);
    translate([0,0,-0.01]) cylinder(50,40,0);
}
linear_extrude(4)
circle(12);
}

difference() {
tsuba();

linear_extrude(40,center=true)
translate([-6.5,-11,0])
import("profile-orig.svg");
}
