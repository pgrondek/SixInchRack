include<../sixinch_library.scad>


  ///////////////////////////////
 // Edgerouter X              //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = false;
print_lid            = false;
print_rear           = true;
model                = false;

units = 3;
depth = 98;

module model() {
    rotate([-90,0,0]){
        translate([22, -99, 8])
          difference(){
            union(){
             color([1,1,1]) cube([110, 75, 22]);    // EdgeRouter X model
            }
            translate([9, -1, 6]) 
                color([0.5, 0.5, 0.5]) 
                    union() { // RJ45 ports
                        translate([0* (15.5 + 3.5), 0, 0]) cube([15.5, 16, 13]);
                        translate([1* (15.5 + 3.5), 0, 0]) cube([15.5, 16, 13]);
                        translate([2* (15.5 + 3.5), 0, 0]) cube([15.5, 16, 13]);
                        translate([3* (15.5 + 3.5), 0, 0]) cube([15.5, 16, 13]);
                        translate([4* (15.5 + 3.5), 0, 0]) cube([15.5, 16, 13]);
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
        [20,  20, 15, 0, 15],  // Pillar in front
        [90,  20, 15, 0, 15],  // Pillar in front
                              
        [5,   80, 10, 0, 15],  // Pillar to the near right
    
        [105, 80, 10, 0, 15],  // Pillar to the near left
    
        [55,  50, 45, 0,  8],  // Pillar under the switch
    
    ];
    difference() {
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);
        model();
    }
}

if(print_lid){ // Lid // 
    screw_front = [36];//mm
    screw_back  = [36];//mm
    difference () {
        lid(depth, units, screw_front, screw_back);        
        model();
    }
}

if(print_rear){  // Back plate //    
    square_hole  = [
        [9 + 0 * (15.5 + 3.5), 12, 15.5, 13],
        [9 + 1 * (15.5 + 3.5), 12, 15.5, 13],
        [9 + 2 * (15.5 + 3.5), 12, 15.5, 13],
        [9 + 3 * (15.5 + 3.5), 12, 15.5, 13],
        [9 + 4 * (15.5 + 3.5), 12, 15.5, 13],
    ];
    round_hole   = [];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    back_plate(units, depth, screw_top, screw_bottom, screw_side, square_hole,round_hole);
}  


// EdgeRouter X model
if(model) {
  model();
}
