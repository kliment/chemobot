use <truss.scad>;
use <yaxis.scad>;
module nema14(){
cube([36,36,40],true);
translate([0,0,1])cylinder(r=12,h=42,center=true);
translate([0,0,1])cylinder(r=3,h=38);
translate([13,13,1])cylinder(r=1.8,h=38);
translate([13,-13,1])cylinder(r=1.8,h=38);
translate([-13,13,1])cylinder(r=1.8,h=38);
translate([-13,-13,1])cylinder(r=1.8,h=38);
translate([13,13,27])cylinder(r=3.8,h=28);
translate([13,-13,27])cylinder(r=3.8,h=28);
translate([-13,13,27])cylinder(r=3.8,h=28);
translate([-13,-13,27])cylinder(r=3.8,h=28);

}
module yidler(){
difference(){
	union(){
		translate([123,-12,2])cube([300-2*123,52,30]);
	}
	translate([121,-53,17])cube([300-2*121,70,30]);
	translate([155,-73+11,0])rotate([0,0,0])cube([300-2*121,70,30]);
translate([165,-30,8.5])rotate([0,90,90])color([0.2,0.2,0.5])cylinder(r=4.5,h=300);
translate([135,-30,8.5])rotate([0,90,90])color([0.2,0.2,0.5])cylinder(r=4.5,h=300);
translate([150,63+12,3])rotate([0,0,90])belt(150,bearing=8,width=10,thickness=11);
translate([134,30,21])rotate([0,90,0])lm08uu();
translate([150,30,21])rotate([0,90,0])scale(0.95)lm08uu();
translate([166,30,21])rotate([0,90,0])lm08uu();
#translate([150,0,3])cylinder(r=8,h=11.5);
#translate([150,0,-3])cylinder(r=2.5,h=25);
translate([127,12,0])rotate([0,0,0])cylinder(r=2.5,h=30);
translate([300-127,12,0])rotate([0,0,0])cylinder(r=2.5,h=30);
}
}

module ymotor(){
difference(){
	union(){
		translate([123,-30,2])cube([300-2*123,78,30]);
	}
	translate([121,-53,15])cube([300-2*121,70,30]);
	translate([145,-73,0])rotate([0,0,0])cube([300-2*121,70,30]);
translate([165,10,8.5])rotate([0,90,90])color([0.2,0.2,0.5])cylinder(r=4.5,h=300);
translate([135,10,8.5])rotate([0,90,90])color([0.2,0.2,0.5])cylinder(r=4.5,h=300);
translate([134,30,21])rotate([0,90,0])lm08uu();
translate([150,30,21])rotate([0,90,0])scale(0.95)lm08uu();
translate([166,30,21])rotate([0,90,0])lm08uu();
translate([100,42.5,27])rotate([0,90,0])cylinder(r=2.5,h=150);

translate([150,63,3])rotate([0,0,90])belt(150,bearing=8,width=10,thickness=11);
translate([150,-12,35])mirror([0,0,1])nema14();
translate([150,-12,-11])cylinder(r=11,h=30);
translate([127,12,0])rotate([0,0,0])cylinder(r=2.5,h=30);
translate([300-127,12,0])rotate([0,0,0])cylinder(r=2.5,h=30);
}
}

%trussrod();
%translate([300,0,0])rotate([0,0,-90])mirror([1,1])trussmotor();
%translate([167,15,29+4])rotate([90,0,0])belt(275);

%translate([0,0,-20])color([0.5,0.2,0.2])cube([300,20,20]);
%translate([-18,30,26])rotate([0,90,0])color([0.2,0.2,0.5])cylinder(r=4,h=300);

translate([0,0,5])ymotor();

*translate([0,0,-193])rotate([0,-90,0])yidler();
*translate([40,0,-193])rotate([0,-90,0])ymotor();