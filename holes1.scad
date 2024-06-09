function get(x,y,n,vec) = vec[(x-1)*n+y-1];

$fn = 40;

intersection() {
translate([2.5,2.5,-25]) linear_extrude(20) square(55);

rx = rands(-0.1,0.1,25);
ry = rands(-0.1,0.1,25);
rz = rands(-0.1,0.1,25);
rr = rands(-0.1,0.1,25);

    
union() {
difference() {
    union() {
        for (dx = [0:6], dy = [0:6]) {
            sh = dx%2 == 0 ? -2.5 : +2.5;
            translate([
                dx*10+get(dx,dy,5,rx),
                dy*10+sh+get(dx,dy,5,ry),
                -6+get(dx,dy,5,rz)])
                scale([1,1,0.95]) sphere(10+get(dx,dy,5,rr));
        }
    };
    union() {
        for (dx = [1:5], dy = [1:5]) {
            sh = dx%2 == 0 ? -2.5 : +2.5;
            translate([
                dx*10+get(dy,dx,5,rx),
                dy*10+sh+get(dy,dx,5,ry),
                -12.5+get(dy,dx,5,rz)])
            sphere(4.6+get(dy,dx,5,rr));
        }
    }
}
union() {
    for (dx = [1:5], dy = [1:5]) {
        sh = dx%2 == 0 ? -2.5 : +2.5;

        translate([
            dx*10+get(dx,dy,5,ry),
            dy*10+sh+get(dx,dy,5,rx),
            -12+get(dx,dy,5,rr)])
        scale([1,1,1.3]) sphere(3.5+get(dx,dy,5,rz));
    }
}
}}