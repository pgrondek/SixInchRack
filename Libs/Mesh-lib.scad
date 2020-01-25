module mesh(xCount, yCount, height=1, size=1) {
    translate ([1*size,1*size,0]) {
        for (x =[0:(xCount-1)]) { 
            for (y =[0:(yCount-1)]) {
                translate([x*4*size,y*2.2*size,0]) {
                    cylinder(height,size,size,$fn=6);
                    translate([2*size,1*size,0])
                        cylinder(height,size,size,$fn=6);
                }
            }
        } 
    }
}
