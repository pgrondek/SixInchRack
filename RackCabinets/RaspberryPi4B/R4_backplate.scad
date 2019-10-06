include<../sixinch_library.scad>


  ///////////////////////////////
 // Raspberry Pi 3 Model 4    //
///////////////////////////////

print_rear           = true;


if(print_rear){  // Back plate //    
    square_hole  = [
        [37 ,4, 15, 16] , 
        [55 ,4, 15, 16] , 
        [73 ,3, 17, 15]  
    ];
    
    round_hole   = [[31,3.5,5],[31,1.2,3.5]];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    depth        = 98;
    units        = 2;
    
    translate([-22.35,-2.3,-99]){
        back_plate(units,depth,screw_top,screw_bottom,screw_side,square_hole,round_hole);
    }
}  



















