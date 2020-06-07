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
    lay_flat_for_print = false;   
    handle(units,lay_flat_for_print);
}

if(print_cabinet_sml){ // Cabinet //  
    w=88;
    h=70;
    screw_bottom_front = [36];
    screw_side_front   = [];
    round_peg          = [[30,46.3,15,0,10],  // Pillar in front of PowerPort 6
                          [81,46.3,15,0,10],  // Pillar in front of PowerPort 6
                          [15.2,70,10,0,10],  // Pillar to the near right of PowerPort 6
                          [95.8,70,10,0,10],  // Pillar to the near left of PowerPort 6
                          [15.2,110,10,0,10],  // Pillar to the far right of PowerPort 6
                          [95.8,110,10,0,10],  // Pillar to the far left of PowerPort 6
                          [57,120,50,0,4],  // Pillar under the PowerPort 6
                          [57,80,50,0,4],  // Pillar under the PowerPort 6
                          ];
    depth              = 155;
    units              = 2;
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
    usb_padding  = 9;
    square_hole  = [[29 ,usb_padding, 6, 14], [29+(1*10) ,usb_padding, 6, 14], [29+(2*10) ,usb_padding, 6, 14], [29+(3*10) ,usb_padding, 6, 14], [29+(4*10) ,usb_padding, 6, 14], [29+(5*10) ,usb_padding, 6, 14]];
    round_hole   = [[6,9,6],[6,5,6],[6,1,6]];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    depth        = 155;
    units        = 3;
    back_plate(units,depth,screw_top,screw_bottom,screw_side,square_hole,round_hole);
}  



















