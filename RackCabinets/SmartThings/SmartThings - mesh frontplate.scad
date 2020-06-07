include<../sixinch_library.scad>
include<../../Libs/Mesh-lib.scad>


  ///////////////////////////////
 // SmartThings frontplate    //
///////////////////////////////

print_frontplate_sml = 1;

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
        translate([50.5, -25, -3])
            linear_extrude(5)
                text("SmartThings");
    translate([25,33,3])
        rotate([180,0,0])
            scale([0.04, 0.04, 0.08])
                logo();
               
           
}

module logo(){
    difference() {
        surface(file = "Logo.png");
        translate([0,0,-5])
            cube([600,600,5]);
        translate([0,0,80])
            cube([600,600,50]);
    }
}


//cube([600,600,0.1]);
//difference(){
//    
//surface(file = "Logo.png", center = false);

//}