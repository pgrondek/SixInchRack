include<../sixinch_library.scad>

debug = false;
if (debug) {
     $fn = 16;
     color("red") {
          sa50();
     }
}


   //////////////////////////////////////////////////
  //  PASTE ALL OF: sixinch_library.scad IN HERE  //
 //   Thingiverse can only accept one file.      //
//////////////////////////////////////////////////


sa50_length = 117.5;
sa50_height = 39;
sa50_width = 88;

Part = "a"; // [a:All, b:FrontPlate, b2:FrontPlate2, c:Cabinet, d:Lid, e:BackPlate, f:Handles]
Units = 5;
Depth = sa50_length;

xoffset = (width - sa50_width) / 2;
yoffset = ((Units * unit) - sa50_height) / 2;
round_holes = [[xoffset + 12, yoffset + 14, 10],
               [xoffset + 12, yoffset + 28, 10],
               [xoffset + 35.5, yoffset + 10, 13],
               [xoffset + 35.5, yoffset + 26, 13],
               [xoffset + 54, yoffset + 10, 13],
               [xoffset+ 54, yoffset + 26, 13],
               [xoffset + 73, yoffset + 13.5, 7]];

go();

module go(){
    rotate([90,0,-90]){
        if(Part=="a"){
            lower() {
                 frontplate(Units,[],[],[],[Units/2],[45],[45]);
            }
            upper() {
                 frontplate(Units,[],[],[],[Units/2],[45],[45]);
            }
            cabinet_supported () {
                 cabinet(Depth,Units,[45],[],[Units/2]);
            }
            lid_supported () {
                  lid(Depth,Units,[45],[45]);
            }
            back_plate(Units, Depth, [45], [45], [Units/2], [], round_holes);
            handle(Units,false);
        }else if(Part=="b"){
            lower() {
                 frontplate(Units,[],[],[],[Units/2],[45],[45]);
            }
        }else if(Part=="b2"){
            upper() {
                 frontplate(Units,[],[],[],[Units/2],[45],[45]);
            }
        }else if(Part=="c"){
             cabinet_supported () {
                  cabinet(Depth,Units,[45],[],[Units/2]);
             }
        }else if(Part=="d"){
             lid_supported () {
                  lid(Depth,Units,[45],[45]);
             }
        }else if(Part=="e"){
            back_plate(Units, Depth, [45], [45], [Units/2], [], round_holes);

/* translate([-sa50_length, -sa50_width - ((sixinch - sa50_width) / 2), ((Units * unit) - sa50_height) / 2]) { */
/*             cube([10, 10, 10]); */
/*             } */
        }else if(Part=="f"){
            handle(Units,true);
        }
    }
}

module lower () {
   difference() {
        children();
        rotate([0, 90, 90]){
             sa50();
        }
        rotate([0, 90, 90]){
             translate([0, 0, -sa50_height]) {
                  sa50();
             }
        }
   }
}

module upper () {
     intersection() {
          children();
          rotate([0, 90, 90]){
               translate([0, 0, -sa50_height]) {
                    sa50();
               }
          }
     }
     rotate([-90,90,0]) {
          translate([-6, -(width - sa50_width + 10), 2]) {
               cube([3, 8, 12]);
          }
          translate([-6, - width - 10, 2]) {
               cube([3, 8, 12]);
          }
     }
}

module lid_supported () {
     children();

     difference () {
          union () {
               translate([(sixinch - sa50_width) / 2 , (Units * unit), (sa50_length / 2) + 20]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - sa50_width) / 2) + sa50_width, (Units * unit), (sa50_length / 2) + 20]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
          }
          rotate([0, 90, 90]){
               sa50();
          }
     }
}

module cabinet_supported () {
     children();

     difference () {
          union () {
               translate([(sixinch - sa50_width) / 2, 25, (sa50_length / 2) - 45]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=25, r=5);
                    }
               }
               translate([((sixinch - sa50_width) / 2) + sa50_width, 25, (sa50_length / 2) - 45]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=25, r=5);
                    }
               }
               translate([(sixinch - sa50_width) / 2, 25, (sa50_length / 2)]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=25, r=5);
                    }
               }
               translate([((sixinch - sa50_width) / 2) + sa50_width, 25, (sa50_length / 2)]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=25, r=5);
                    }
               }

               difference () {
                    translate([((sixinch - sa50_width) / 2) + 5 + 10, 20, sa50_length - 12 - 5]) {
                         rotate([90, 0, 0]) {
                              cylinder(h=20, r=5 + 2);
                         }
                    }
                    translate([((sixinch - sa50_width) / 2) + 5 + 10, 20, sa50_length - 12]) {
                         rotate([90, 0, 0]) {
                              cylinder(h=8, r=5.5);
                         }
                    }
               }

               difference () {
                    translate([((sixinch - sa50_width) / 2) + sa50_width - 5 - 10, 20, sa50_length - 12 - 5]) {
                         rotate([90, 0, 0]) {
                              cylinder(h=20, r=5 + 2);
                         }
                    }
                    translate([((sixinch - sa50_width) / 2) + sa50_width - 5 - 10, 20, sa50_length - 12]) {
                         rotate([90, 0, 0]) {
                              cylinder(h=8, r=5.5);
                         }
                    }
               }

          }
          rotate([0, 90, 90]){
               sa50();
          }
     }
}

module sa50 () {
     rotate([0,0,0]) {
          translate([-sa50_length, -sa50_width - ((sixinch - sa50_width) / 2), ((Units * unit) - sa50_height) / 2]) {
               cube([sa50_length, sa50_width, sa50_height ]);
          }
     }
}
