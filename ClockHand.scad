echo(version=version() );

pi=3.141592654;

radiusLength = 1/30;

//color("red")
//    for(angle = [ 0 : 1 : 360 ])
//        translate([xPos(angle), yPos(angle), 0]) cube(0.8, center = true);

function xPos(angle) = cos(angle) * radiusLength * angle;

function yPos(angle)=sin(angle) * radiusLength * angle;

function startCoordinate(angle) = [xPos(angle),yPos(angle)];

function clockPoints(degreeCount) =[for(angle = [ 0 : 1 : degreeCount ]) startCoordinate(angle)];

points=clockPoints(360);

polygon (points);