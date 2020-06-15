include<../sixinch_library.scad>


  //////////////////
 // Orange Pi    //
//////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = true;
print_lid            = false;
print_rear           = false;
print_antennae       = false;
dia=11;

if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [[87 ,7.5, 2.1],[91 ,7.5, 2.1],[107, unit,dia-2.0]];
    round_peg          = [];   
    screw_side_front   = [];
    screw_top          = [36];
    screw_bottom_front = [36];
    units              = 2; 
    frontplate(units,square_hole,round_hole,round_peg,screw_side_front,screw_top,screw_bottom_front);

}

if(print_handle_sml){ // Handle // 
    units              = 2;
    lay_flat_for_print = true;   
    handle(units,lay_flat_for_print);
}

if(print_cabinet_sml){ // Cabinet //  
    w=97;
    h=70;
    screw_bottom_front = [36];
    screw_bottom_back  = [26];
    screw_side_front   = [];
    round_peg          = [[w,h,      6,2.8,4],
                          [w-40,h,   6,2.8,4],
                          [w-40,h-42,6,2.8,4],
                          [w,h-42,   6,2.8,4]];
    
    depth              = 80;
    units              = 2;
    difference(){
        cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front,screw_bottom_back);
        
    }
}

if(print_lid){ // Lid // 
    depth = 80;
    units = 2;
    screw_front = [36];//mm
    screw_back  = [36];//mm
    lid(depth,2,screw_front,screw_back);        
}

if(print_rear){  // Back plate //    
    square_hole  = [[69 ,3, 17, 15] , [88 ,4, 6, 14.5]  ];
    round_hole   = [[45,5,5],[45,1.5,5] ];
    screw_top    = [36];//mm
    screw_bottom = [26];//mm
    screw_side   = [];
    depth        = 98;
    units        = 2;
    back_plate(units,depth,screw_top,screw_bottom,screw_side,square_hole,round_hole);
}  


  ///////////////////////////////
 // Customization    //
///////////////////////////////


if(print_cabinet_sml){ // Cabinet fan //
    shift =20;
    
    difference(){
        translate([36,14,69-shift]){
            rotate([0,0,55]){
            cube([40,26+3,26+3],center=true); //25x25x10mm fan
            }
        }
        
        //fan duct
        translate([36,14,69-shift]){
            rotate([0,0,55]){
            cube([52,26,26],center=true); //25x25x10mm fan
            }
        }
        
        //cutoff inside
        translate([36,14,69-shift]){
            rotate([0,0,55]){
                translate([11,0,0]){
                    cube([22,32,32],center=true); //25x25x10mm fan
                }
            }
        }
        //cutoff bottom
        translate([0,-20,0]){
            cube([200,20,200]);
        }
        //cutoff side
        cube([20,20,100]);
        
        
        
        
    }
} 


if(print_antennae){
    
    //outside
    
    len = 13;
    
    
    translate([100,30,3]){        
        difference(){
        union(){
            rotate([0,90,0]){
                cylinder(d=dia,h=len); 
            }
            translate([13,0,0]){sphere(d=dia);}
            translate([13,0,0]){cylinder(d=dia,h=dia/2);}
            translate([len/2,0,dia/4]){cube([13,dia,dia/2],center=true);}
        }
        //negative
        union(){
            rotate([0,90,0]){
                translate([0,0,-0.5]){cylinder(d=5.5,h=len+1); }
            }
            translate([len,0,0]){sphere(d=dia-4);}
            translate([13,0,-0.5]){cylinder(d=dia-2,h=dia/2+1);}
        }
    }
    }
    
    
    
    //inside
    translate([100,unit,-0]){        
        difference(){
        union(){    
            translate([13,0,0]){cylinder(d=dia-2.5,h=5.5);}
            translate([13,0,5.5]){cylinder(d=dia+4,h=3);}
        }
        translate([13,0,-1]){cylinder(d=dia-4.5,h=10);}
        translate([13,0,4]){
            for(i=[0:22.5:360]){
                rotate([0,0,i]){
                    translate([9,0,0]){
                        cylinder(d=4,h=5);
                    }
                }
            }
        } 
    }
    
    //spring
    difference(){
        union(){ 
            translate([23,0,5.5]){
                cylinder(d=3.5,h=3);
            }   
        }
        translate([22.2,-5,0]){cube([5,10,15]);}
    }
    translate([22.2,-2,5.5]){ cube([1,20,3]);}
    translate([22.7,20,5.5]){
    cylinder(d=6,h=3);
}        
}    
}












