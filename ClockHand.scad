echo(version=version() );

                        // All units are millimetres
height = 1.5;           // The thickness of the clock hand
stepCount = 2;
radiusLength = 120 * 2; // The maximum length of the clock hand at 360 degrees
centreRadius =  25/2;    // The radius of the centre disk
holeRadius = 2.3;       // The radius of the hole in the centre of the centre disk
width=4.5;              // The width of the clock hand
degreeCount=225;
function xPos(angle, centreRadius, offset) = 
    
    (cos(angle) * ((radiusLength * angle / 360) ) //+ centreRadius) 
     + (sin(90-angle) * offset));

function yPos(angle, centreRadius, offset) = 
    (sin(angle) * ((radiusLength * angle / 360) )// + centreRadius) 
    + (cos(90-angle) * offset));

function startCoordinate(angle, centreRadius, offset) = [xPos(angle, centreRadius, offset),yPos(angle, centreRadius, offset)];

function clockPoints(holeRadius, centreRadius, width, degreeCount) =
   concat([ for (angle = [ 0 : stepCount : degreeCount ]) 
       startCoordinate(angle, centreRadius, width / 10) ],       
   [ for (angle = [ degreeCount : -1 * stepCount : 0]) 
       startCoordinate(angle, centreRadius,   width / -10) ]);
    
points = clockPoints(holeRadius, centreRadius, width,degreeCount);

difference(){
    union() {
    cylinder(height,centreRadius,centreRadius);
    
    linear_extrude(height,true)  
        offset(r=1)
            polygon (points);
    };
    translate([0,0,-1])
        cylinder(10,holeRadius,holeRadius);
}
   
   echo(points);
