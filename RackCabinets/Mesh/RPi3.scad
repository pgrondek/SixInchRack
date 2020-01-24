include<../sixinch_library.scad>
include<../../Libs/Mesh-lib.scad>


  ///////////////////////////////
 // Raspberry Pi 3 Model B    //
///////////////////////////////

print_frontplate_sml = true;

if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [];
    round_peg          = [];   
    screw_side_front   = [];
    screw_top          = [36];
    screw_bottom_front = [36];
    units              = 2; 
    difference() {
        frontplate(units,square_hole,round_hole,round_peg,screw_side_front,screw_top,screw_bottom_front);

        translate([25,1.5,0]) {
            intersection(){
                translate([-5,-5,0]){
                    difference() {
                        mesh(7, 5, 5, 5);
                        translate([16,9.5,0]){cylinder(50,4.5,4.5);}
                        translate([16,25.5,0]){cylinder(50,4.5,4.5);}
                        translate([99,9.5,0]){cylinder(50,4.5,4.5);}
                        translate([99,25.5,0]){cylinder(50,4.5,4.5);}
                    }
                }
                union() {
                    cube([105,25,10]);
                }
            }    
            
            
        }
    } 
}
