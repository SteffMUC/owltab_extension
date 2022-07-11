// screws are taken from here
// https://github.com/GillesBouissac/agentscad
// please observe instructions there for re-generation in openscad

use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>


use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>


// M6 bolt with 10mm thread length
$fn=50;
screw  = M10(17);

#mxBoltHexagonalThreaded(screw,10);
translate([20,0,0]) mxBoltHexagonalThreaded(screw,10);
translate([20,20,0]) mxBoltHexagonalThreaded(screw,10);
translate([0,20,0]) mxBoltHexagonalThreaded(screw,10);
