/*
 * Noir Case
 * Copyright (c) 2022 Lone Dynamics Corporation. All rights reserved.
 *
 * required hardware:
 *  - 4 x M3 x 18mm countersunk bolts
 *  - 4 x M3 nuts
 *
 */

$fn = 100;

board_width = 50;
board_thickness = 1.5;
board_length = 70;
board_height = 1.6;
board_spacing = 2;

wall = 1.5;

top_height = 10;
bottom_height = 8.5;

mdn_board();

translate([0,0,15])
	mdn_case_top();

translate([0,0,-15])
	mdn_case_bottom();

module mdn_board() {
	
	difference() {
		color([0,0.5,0])
			roundedcube(board_width,board_length,board_thickness,3);
		translate([5, 5, -1]) cylinder(d=3.2, h=10);
		translate([5, 65, -1]) cylinder(d=3.2, h=10);
		translate([45, 5, -1]) cylinder(d=3.2, h=10);
		translate([45, 65, -1]) cylinder(d=3.2, h=10);
	}	
	
}

module mdn_case_top() {
	
	difference() {
				
		color([0.5,0.5,0.5])
			roundedcube(board_width+(wall*2),board_length+(wall*2),top_height,2.5);

		// cutouts
			
		translate([2,9.5,-2])
			roundedcube(board_width-1.25,board_length-16,10.25,2.5);

		translate([9.5,3,-2])
			roundedcube(board_width-16,board_length-3,10.25,2.5);
		
		// led vent
		translate([-1,board_length-59,3.5])
			cube([board_width-10,1.5,1.5]);
	
		translate([wall, wall, 0]) {

			// vents
			translate([50/2-(20/2),60,0]) cube([20,1,20]);
			translate([50/2-(20/2),55,0]) cube([20,1,20]);
			translate([50/2-(20/2),50,0]) cube([20,1,20]);
			
			// HDMI
			translate([30,19.55-(15.5/2),-1]) cube([30,15.5,6.2+1]);
		
			// USBA
			translate([25-(15/2),-5,-1]) cube([15,30,7.2+1]);

			// USBC
			translate([30,53.8-(9.5/2),-1]) cube([30,9.5,3.5+1]);
		
			// SD
			translate([-5,25.3-(15/2),-1]) cube([30,15,2+1]);

			// USBA
			translate([36.5-(6.2/2),65,-1]) cube([6.2,30,5+1]);
			
			// bolt holes
			translate([5, 5, -21]) cylinder(d=3.5, h=40);
			translate([5, 65, -21]) cylinder(d=3.5, h=40);
			translate([45, 5, -20]) cylinder(d=3.5, h=40);
			translate([45, 65, -21]) cylinder(d=3.5, h=40);

			// flush mount bolt holes
			translate([5, 5, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([5, 65, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([45, 5, top_height-1.5]) cylinder(d=5.25, h=4);
			translate([45, 65, top_height-1.5]) cylinder(d=5.25, h=4);

			// noir text
			rotate(270)
				translate([-22.5,25-3,top_height-0.5])
					linear_extrude(1)
						text("N   O   I   R", size=5, halign="center",
							font="Ubuntu:style=Bold");

		}
		
	}	
}

module mdn_case_bottom() {
	
	difference() {
		color([0.5,0.5,0.5])
			roundedcube(board_width+(wall*2),board_length+(wall*2),bottom_height,2.5);
		
		// cutouts
		translate([3,10,1.5])
			roundedcube(board_width-3,board_length-17,10,2.5);
				
		translate([10.5,2.5,1.5])
			roundedcube(board_width-17.5,board_length-2,10,2.5);

		translate([wall, wall, 0]) {
			
		// board cutout
		translate([0,0,bottom_height-board_height])
			roundedcube(board_width+0.2,board_length+0.2,board_height+1,2.5);

		translate([wall, wall, 0]) {

			// USBC
			translate([38.5,53.8-(9.5/2),5]) cube([10,9.5,10.5+1]);
			
		}

		// bolt holes
		translate([5, 5, -11]) cylinder(d=3.2, h=25);
		translate([5, 65, -11]) cylinder(d=3.2, h=25);
		translate([45, 5, -11]) cylinder(d=3.2, h=25);
		translate([45, 65, -11]) cylinder(d=3.2, h=25);

		// nut holes
		translate([5, 5, -1]) cylinder(d=7, h=4, $fn=6);
		translate([5, 65, -1]) cylinder(d=7, h=4, $fn=6);
		translate([45, 5, -1]) cylinder(d=7, h=4, $fn=6);
		translate([45, 65, -1]) cylinder(d=7, h=4, $fn=6);

		}
		
	}	
}

// https://gist.github.com/tinkerology/ae257c5340a33ee2f149ff3ae97d9826
module roundedcube(xx, yy, height, radius)
{
    translate([0,0,height/2])
    hull()
    {
        translate([radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,radius,0])
        cylinder(height,radius,radius,true);

        translate([xx-radius,yy-radius,0])
        cylinder(height,radius,radius,true);

        translate([radius,yy-radius,0])
        cylinder(height,radius,radius,true);
    }
}
