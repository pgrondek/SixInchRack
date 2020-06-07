include<../sixinch_library.scad>
include<../../Libs/Mesh-lib.scad>


  ///////////////////////////////
 // EdgeRouter X              //
///////////////////////////////

print_frontplate_sml = true;

if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [];
    round_peg          = [];   
    screw_side_front   = [];
    screw_top          = [36];
    screw_bottom_front = [36];
    units              = 3; 
    difference() {
        union() {
            frontplate(units,square_hole,round_hole,round_peg,screw_side_front,screw_top,screw_bottom_front);
            
            
        }

        translate([25,1.5,0]) {
            intersection(){
                translate([-1.5,-1.5,0]){
                    difference() {
                        mesh(17, 6, 3, 3);
                        translate([12.5,  6, 0]){cylinder(50,4.5,4.5);}
                        translate([12.5, 36, 0]){cylinder(50,4.5,4.5);}
                        translate([95.5,  6, 0]){cylinder(50,4.5,4.5);}
                        translate([95.5, 36, 0]){cylinder(50,4.5,4.5);}
                    }
                }
                
                cube([105,38,10]);
            }    
        }
        
        translate([0,0,3]) cube([155,130,10]);
    } 
    
    rotate([180,0,0])
        translate([58.5, -28, -3])
            linear_extrude(5)
                text("router");
}
