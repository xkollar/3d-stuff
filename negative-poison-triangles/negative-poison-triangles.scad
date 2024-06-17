$fn = $preview ? 32 : 256;
$loop = ((-cos($t*360)+1)/2)^2;
$tol = 0.02;


module comment() {}

function t(x) = x*sqrt(3)/2;

module rotate_around(pt,ang) {
    translate(pt) rotate(ang) translate(-pt) children();
}

module triangle(a) {
    polygon([[0,0],[a,0],[a/2,t(a)]]);
}

module thing(th,a) {
    difference() {
        linear_extrude(th) difference() {
            union() {
                translate([-1,0]) offset(-$tol/2) triangle(a);
                circle(1);
                translate([(a-3)/2,t(a-1)]) circle(1-$tol);
            }
            translate([(a-1)/2-1,t(a-1)]) circle(0.5+$tol);
            rotate_around([-1,0,0],[0,0,120]) circle(1+$tol);
            //translate([a-1,1,0]) circle(1+$tol);
        }
        translate([0,0,th/2])
            linear_extrude(th/2+$tol)
            difference() {
                circle(1+$tol);
                circle(0.5);
        }
        translate([(a-1)/2-1,t(a-1),-$tol])
            linear_extrude(th/2+$tol)
            difference() {
                circle(1+$tol);
                circle(0.5);
        }
        translate([a/2-1,a/2/sqrt(3),th/2])
            linear_extrude(th)
            circle(1, $fn=6);
    }
}

comment() {
for (i = [0:2]) {
    rotate([0,0,i*120])
        translate([1,0,0])
        render(convexity=4)
        thing(0.5,20);
}

color("red") translate ([(20-1)/2,t(20-1),0]) render(4) rotate([180,0,240]) scale([1,1,-1]) thing(0.5, 20);
}

function lel(a, ang) = a/sin(60)*sin(ang);

module what(a=10, x=1) {
    inner = sqrt((a-x)^2+x^2-2*(a-x)*x*cos(60));
    ang = asin(x*sin(60)/inner);
    triangle(a);
    translate([1,0,0]) circle(1);
    color("red")
        rotate([0,0,ang])
        translate([x,0,0])
        triangle(inner);
}

echo("-----------START------------");
{
for (i=[0:2]) rotate([0,0,120*i]) {
    a = 10;
    x = 1;
    inner = sqrt((a-x)^2+x^2-2*(a-x)*x*cos(60));
    ang = asin(x*sin(60)/inner);

    {
    translate([lel(inner, 60*$loop),0,0])
        rotate_around([1,0,0], [0,0,60*$loop])
        what(a,x);
    translate([lel(inner, 60*$loop),0,0])
        rotate_around([1,0,0],[180,0,-60*$loop])
        what(a, x);
    }
}
}