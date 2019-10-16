include<../sixinch_library.scad>


  ///////////////////////////////
 // D-Link DGS-105            //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = false;
print_lid            = false;
print_rear           = true;
model                = false;

units = 3;
depth = 155;

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
    screw_bottom_front = [];
    screw_side_front   = [];
    round_peg          = [
        [20,  50, 15, 0, 15],  // Pillar in front
        [90,  50, 15, 0, 15],  // Pillar in front
                              
        [5,   80, 10, 0, 15],  // Pillar to the near right
        [5,  120, 10, 0, 15],  // Pillar to the far right
    
        [105,  80, 10, 0, 15],  // Pillar to the near left
        [105, 120, 10, 0, 15],  // Pillar to the far left
    
        [55, 110, 65, 0,  8],  // Pillar under the switch
    
    ];
    difference() {
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);
        rotate([-90,0,0]){
            translate([27.5, -156, 4])
                cube([100, 98.5, 28.5]);    // D-Link DGS-105 model
          }
    }
}

if(print_lid){ // Lid // 
    screw_front = [36];//mm
    screw_back  = [36];//mm
    difference () {
        lid(depth, units, screw_front, screw_back);        
        rotate([-90,0,0]){
            translate([27.5, -156, 4])
                cube([100, 98.5, 28.5]);    // D-Link DGS-105 model
        }
    }
}

if(print_rear){  // Back plate //    
    square_hole  = [[17, 11, 82, 14]];
    round_hole   = [[6,5,6],[6,1,6]];
    screw_top    = [36];//mm
    screw_bottom = [];//mm
    screw_side   = [];
    back_plate(units, depth, screw_top, screw_bottom, screw_side, square_hole,round_hole);
}  


// D-Link DGS-105 model
if(model) {
  rotate([-90,0,0]){
    translate([27.5, -156, 4])
      difference(){
        union(){
         color([1,1,1]) cube([100, 98.5, 28.5]);    // D-Link DGS-105 model
        }
        translate([12, -1, 8]) color([0.5, 0.5, 0.5]) cube([82, 16, 14]);       // RJ45 ports
      }
  }
}
