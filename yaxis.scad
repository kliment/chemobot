module lm08uu(){
cylinder(r=16/2,h=24,center=true);
cylinder(r=10/2,h=124,center=true);

}
module belt(l=100,bearing=13,thickness=2.5,width=6, fill=false){
	difference(){
		union(){
			translate([-l/2,0,0])cylinder(r=(bearing+thickness)/2,h=width);
			translate([l/2,0,0])cylinder(r=(bearing+thickness)/2,h=width);
			translate([-l/2,-(bearing+thickness)/2,0])cube([l,(bearing+thickness),width-0.001]);
		}
		if(fill==true){
			translate([-l/2,0,-0.5])cylinder(r=bearing/2,h=width+2);
			translate([l/2,0,-0.5])cylinder(r=bearing/2,h=width+2);
			translate([-l/2,-bearing/2,-0.5])cube([l,bearing,width+1.999]);
		}
	}
}

*lm08uu();
*belt(100);

rotate([90,0,0])difference(){
translate([124,50,-2])cube([52,86,30]);
translate([152,80,28-8])cylinder(r=1.8,h=30);
translate([152,80+35,28-8])cylinder(r=1.8,h=30);
#translate([143,90,0])cylinder(r=1.8,h=30);
#translate([143,90+35,0])cylinder(r=1.8,h=30);
translate([115,53,20])rotate([0,90,0]){
cylinder(r=1.8,h=70);
translate([0,30,0])cylinder(r=1.8,h=70);
translate([0,50,0])cylinder(r=1.8,h=70);
translate([0,80,0])cylinder(r=1.8,h=70);
}

translate([95,71+1.75,-33.5])cube([50,80,50]);
#translate([140,49.9,21.1])cube([20,16,7]);
#translate([145,49.9+16.3,22.1])cube([3,150,7]);
#translate([165,61.75,8.5])rotate([0,90,90])scale(0.98)lm08uu();
translate([165,80,8.5])rotate([0,90,90])scale(0.98)lm08uu();
translate([165,100,8.5])rotate([0,90,90])scale(0.98)lm08uu();
translate([165,120,8.5])rotate([0,90,90])scale(0.98)lm08uu();
translate([165,140,8.5])rotate([0,90,90])scale(0.98)lm08uu();
translate([135,61.75,8.5])rotate([0,90,90])scale(0.98)lm08uu();
#translate([135,-30,8.5])rotate([0,90,90])color([0.2,0.2,0.5])cylinder(r=5.25,h=300);
translate([150,63+12,-3.5])rotate([0,0,90])belt(150,bearing=4.5,width=20,thickness=7.5,fil=true);
}