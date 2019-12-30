module arc_sector(ri=10, ro=20, a=90) {
  intersection() {
    difference() {
      circle(r=ro);
      circle(r=ri);
    }
    union() {
      intersection() {
        rotate(floor(a/90)*90)
          square([1, 1]*ro);
        rotate(a-90)
          square([1, 1]*ro);
      }
      if(90 <= a)
        for(quadrant=[0:floor(a/90)-1])
          rotate(quadrant*90)
            square([1, 1]*ro);
    }
  }
}
