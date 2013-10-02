//---6 pack holder---
//---designed by Tim Giles, 1/16/2012
//---
//all measurements are in mils.  1inch = 1000mils
//designed for 1/2" 4-40 screw without washers
//requires 19 of each screw/nut

//if you export as a dxf and import into inkscape, scale by .0254 when importing to get the dimensions right


//bottle dimensions
Bottle_Diameter = 2675;
Bottle_Height = 9250;
Label_Bottom = 1000;
Label_Top = 4500;

//material definitions
Material_Thickness = 3/16*1000;  	//I'm designing for 3/16" plywood
Bottle_Surround = 250;  			//thickness of material surrounding the bottle cutouts

//design definitions
Handle_Width = 2*Bottle_Diameter+2*Bottle_Surround;
Handle_Height = 10000;
Plate_Spacing = Label_Top - Label_Bottom;
Lower_Plate_Spacing = Label_Bottom - Material_Thickness;
Bolt_Offset = Bottle_Diameter/4;
Bolt_Diameter = 115;			//diameter of a 4-40 screw in mils
Bolt_Length = 480;				//length of the threaded portion of a 1/2" 4-40 screw 
Nut_Width = 255;				//width of a 4-40 nut (measured flat to flat)
Nut_Thickness = 100;			//thickness of 4-40 nut
Center_Of_Plate = Bottle_Diameter/2+Bottle_Surround;
Total_Width = 2*Bottle_Diameter+4*Bottle_Surround;
Total_Length = 3*Bottle_Diameter+4*Bottle_Surround;
Base_Support_Width = 1000;
Base_Support_Notch = 500;
Base_Support_Foot = 250;
Stabilizer_Width = Total_Width - 2*Material_Thickness;
Screwdriver_Diameter = 250;		//access to screws of the lower bottle aligner thru the base support
//used for the top round and finger holes on the Hand Grab
Fillet_Radius=1000;
Finger_Radius=750/2*1.5;


module Base_Support()
{
	translate([-Base_Support_Width/2,0,0])
	difference()
	{
		union()
		{
			square([Base_Support_Width,Base_Support_Foot]);

			translate([(Base_Support_Width-Base_Support_Notch)/2,Base_Support_Foot,0])
			square([Base_Support_Notch,Material_Thickness]);

			translate([0,Base_Support_Foot+Material_Thickness,0])
			square([Base_Support_Width,Lower_Plate_Spacing]);

			translate([(Base_Support_Width-Base_Support_Notch)/2,Base_Support_Foot+Material_Thickness + Lower_Plate_Spacing,0])
			square([Base_Support_Notch,Material_Thickness]);

			translate([0,Base_Support_Foot+2*Material_Thickness + Lower_Plate_Spacing,0])
			square([Base_Support_Width,Plate_Spacing]);

			translate([(Base_Support_Width-Base_Support_Notch)/2,Base_Support_Foot+2*Material_Thickness+Lower_Plate_Spacing+Plate_Spacing,0])
			square([Base_Support_Notch,Material_Thickness]);

		}
		//Bolt Holes
		translate([Base_Support_Width/2,Base_Support_Foot+2*Material_Thickness+Lower_Plate_Spacing+Plate_Spacing/3,0])
		circle(Bolt_Diameter/2);

		translate([Base_Support_Width/2,Base_Support_Foot+2*Material_Thickness+Lower_Plate_Spacing+2*Plate_Spacing/3,0])
		circle(Bolt_Diameter/2);

		//square alignment holes
		translate([Base_Support_Width/2,Base_Support_Foot+2*Material_Thickness+Lower_Plate_Spacing+Plate_Spacing/2,0])
		translate([ -Material_Thickness/2, -Material_Thickness/2,0])
		square(Material_Thickness);

	}
}

