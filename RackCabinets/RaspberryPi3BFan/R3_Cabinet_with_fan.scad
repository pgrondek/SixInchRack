include<../sixinch_library.scad>


  ///////////////////////////////
 // Raspberry Pi 3 Model B    //
///////////////////////////////
print_cabinet_sml    = true;

if(print_cabinet_sml){ // Cabinet //  
    w=88;
    h=70;
    
    pole=2.52;
    height=8;
    
    screw_bottom_front = [36];
    screw_side_front   = [];
    round_peg          = [
        [w,h,6,2.8,4],
        [w-49,h,6,2.8,4],
        [w-49,h-58,6,2.8,4],
        [w,h-58,6,2.8,4],
    
        [w,h,      pole,0,height],
        [w-49,h,   pole,0,height],
        [w-49,h-58,pole,0,height],
        [w,h-58,   pole,0,height]];
    depth              = 98;
    units              = 2;
    shift              = 0;

    difference(){
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);
        //fan grille
        translate([0,-0.1,56   -shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+4 -shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+8 -shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+12-shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+16-shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+20-shift]){cube([43.45,16.5,2]);}
        translate([0,-0.1,56+24-shift]){cube([43.45,16.5,2]);}
    }
    
    difference(){
        translate([36,14,69-shift]){
            rotate([0,0,55]){
            cube([40,26+3,26+3],center=true); //25x25x10mm fan
            }
        }
        
        //fan duct
        translate([36,14,69-shift]){
            rotate([0,0,55]){
            cube([52,26,26],center=true); //25x25x10mm fan
            }
        }
        
        //cutoff inside
        translate([36,14,69-shift]){
            rotate([0,0,55]){
                translate([11,0,0]){
                    cube([22,32,32],center=true); //25x25x10mm fan
                }
            }
        }

        //cutoff bottom
        translate([0,-20,0]){
            cube([200,20,200]);
        }

        //cutoff side
        cube([20,20,100]);
    }
    
}
