
module profile() {
    scale([0.0754,0.0754])
    import("profile_test_3.svg");
}

// square([24, 37]);

translate([-24/2,-37/2])
linear_extrude(3)
difference() {
    offset(5)
    profile();
    profile();
}