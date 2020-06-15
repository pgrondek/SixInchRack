include<../sixinch_library.scad>

//

  ///////////////////////////////
 // Raspberry Pi 3 Model B    //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = true;
print_lid            = false;
print_rear           = false;

if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [];
    round_peg          = [];   
    screw_side_front   = [];
    screw_top          = [36];
    screw_bottom_front = [36];
    units              = 3; 
    frontplate(units,square_hole,round_hole,round_peg,screw_side_front,screw_top,screw_bottom_front);

}

if(print_handle_sml){ // Handle // 
    units              = 3;
    lay_flat_for_print = true;   
    handle(units,lay_flat_for_print);
}

if(print_cabinet_sml){ // Cabinet //  
    w=88;
    h=70;
    screw_bottom_front = [36];
    screw_side_front   = [];
    round_peg          = [[40,  45, 15, 0, 15],  // Pillar in front of PowerPort 6
                          [90,  45, 15, 0, 15],  // Pillar in front of PowerPort 6
                          [10,  80, 10, 0, 15],  // Pillar to the near right of PowerPort 6
                          [10, 120, 10, 0, 15],  // Pillar to the far right of PowerPort 6
                          [60, 110, 65, 0,  8],  // Pillar under the PowerPort 6
                          ];
    depth              = 155;
    units              = 3;
    cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);
}

if(print_lid){ // Lid // 
    depth = 155;
    units = 3;
    screw_front = [36];//mm
    screw_back  = [36];//mm
    lid(depth,units,screw_front,screw_back);        
}

if(print_rear){  // Back plate //    
    square_hole  = [[14 ,12, 80, 16]];
    round_hole   = [[6,5,6],[6,1,6]];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    depth        = 155;
    units        = 3;
    back_plate(units,depth,screw_top,screw_bottom,screw_side,square_hole,round_hole);
}  



















