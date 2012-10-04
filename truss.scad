module screw(h=20, r=2, r_head=3.5, head_drop=0, slant=true, poly=false, $fn=0){
    //makes screw with head
    //for substraction as screw hole
    if (poly) {
        cylinder_poly(h=h, r=r, $fn=$fn);
    } else {
        cylinder(h=h, r=r, $fn=$fn);
    }
    if (slant) {
        translate([0, 0, head_drop-0.01]) cylinder(h=r_head, r2=0, r1=r_head, $fn=$fn);
    }

    if (head_drop > 0) {
        translate([0, 0, -0.01]) cylinder(h=head_drop+0.01, r=r_head, $fn=$fn);
    }
}


module nema17(places=[1,1,1,1], size=15.5, h=10, holes=true, shadow=5, $fn=24){
    for (i=[0:3]) {
        if (places[i] == 1) {
            rotate([0, 0, 90*i]) translate([size, size, 0]) {
                if (holes) {
                    #rotate([0, 0, -90*i])  translate([0,0,-10]) screw(r=1.7, slant=false, head_drop=13, $fn=$fn, h=h+12);
                } else {
                    rotate([0, 0, -90*i]) cylinder(h=h, r=5.5, $fn=$fn);
                }
            }
        }
    }
    if (shadow != false) {
       * %translate ([0, 0, shadow+21+3]) cube([42,42,42], center = true);
    //flange
        translate ([0, 0, shadow+21+3-21-1]) cylinder(r=12,h=2.1, center = true, $fn=20);
    //shaft
        %translate ([0, 0, shadow+21+3-21-7]) cylinder(r=2.5,h=14, center = true);
    }
}


module truss(){
	difference(){
		cube([60,60,4]);
		for(i=[0:2]){
			translate([10+20*i,10,0])cylinder(r=3,h=20,center=true);
			translate([10,10+20*i,0])cylinder(r=3,h=20,center=true);
		}
		translate([70,0,-0.01])rotate([0,0,45])cube([50.5,90.5,6.5]);
	}
}
module trussfoot(){
truss();
translate([-20,0.01,0.01])cube([20,20,4]);
translate([-30,0.02,0.02])cube([10,19.98,8]);
}

module trussrod(){
difference(){
		union(){
		truss();
		translate([20,20-2.5])cube([20,25,37]);
		}
		translate([30,30,21+5])rotate([0,90,0])cylinder(r=4.5,h=30,center=true);
#		translate([30,30,28+4])rotate([0,90,90])cylinder(r=2.4,h=30,center=true);
		translate([30,30,26+6.01])cube([30,2,20],center=true);

		for(i=[0:2]){
			translate([10+20*i,10,13+13.99])cylinder(r=7,h=50,center=true);
			translate([10,10+20*i,13+13.99])cylinder(r=7,h=50,center=true);
		}
		
	}
}
module trussmotor(){
difference(){
		union(){
		truss();
		translate([20,20-2.5])cube([20,35,37]);
		translate([-20,20-2.51])cube([41,10.5,37]);
		
		}
		#translate([26,40,10+5])cube([16,7,30]);
		translate([-0.8,20,27.3+4])rotate([90,0,180])nema17();
		translate([-10,30,37+4])cube([40,30,40],center=true);
		translate([30,30,21+5])rotate([0,90,0])cylinder(r=4.2,h=30,center=true);
#		translate([30,30,28+5])rotate([0,90,90])cylinder(r=2.4,h=30,center=true);
		translate([30,30,26+6])cube([30,2,20],center=true);

		for(i=[0:2]){
			translate([10+20*i,10,13+13.99])cylinder(r=7,h=50,center=true);
			translate([10,10+20*i,13+13.99])cylinder(r=7,h=50,center=true);
			translate([10+20*i,10,0])cylinder(r=3,h=20,center=true);
			translate([10,10+20*i,0])cylinder(r=3,h=20,center=true);
		}
		
	}
}

*trussfoot();
*translate([72,72,0]) mirror([1,1]) trussfoot();
*truss();
*translate([72,72,0]) mirror([1,1]) truss();
translate([-25,0])mirror([1,0,0]){
trussrod();
translate([0,-3,0]) mirror([0,1,0]) trussrod();
}
trussmotor();
translate([0,-3,0]) mirror([0,1,0]) trussmotor();

%cube([200,200,0.01],true);