gapsize=10;
width=30;
height=20;
$fn= $preview ? 32 : 128;
min_thic = 5;
extra=0.1;
t=pow(sin($t*180),2);
// echo(t);

module comment() {
}

module debug() {
    if ($preview) {
        # children();
    }
}

module shower_thing() {
    cube([30,60,15]);
    cube([30,10,300]);
}

comment() {
# rotate([-26.5654*t,0,90]) translate([0,0,-10]) cube([30,10,300]);
}

debug() {
    rotate([0,-26.5654*t,0])
    translate([0,0,-t*20])
    translate([-gapsize,width,-15]) rotate([0,0,-90]) shower_thing();
}

module stopper_joint(d=2){
    linear_extrude(min_thic*2)
    hull(){
        translate([min_thic/2,3*d/2])
        circle(d=d);
        translate([min_thic/2,height-3*d/2])
        circle(d=d);
    }
}

module stopper() {
    linear_extrude(min_thic)
    polygon([[0,0],[-10,height],[-10,height+extra],[min_thic,20+extra],[min_thic,0]]);
    stopper_joint();
}

if ($preview)
    translate([0,10*t,0])
    color("#f0f9")
    translate([0,30+min_thic,0])
    rotate([90,0,0])
    render()
    stopper();
else
    translate([20,0,0])
    stopper();

module main_body() {
    //color("#0f0")
    difference(){
        translate([0,-min_thic,0])
        cube([min_thic, 30+min_thic, 20+extra]);
        
        translate([0,30+min_thic,0])
        rotate([90,0,0])
        stopper_joint();
    }
    
    kwok = sqrt(5)*10/2;
    
    color("#0ff")
    translate([-kwok,30,0])
    rotate([90,0,0])
    difference() {
        linear_extrude(min_thic+30)
        polygon([[0,0],[-10,0],[-10,-min_thic],[kwok-10    ,-min_thic],[kwok-10,-2*(kwok-10)]]);
        for(x = [0:10]) {
            rotate([90,0,0])
            translate([kwok-10,x*3+2.5,0]) cylinder(h=10,d=1);
        }
    }
    //color("#ff0")
    rotate([90,0,0])
    linear_extrude(min_thic)
    polygon([[0,0],[min_thic,0],[min_thic,height+extra],[0,height+extra],[-kwok-10,0],[-kwok-10,-min_thic],[-10,-min_thic]]);
}

if ($preview)
    color("#ccc9")
    render()
    main_body();
else
    translate([0,0,min_thic])
    rotate([90,0,0])
    main_body();