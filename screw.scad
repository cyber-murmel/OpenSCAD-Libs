//$fn=60;

module thread(radius=5, pitch=1.5, length=15, depth){
	linear_extrude(length, twist=-360*length/pitch)
			translate([depth/2, 0])circle(r=radius-depth/2);
}

module metric_screw(diameter=10, pitch=1.5, length=15, tolerance=0.5){
	radius=(diameter-tolerance)/2;
	depth=cos(30)*pitch;

	difference(){
		thread(radius, pitch, length, depth);
		difference(){
			cylinder(r=radius+1, h=length);
			cylinder(r=radius-depth/8, h=length);
		}
	}
}

module metric_nut(diameter=10, pitch=1.5, height=4.5, tolerance=0.5){
	radius=(diameter+tolerance)/2;
	depth=cos(30)*pitch;
	difference(){
		difference(){
			cylinder(r=radius, h=height);
			thread(radius, pitch, height, depth);
		}
		cylinder(r=radius-depth*3/4, h=height);
	}
}

module metric_hex_screw(diameter=10, pitch=1.5, length=15, key=17, height=4.5, tolerance=1){
    translate([0, 0, height])
        metric_screw(diameter, pitch, length, tolerance);
    translate([0, 0, 0.5])minkowski(){
        cylinder(d=key/cos(30), h=height-1, $fn=6);
        sphere(0.5, center=true);
    }
}

module metric_hex_nut(diameter=10, pitch=1.5, key=17, height=4.5, tolerance=1){
	metric_nut(diameter, pitch, height, tolerance);
	difference(){
		translate([0, 0, 0.5])minkowski(){
			cylinder(d=key/cos(30), h=height-1, $fn=6);
			sphere(0.5, center=true);
		}
		cylinder(d=diameter, h=height);
	}
}

//metric_nut();
