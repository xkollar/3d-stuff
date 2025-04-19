
module profile() {
    scale([0.0755,0.0755])
    import("profile_test_3.svg");
}

// square([24, 37],center=true);

translate([-24/2,-37/2])
linear_extrude(3)
difference() {
    offset(5)
    profile();
    profile();
}
