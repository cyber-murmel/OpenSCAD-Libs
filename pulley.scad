module pulley(height, diameter, shaft){
    $fn=180;
    
    rotate_extrude()
        difference(){
            translate([shaft/2, -height/2])
                square([(diameter+height-shaft)/2, height]);
            translate([(diameter+height)/2,0])
                circle(d=height);
        }
}

//pulley(3, 15, 3);