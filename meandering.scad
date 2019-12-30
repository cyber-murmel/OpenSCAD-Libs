include <arc_sector.scad>

module meander(ri=5, w=5, pp=60) {
  translate([ri+w/2, 0])
    rotate(90)
      arc_sector(ri=ri, ro=ri+w, a=90);
  translate([ri+w/2, ri])
    square([pp-2*ri-2*w, w]);
  translate([pp-ri-3*w/2, 2*ri+w])
    rotate(270)
      arc_sector(ri=ri, ro=ri+w, a=90);
}

module meandering(n=6, ri=5, w=5, pp=60) {
  for(n=[0:n-1]) {
    translate([0, n*(2*ri+w)])
      if(0 == (n%2))
        meander(ri=ri, w=w, pp=pp);
      else
        translate([0, 2*ri+w])
          mirror([0, 1])
            meander(ri=ri, w=w, pp=pp);
  }
}

module stress_relief(ri=5, w=5) {
  difference() {
    translate([0, ri/2])
      square([2*ri+w, ri], center=true);
    for(x=[-1, 1]*(ri+w/2))
      translate([x, ri])
        circle(r=ri);
  }
}

module meandering_stress_relief(n=6, ri=5, w=5, pp=60) {
  translate([0, ri])
    meandering(n=n, ri=ri, w=w, pp=pp);
  stress_relief(ri=ri, w=w);
  translate([(n%2)*(pp-w), n*(2*ri+w)+2*ri])
    rotate(180)
      stress_relief(ri=ri, w=w);
}
