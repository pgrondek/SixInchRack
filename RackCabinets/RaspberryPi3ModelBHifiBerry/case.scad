include<../sixinch_library.scad>

/* debug = false; */
/* if (debug) { */
/*      $fn = 16; */
/*      translate([85.5, 4, 54]) { */
/*           rotate(a=[-90, -90, 0]) { */
/*                color("red") { */
/*                     import("../../../Open_SCAD_Raspberry_PI3_model/files/Pi3HifiBerry.stl"); */
/*                } */
/*           } */
/*      } */
/* } */

  ///////////////////////////////
 // Raspberry Pi 3 Model B    //
///////////////////////////////

print_frontplate_sml = false;
print_handle_sml     = false;
print_cabinet_sml    = false;
print_lid            = false;
print_rear           = true;

if(print_frontplate_sml){ // Frontplate //
    square_hole        = [];
    round_hole         = [[65 ,7.5, 3.1],[69.5 ,7.5, 3.1]];
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
    round_peg          = [[w,h,6,3,4],
                          [w-49,h,6,3,4],
                          [w-49,h-58,6,3,4],
                          [w,h-58,6,3,4]];
    depth              = 98;
    units              = 3;

    difference() {

         cabinet(depth,units,screw_bottom_front,round_peg,screw_side_front);

         hull() {
              hull() {
                   rotate(a=90, v=[0, 1, 0]) {
                        translate([-45.5, 30, 10]) {
                             cylinder(h=50, r=7);
                        }
                   }
                   rotate(a=90, v=[0, 1, 0]) {
                        translate([-62.5, 30, 10]) {
                             cylinder(h=50, r=7);
                        }
                   }
              }
              hull() {
                   rotate(a=90, v=[0, 1, 0]) {
                        translate([-45.5, 50, 10]) {
                             cylinder(h=50, r=7);
                        }
                   }
                   rotate(a=90, v=[0, 1, 0]) {
                        translate([-62.5, 50, 10]) {
                             cylinder(h=50, r=7);
                        }
                   }
              }
         }
    }

}

if(print_lid){ // Lid //
    depth = 98;
    units = 3;
    screw_front = [36];//mm
    screw_back  = [36];//mm
    lid(98,3,screw_front,screw_back);

    translate([65, 21, 12]) {
         cube([40, 20, 5]);
    }
    translate([65, 21, 71]) {
         cube([40, 20, 5]);
    }

}

if(print_rear){  // Back plate //
    square_hole  = [[37 ,3, 17, 15] , [57 ,4, 15, 16] , [75,4,15,16] ];
    round_hole   = [[6,5,6],[6,1,6], [24,3.5,3.5],[24,1.2,3.5]  ,[30,3.5,3.5],[30,1.2,3.5]];
    screw_top    = [36];//mm
    screw_bottom = [36];//mm
    screw_side   = [];
    depth        = 98;
    units        = 3;
    back_plate(units,depth,screw_top,screw_bottom,screw_side,square_hole,round_hole);
}