module Bottle_Aligner()
{
	difference()
	{
		union()
		{
			circle(Bottle_Diameter/2+Bottle_Surround);
			translate([0,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([0,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,0,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2+Bottle_Surround);

			//make the straight outlines of the holder
			translate([-(Bottle_Diameter/2 + Bottle_Surround),0,0])
			square([(2*Bottle_Diameter+4*Bottle_Surround),(2*Bottle_Diameter + 2*Bottle_Surround)]);

			translate([0,-Bottle_Diameter/2-Bottle_Surround,0])
			square(Bottle_Diameter+2*Bottle_Surround);

			translate([0,1.5*Bottle_Diameter+1*Bottle_Surround,0])
			square(Bottle_Diameter+2*Bottle_Surround);
		}

		circle(Bottle_Diameter/2);
		translate([0,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2);
		translate([0,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2);
		translate([Bottle_Diameter+2*Bottle_Surround,0,0]) circle(Bottle_Diameter/2);
		translate([Bottle_Diameter+2*Bottle_Surround,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2);
		translate([Bottle_Diameter+2*Bottle_Surround,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2);

		//make hole for vertical piece
		translate([Bottle_Diameter/2+Bottle_Surround-Material_Thickness/2,0,0])
		square([Material_Thickness,Handle_Width]);

		//make holes for bolt to stabilizers
		translate([Center_Of_Plate-Bolt_Offset,Bottle_Diameter/2+Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		translate([Center_Of_Plate+Bolt_Offset,Bottle_Diameter/2+Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		translate([Center_Of_Plate-Bolt_Offset,3*Bottle_Diameter/2+3*Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		translate([Center_Of_Plate+Bolt_Offset,3*Bottle_Diameter/2+3*Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);


		//Base support notches
		translate([-(Bottle_Diameter/2+Bottle_Surround),Bottle_Diameter/2+Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

		translate([-(Bottle_Diameter/2+Bottle_Surround),3*Bottle_Diameter/2+3*Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

		translate([(3*Bottle_Diameter/2+3*Bottle_Surround)-Material_Thickness,Bottle_Diameter/2+Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

		translate([(3*Bottle_Diameter/2+3*Bottle_Surround)-Material_Thickness,3*Bottle_Diameter/2+3*Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);
	}
}



module Base_Plate()
{
	difference()
	{
		union()
		{
			circle(Bottle_Diameter/2+Bottle_Surround);
			translate([0,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([0,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,0,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,Bottle_Diameter+Bottle_Surround,0]) circle(Bottle_Diameter/2+Bottle_Surround);
			translate([Bottle_Diameter+2*Bottle_Surround,2* (Bottle_Diameter+Bottle_Surround),0]) circle(Bottle_Diameter/2+Bottle_Surround);

			//make the straight outlines of the holder
			translate([-(Bottle_Diameter/2 + Bottle_Surround),0,0])
			square([(2*Bottle_Diameter+4*Bottle_Surround),(2*Bottle_Diameter + 2*Bottle_Surround)]);

			translate([0,-Bottle_Diameter/2-Bottle_Surround,0])
			square(Bottle_Diameter+2*Bottle_Surround);

			translate([0,1.5*Bottle_Diameter+1*Bottle_Surround,0])
			square(Bottle_Diameter+2*Bottle_Surround);
		}

		//holes to mount to handle piece
		translate([Center_Of_Plate,3*Bottle_Diameter/2+3*Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		translate([Center_Of_Plate,2*Bottle_Diameter/2+2*Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		translate([Center_Of_Plate,Bottle_Diameter/2+Bottle_Surround/2,0])
		circle(Bolt_Diameter/2);

		//handgrip alignment square holes

		translate([Center_Of_Plate,1*Bottle_Diameter/4+1*Bottle_Surround/4,0])
		translate([-Material_Thickness/2, -Material_Thickness/2])
		square([Material_Thickness,2*Material_Thickness]);

		translate([Center_Of_Plate,3*Bottle_Diameter/4+3*Bottle_Surround/4,0])
		translate([-Material_Thickness/2, -Material_Thickness/2])
		square([Material_Thickness,2*Material_Thickness]);

		translate([Center_Of_Plate,5*Bottle_Diameter/4+5*Bottle_Surround/4,0])
		translate([-Material_Thickness/2, -Material_Thickness/2])
		square([Material_Thickness,2*Material_Thickness]);

		translate([Center_Of_Plate,7*Bottle_Diameter/4+7*Bottle_Surround/4,0])
		translate([-Material_Thickness/2, -Material_Thickness/2])
		square([Material_Thickness,2*Material_Thickness]);

		//make holes for screwdriver access to the stabilizer screws
		translate([Center_Of_Plate-Bolt_Offset,Bottle_Diameter/2+Bottle_Surround/2,0])
		circle(Screwdriver_Diameter/2);

		translate([Center_Of_Plate+Bolt_Offset,Bottle_Diameter/2+Bottle_Surround/2,0])
		circle(Screwdriver_Diameter/2);

		translate([Center_Of_Plate-Bolt_Offset,3*Bottle_Diameter/2+3*Bottle_Surround/2,0])
		circle(Screwdriver_Diameter/2);

		translate([Center_Of_Plate+Bolt_Offset,3*Bottle_Diameter/2+3*Bottle_Surround/2,0])
		circle(Screwdriver_Diameter/2);


		//Base support notches

		translate([-(Bottle_Diameter/2+Bottle_Surround),Bottle_Diameter/2+Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

		translate([-(Bottle_Diameter/2+Bottle_Surround),3*Bottle_Diameter/2+3*Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);
	
		translate([(3*Bottle_Diameter/2+3*Bottle_Surround)-Material_Thickness,Bottle_Diameter/2+Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

		translate([(3*Bottle_Diameter/2+3*Bottle_Surround)-Material_Thickness,3*Bottle_Diameter/2+3*Bottle_Surround/2-Base_Support_Notch/2,0])
		square([Material_Thickness,Base_Support_Notch]);

	}
}


module Bolt_Hole(Degrees_Of_Rotation)
{
	//this part is centered on the bolt diameter
	rotate(a = Degrees_Of_Rotation)
	translate([-Bolt_Diameter/2,-(Bolt_Length-Material_Thickness),0])
	union()
	{
		square([Bolt_Diameter,Bolt_Length-Material_Thickness]);
		translate([-Nut_Width/2+Bolt_Diameter/2, 0])
		square([Nut_Width,Nut_Thickness]);
	}
}

module Stabilizer()
{
	difference()
	{
		union()
		{
			//main plate
			square([Stabilizer_Width,Plate_Spacing]);

			translate([0, Plate_Spacing/2,0])
			translate([-Material_Thickness, -Material_Thickness/2,0])
			square(Material_Thickness);

			translate([Stabilizer_Width, Plate_Spacing/2,0])
			translate([0, -Material_Thickness/2,0])
			square(Material_Thickness);

		}
		//Bolt profile holes
		translate([Stabilizer_Width/2+Bolt_Offset,Plate_Spacing,0])
		Bolt_Hole(0);

		translate([Stabilizer_Width/2-Bolt_Offset,Plate_Spacing,0])
		Bolt_Hole(0);

		translate([Stabilizer_Width/2+Bolt_Offset,0,0])
		Bolt_Hole(180);

		translate([Stabilizer_Width/2-Bolt_Offset,0,0])
		Bolt_Hole(180);

		//holes for Base support
		translate([0,Plate_Spacing/3,0])
		Bolt_Hole(90);

		translate([0,2*Plate_Spacing/3,0])
		Bolt_Hole(90);

		translate([Stabilizer_Width,Plate_Spacing/3,0])
		Bolt_Hole(270);

		translate([Stabilizer_Width,2*Plate_Spacing/3,0])
		Bolt_Hole(270);

	}
}

module Hand_Grab()
{
	difference()
	{
		union()
		{
			square([Handle_Width,Handle_Height-Fillet_Radius]);

			//round top corners
			translate([Fillet_Radius,Handle_Height-Fillet_Radius,0])
			circle(Fillet_Radius);
			translate([Handle_Width -Fillet_Radius,Handle_Height-Fillet_Radius,0])
			circle(Fillet_Radius);
			translate([Fillet_Radius,Handle_Height-Fillet_Radius])
			square([Handle_Width-2*Fillet_Radius,Fillet_Radius]);

			//base_plate alignment squares
			translate([Handle_Width/8,0,0])
			translate([-Material_Thickness/2, -Material_Thickness - Base_Support_Foot])
			square([Material_Thickness*2,Material_Thickness + Base_Support_Foot]);

			translate([3*Handle_Width/8,0,0])
			translate([-Material_Thickness/2, -Material_Thickness - Base_Support_Foot])
			square([Material_Thickness*2,Material_Thickness + Base_Support_Foot]);

			translate([5*Handle_Width/8,0,0])
			translate([-Material_Thickness/2, -Material_Thickness - Base_Support_Foot])
			square([Material_Thickness*2,Material_Thickness + Base_Support_Foot]);

			translate([7*Handle_Width/8,0,0])
			translate([-Material_Thickness/2, -Material_Thickness - Base_Support_Foot])
			square([Material_Thickness*2,Material_Thickness + Base_Support_Foot]);

		}

		//subtract handle grab area

		translate([Handle_Width/2+2*Finger_Radius/3,Handle_Height-Fillet_Radius,0])
		circle(Finger_Radius);

		translate([Handle_Width/2-2*Finger_Radius/3,Handle_Height-Fillet_Radius,0])
		circle(Finger_Radius);

		translate([Handle_Width/2+2*Finger_Radius,Handle_Height-Fillet_Radius,0])
		circle(Finger_Radius);

		translate([Handle_Width/2-2*Finger_Radius,Handle_Height-Fillet_Radius,0])
		circle(Finger_Radius);

		translate([Handle_Width/2-2*Finger_Radius, Handle_Height-Fillet_Radius-Finger_Radius])
		square([4*Finger_Radius,Finger_Radius]);

		//slots for horizontal pieces
		translate([Handle_Width/2-Material_Thickness/2-(Bottle_Diameter/2+Bottle_Surround/2),Label_Bottom])
		square([Material_Thickness,Plate_Spacing]);

		translate([Handle_Width/2-Material_Thickness/2+(Bottle_Diameter/2+Bottle_Surround/2),Label_Bottom])
		square([Material_Thickness,Plate_Spacing]);

		translate([Handle_Width/2,0])
		Bolt_Hole(180);

		translate([Handle_Width/4,0])
		Bolt_Hole(180);

		translate([3*Handle_Width/4,0])
		Bolt_Hole(180);

	}
}





translate([0,0,0])
Bottle_Aligner();

translate([8000,0,0])
Bottle_Aligner();

translate([0,10000,0])
Base_Plate();

translate([7000,8500,0])
Stabilizer();

translate([7000,13000,0])
Stabilizer();

translate([15000,8500,0])
Hand_Grab();

translate([14000,0,0])
Base_Support();

translate([15500,0,0])
Base_Support();

translate([18000,0,0])
Base_Support();

translate([20500,0,0])
Base_Support();
