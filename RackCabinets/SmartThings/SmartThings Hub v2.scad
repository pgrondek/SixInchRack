include<../sixinch_library.scad>


  ///////////////////////////////
 // SmartThing Hub v2         //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = 0;
print_lid            = 0;
print_rear           = 1;
model                = 0;

units = 3;
depth = 140;

module model() {
    rotate([-90,0,0]){
        translate([22, -135, 4])
          difference(){
            union(){
                color([1,1,1]) {
                 fillet = 20;
                    linear_extrude(height = 34)
                    translate([fillet,fillet,0]){
                        offset(r=fillet) {
                            square([110 - 2* fillet, 126 - 2*fillet]);
                        }
                    }
                }
            }
            color([0.5, 0.5, 0.5]) 
            union() {
                translate([67, -1, 10]) 
                    cube([15.5, 16, 13]);
                
                translate([25,-1,15])
                    rotate([270,0,0])
                        cylinder(15.5, 5, 5);
            }
            
          }
      }
}


if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [];
    round_peg          = [];   
    screw_side_front   = [];
    screw_top          = [36];
    screw_bottom_front = [36];
    frontplate(units,square_hole,round_hole,round_peg,screw_side_front,screw_top,screw_bottom_front);

}

if(print_handle_sml){ // Handle // 
    lay_flat_for_print = false;   
    handle(units,lay_flat_for_print);
}

if(print_cabinet_sml){ // Cabinet //  
    w=88;
    h=70;
    screw_bottom_front = [36];
    screw_side_front   = [];
    round_peg          = [
        [25,  8, 15, 0, 15],  // Pillar in front
        [85,  8, 15, 0, 15],  // Pillar in front
                              
        [5,   80, 10, 0, 15],  // Pillar to the near right
        [5,  120, 10, 0, 15],  // Pillar to the far right

        [105, 80, 10, 0, 15],  // Pillar to the near left
        [105, 120, 10, 0, 15],  // Pillar to the far left

        [55,  70, 45, 0,  8],  // Pillar under the switch
    
    ];
    difference() {
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front, true);
        model();
    }
}

if(print_lid){ // Lid // 
    screw_front = [36];//mm
    screw_back  = [36];//mm
    remove = true;
    difference () {
        lid(depth, units, screw_front, screw_back, true);        
        model();
    }
}

if(print_rear){  // Back plate //    
    square_hole  = [
        [71.5, 13, 15.5, 13],
    ];
    round_hole   = [
        [25.5, 19, 10, 13]
    ];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    back_plate(units, depth, screw_top, screw_bottom, screw_side, square_hole,round_hole);
}  


// EdgeRouter X model
if(model) {
  model();
}
