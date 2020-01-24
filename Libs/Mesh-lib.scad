

module mesh(xCount, yCount, height=1, size=1) {
    translate ([1*size,1*size,0]) {
        for (x =[0:(xCount-1)]) { 
            for (y =[0:(yCount-1)]) {
                translate([x*3.2*size,y*2*size,0]) {
                    cylinder(height,size,size,$fn=6);
                    translate([1.6*size,1*size,0])
                        cylinder(height,size,size,$fn=6);
                }
            }
        } 
    }
}

//mesh(5,5,5,5);
/*
height=1;
size=4;
translate([x*3.2,y*2,0]) {
    cylinder(height,size,size,$fn=6);
    translate([1.6*size,1*size,0])
        cylinder(height,size,size,$fn=6);
}
*/