include<../sixinch_library.scad>

/* debug = false; */
/* if (debug) { */
/*      $fn = 16; */
/*      translate([-117, -120, 15]) { */
/*           color("red") { */
/*                cube([117.5, 87.8, 38.15 ]); */
/*           } */
/*      } */
/* } */


   //////////////////////////////////////////////////
  //  PASTE ALL OF: sixinch_library.scad IN HERE  //
 //   Thingiverse can only accept one file.      //
//////////////////////////////////////////////////




Part = "-"; // [a:All, b:FrontPlate, b2:FrontPlate2, c:Cabinet, d:Lid, e:BackPlate, f:Handles]
Units = 5;
Depth = 115;

go();

module go(){
    rotate([90,0,-90]){
        if(Part=="a"){
            frontplate(Units,[],[],[],[Units/2],[45],[45]);
            cabinet(Depth,Units,[45],[],[Units/2]);
            lid(Depth,Units,[45],[45]);
            back_plate(Units,Depth,[45],[45],[Units/2],[],[]);
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
            cabinet(Depth,Units,[45],[],[Units/2]);
        }else if(Part=="d"){
            lid(Depth,Units,[45],[45]);
        }else if(Part=="e"){
            back_plate(Units,Depth,[45],[45],[Units/2],[],[]);
        }else if(Part=="f"){
            handle(Units,true);
        }
    }
}

module lower () {
   difference() {
        children();
        rotate([-90,90,0]){
             translate([-117, -120, -20]) {
                  cube([117.5, 87.8, 37 ]);
             }
        }
   }
}

module upper () {
   difference() {
        intersection() {
             children();
             rotate([-90,90,0]) {
                  translate([-117, -120, -20]) {
                       cube([117.5, 87.8, 37 ]);
                  }
             }
        }
   }
   rotate([-90,90,0]) {
        translate([-6, -36, 2]) {
             cube([3, 8, 14]);
        }
        translate([-6, -124, 2]) {
             cube([3, 8, 14]);
        }
   }
}
