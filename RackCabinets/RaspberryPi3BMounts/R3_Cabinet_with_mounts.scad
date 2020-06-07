include<../sixinch_library.scad>


  ///////////////////////////////
 // Raspberry Pi 3 Model B    //
///////////////////////////////
print_cabinet_sml    = true;

if(print_cabinet_sml){ // Cabinet //  
    w=88;
    h=70;
    
    pole=2.52;
    height=8;
    
    screw_bottom_front = [36];
    screw_side_front   = [];
    round_peg          = [
        [w,h,6,2.8,4],
        [w-49,h,6,2.8,4],
        [w-49,h-58,6,2.8,4],
        [w,h-58,6,2.8,4],
    
        [w,h,      pole,0,height],
        [w-49,h,   pole,0,height],
        [w-49,h-58,pole,0,height],
        [w,h-58,   pole,0,height]];
    depth              = 98;
    units              = 2;
    shift              = 0;

    cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);    
}
