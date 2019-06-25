include<../sixinch_library.scad>

debug = false;
if (debug) {
     $fn = 16;
     color("red") {
          AnkerPowerPort5();
     }
}


   //////////////////////////////////////////////////
  //  PASTE ALL OF: sixinch_library.scad IN HERE  //
 //   Thingiverse can only accept one file.      //
//////////////////////////////////////////////////


AnkerPowerPort5_length = 90.1;
AnkerPowerPort5_height = 26.1;
AnkerPowerPort5_width = 57.5;
AnkerPowerPort5_powerdepth = 50;
usb_padding  = 9;

Part = "a"; // [a:All, b:FrontPlate, c:Cabinet, d:Lid, e:BackPlate, f:Handles]
Units = 3;
Depth = AnkerPowerPort5_length + AnkerPowerPort5_powerdepth;

/* xoffset = (width - AnkerPowerPort5_width) / 2; */
/* yoffset = ((Units * unit) - AnkerPowerPort5_height) / 2; */
/* round_holes = [[xoffset + 15, yoffset + 16, 10], [xoffset + 15, yoffset + 30, 10], */
/*                [xoffset + 38.5, yoffset + 12, 13], [xoffset + 38.5, yoffset + 28, 13], */
/*                [xoffset + 57, yoffset + 12, 13], [xoffset+ 57, yoffset + 28, 13], */
/*                [xoffset + 76, yoffset + 15.5, 7]]; */
round_holes = [[6, 9, 6],
               [6, 5, 6],
               [6, 1, 6]];
square_holes = [[29, usb_padding, 6, 14],
                [29+(1*10), usb_padding, 6, 14],
                [29+(2*10), usb_padding, 6, 14],
                [29+(3*10), usb_padding, 6, 14],
                [29+(4*10), usb_padding, 6, 14],
                [29+(5*10) ,usb_padding, 6, 14]];

go();

module go(){
    rotate([90,0,-90]){
        if(Part=="a"){
             frontplate(Units,[],[],[],[Units/2],[45],[45]);
             cabinet_supported () {
                  cabinet(Depth,Units,[45],[],[Units/2]);
             }
             lid_supported () {
                  lid(Depth,Units,[45],[45]);
             }
             back_plate(Units, Depth, [45], [45], [Units/2], square_holes, round_holes);
             handle(Units, false);
        }else if(Part=="b"){
             frontplate(Units,[],[],[],[Units/2],[45],[45]);
        }else if(Part=="c"){
             cabinet_supported () {
                  cabinet(Depth,Units,[45],[],[Units/2]);
             }
        }else if(Part=="d"){
             lid_supported () {
                  lid(Depth,Units,[45],[45]);
             }
        }else if(Part=="e"){
            back_plate(Units, Depth, [45], [45], [Units/2], square_holes, round_holes);
        }else if(Part=="f"){
            handle(Units, true);
        }
    }
}

module lid_supported () {
     children();

     difference () {
          union () {
               translate([(sixinch - AnkerPowerPort5_width) / 2 , (Units * unit), (AnkerPowerPort5_length / 3) * 2 + AnkerPowerPort5_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - AnkerPowerPort5_width) / 2) + AnkerPowerPort5_width, (Units * unit), (AnkerPowerPort5_length / 3) * 2 + AnkerPowerPort5_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
          }
          rotate([0, 90, 90]){
               AnkerPowerPort5();
          }
     }
}

module cabinet_supported () {
     children();

     difference () {
          union () {
               translate([(sixinch - AnkerPowerPort5_width) / 2, 20, (AnkerPowerPort5_length / 3) * 2 + AnkerPowerPort5_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - AnkerPowerPort5_width) / 2) + AnkerPowerPort5_width, 20, (AnkerPowerPort5_length / 3) * 2 + AnkerPowerPort5_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }

               translate([(sixinch - AnkerPowerPort5_width) / 2, 20, AnkerPowerPort5_powerdepth + 1]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - AnkerPowerPort5_width) / 2) + AnkerPowerPort5_width, 20, AnkerPowerPort5_powerdepth + 1]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
          }
          rotate([0, 90, 90]){
               AnkerPowerPort5();
          }
     }
}

module AnkerPowerPort5 () {
     rotate([0,0,0]) {
          translate([-AnkerPowerPort5_length - 1 - AnkerPowerPort5_powerdepth, -AnkerPowerPort5_width - ((sixinch - AnkerPowerPort5_width) / 2), ((Units * unit) - AnkerPowerPort5_height) / 2]) {
               cube([AnkerPowerPort5_length, AnkerPowerPort5_width, AnkerPowerPort5_height ]);
          }
     }
}
