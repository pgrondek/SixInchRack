include<../sixinch_library.scad>


  ///////////////////////////////
 // Philips Hue gen 2         //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = false;
print_lid            = true;
print_rear           = false;
model                = false;

units = 3;
depth = 100;

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
        [20,  10, 15, 0, 15],  // Pillar in front
        [80,  10, 15, 0, 15],  // Pillar in front
                              
        [10,  30, 10, 0, 15],  // Pillar to the near right
        [10,  80, 10, 0, 15],  // Pillar to the far right
    
        [99,  30, 10, 0, 15],  // Pillar to the near left
        [99,  80, 10, 0, 15],  // Pillar to the far left
    
        [55,  50, 50, 0,  8],  // Pillar under the switch
    
    ];
    difference() {
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);
        rotate([-90,0,0]){
            translate([32.5, -101, 8])
                cube([91.5, 91.5, 26]);    // Philips Hue model
          }
    }

}

if(print_lid){ // Lid // 
    screw_front = [36];//mm
    screw_back  = [36];//mm
    difference () {
        union(){
            lid(depth, units, screw_front, screw_back);     
            rotate([-90,0,0])
                translate([77.5, -56, 40.15])
                    cylinder(2, r=45/2, center=false);   
        }
        
        rotate([-90,0,0]){
            translate([27.5, -156, 8])
                union(){
                    cube([91.5, 91.5, 26]);    // Philips Hue model
                    translate([5 + 45.75, 55+45.75 ,20])
                        cylinder(100, r=35/2, center=false);
                }
            
        }
    }
}

if(print_rear){  // Back plate //    
    square_hole  = [[63.5, 9, 15, 14]];
    round_hole   = [[43,19,10]];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    back_plate(units, depth, screw_top, screw_bottom, screw_side, square_hole,round_hole);
}  


// Philips Hue model
if(model) {
  rotate([-90,0,0]){
    translate([32.5, -101, 8])
      difference(){
        union(){
            color([1,1,1]) 
                cube([91.5, 91.5, 26]);    // Philips Hue model
            translate([45.75, 45.75 ,20])
                cylinder(100, r=35/2, center=false);
        }
        translate([ 55, -1, 4]) 
            color([0.5, 0.5, 0.5]) 
                cube([14, 16, 14]);       // RJ45 ports
        translate([ 29, -1,  13]) // Power jack
            rotate([90,0,0])
                color([0.5, 0.5, 0.5]) 
                    cylinder(10,5,5,true);
      }
  }
}
