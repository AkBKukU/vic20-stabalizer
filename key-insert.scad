// Mounting Stem Size (mm)
stemSize = 4.5;

// Mounting Stem Thickness (mm)
stemThick = 1.1;

// Mounting Stem Depth (mm)
stemDepth = 4.5;

// Base Height
baseHeight = 6.4;

// Base Width
baseWidth = 6.7;

// Base Offset
baseOffset = -1;

// Loop Heght
loopHeight = 4;

// loop Length
loopLength = 5.2;

// Loop Slot Height
loopSlotHeight = 2;

// loop Length
loopSlotLength = 2.7;

// Endstop Length
endstopLength = 2.9;

// Endstop Height
endstopHeight = 3;

// Loop Angle (degrees)
loopAngle = -11;


module mountStem()
{
	translate([0,0,-stemDepth/2]) union()
	{
		cube([stemSize,stemThick,stemDepth],true);
		cube([stemThick,stemSize,stemDepth],true);
	};
};

module loop()
{	
	difference ()
	{
		translate([-stemSize/2,-stemSize/2+baseOffset,0]) rotate([loopAngle,0,0] )union()
		{
			cube([stemSize,baseWidth,baseHeight]); // Base
			translate([0,baseWidth,(baseHeight-loopHeight)]) difference () // Loop
			{	
				cube([stemSize,loopLength, loopHeight]);
				translate([-stemSize/2, (loopLength-loopSlotLength)/2, (loopHeight-loopSlotHeight)/2])
					cube([stemSize*2,loopSlotLength,loopSlotHeight]);
			}
			translate([0,0,baseHeight]) cube([stemSize, endstopLength, endstopHeight]); // Endstop
		};
	
		mirror([0,0,1]) translate([(stemSize+baseWidth)/-2,(stemSize+baseWidth)/-2,0]) cube((stemSize+baseWidth*2));
	}
};





loop();
mountStem();
