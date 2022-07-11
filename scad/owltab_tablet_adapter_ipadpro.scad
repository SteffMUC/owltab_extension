/*Copyright (c) <2022> <https://github.com/SteffMUC>
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE
*/

// following values match an ipad pro 11" with logitech case
// can be adapted to your tablet/ tablet case easily
width_tablet=254;
height_tablet=184;
thickness_tablet=13;
radius_tablet=8;
overlap=8;
side_extension=5;
camera=20;

$fn=100;

// screws are taken from here
// https://github.com/GillesBouissac/agentscad
// please observe instructions there for re-generation in openscad
use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>

// instructions below, please simply uncomment the respective line(s) starting with target
// if your 3d printer volume allows it, you can directly print with complete
// in this case the halves and connector are not necessary
target = "complete";

// if your 3d printer volume is too small, e.g. for ender3, you need to print the halves plus connector separately, additionally the screws are necessary, which are supplied in a separate scad file
//target = "halves_for_ender3";
//target = "connector";

if (target=="halves_for_ender3"){
    translate([-width_tablet/2+-4,thickness_tablet+25,0])rotate([90,0,0]) owltab_with_holes("right");
    translate([0,0,0])rotate([90,0,0]) owltab_with_holes("left");
}

if (target=="complete"){
    translate([0,0,0])rotate([90,0,0]) owltab_with_holes();
}

if (target=="connector"){
    owltab_connector();
}

module owltab_connector() {
  difference() {
    rotate([90,0,0])translate([3*side_extension+14,0,-thickness_tablet]) cube([width_tablet-4*side_extension,height_tablet,thickness_tablet]);
    
    rotate([90,0,0])translate([7*side_extension+14,height_tablet/2+10,-thickness_tablet])cylinder(h=thickness_tablet, r=width_tablet/4, $fn=3);
      
    rotate([90,90,0])translate([-height_tablet,width_tablet/2+14,-thickness_tablet])cylinder(h=thickness_tablet, r=width_tablet/4, $fn=3);
    
    rotate([90,180,0])translate([-width_tablet+14,-height_tablet/2-10,-thickness_tablet])cylinder(h=thickness_tablet, r=width_tablet/4, $fn=3);
      
    rotate([90,-90,0])translate([10,-width_tablet/2-14,-thickness_tablet])cylinder(h=thickness_tablet, r=width_tablet/4, $fn=3);
      
    //holes for screws
    #rotate([90,0,0])translate([width_tablet/4+14+side_extension,height_tablet/4+6,-30])cylinder(h=100, r=6);
      
    #rotate([90,0,0])translate([3*width_tablet/4+14+side_extension,height_tablet/4+6,-30])cylinder(h=100, r=6);
    
    #rotate([90,0,0])translate([width_tablet/4+14+side_extension,3*height_tablet/4+6,-30])cylinder(h=100, r=6);
      
    #rotate([90,0,0])translate([3*width_tablet/4+14+side_extension,3*height_tablet/4+6,-30])cylinder(h=100, r=6);
      
    //small holes for nuts
    #rotate([90,0,0])translate([width_tablet/4+14+side_extension,height_tablet/4+6,-4])cylinder(h=4, r=16);
      
    #rotate([90,0,0])translate([3*width_tablet/4+14+side_extension,height_tablet/4+6,-4])cylinder(h=4, r=16);
    
    #rotate([90,0,0])translate([width_tablet/4+14+side_extension,3*height_tablet/4+6,-4])cylinder(h=4, r=16);
      
    #rotate([90,0,0])translate([3*width_tablet/4+14+side_extension,3*height_tablet/4+6,-4])cylinder(h=4, r=16);
      
  }
}

module owltab_with_holes(part) {
difference() {
    translate([14,0,0])owltab();
    
    
    //left 
    if (part=="left"){
    translate([width_tablet/2+14,-5,-20])cube([width_tablet+10,height_tablet+20,thickness_tablet+30]);
    }
    //right
    if (part=="right"){ 
    translate([-width_tablet/2+14-10,-5,-20])cube([width_tablet+10,height_tablet+20,thickness_tablet+30]);
    }
        
    //holes for nuts
    translate([width_tablet/4+14,height_tablet/4,-10])cube(size = [12,12,thickness_tablet+30], center = false);
    translate([3*width_tablet/4+14,height_tablet/4,-10])cube(size = [12,12,thickness_tablet+30], center = false);
    translate([width_tablet/4+14,3*height_tablet/4,-10])cube(size = [12,12,thickness_tablet+30], center = false);
    translate([3*width_tablet/4+14,3*height_tablet/4,-10])cube(size = [12,12,thickness_tablet+30], center = false);
    
    }


if (part!="right")rotate([0,0,0]) translate( [width_tablet/4+20,height_tablet/4+6,-1.5]) mxNutSquareThreaded(M10(25));
if (part!="left")rotate([0,0,0]) translate( [3*width_tablet/4+20,height_tablet/4+6,-1.5]) mxNutSquareThreaded(M10(25));
if (part!="right")rotate([0,0,0]) translate( [width_tablet/4+20,3*height_tablet/4+6,-1.5]) mxNutSquareThreaded(M10(25));
if (part!="left")rotate([0,0,0]) translate( [3*width_tablet/4+20,3*height_tablet/4+6,-1.5]) mxNutSquareThreaded(M10(25));
    
}

module owltab() {
difference() {
    // create front
    translate([0,0,0]) roundedcube(width_tablet+2*side_extension,height_tablet+5,thickness_tablet+8,radius_tablet);
    // cut out tablet, keep open to top
    translate([side_extension,side_extension,5]) roundedcube(width_tablet,height_tablet+10,thickness_tablet,radius_tablet);
    // cut out display with small border, specified as overlap
    translate([side_extension+overlap,side_extension+overlap,thickness_tablet]) roundedcube(width_tablet-overlap*2,height_tablet,thickness_tablet+1,radius_tablet);
    // cut out camera
    translate([side_extension,height_tablet/2-camera/2,thickness_tablet]) roundedcube(camera,camera,thickness_tablet+1,radius_tablet);
    // cut out power button + loudness buttons
    translate([0,height_tablet-camera*2+6,5]) roundedcube(camera*2,camera*2,thickness_tablet+8,radius_tablet);
    
}
difference() {
    // create back
    translate([0,0,-thickness_tablet]) roundedcube(width_tablet+2*side_extension,height_tablet+5,thickness_tablet,radius_tablet);
    // cut out cube from back
    translate([3*side_extension,-5,-thickness_tablet-1]) cube([width_tablet-4*side_extension,height_tablet+10,thickness_tablet+1]);
}


//left handle
rotate([0,90,0])translate([-10,6,-6]) roundedcube(2*thickness_tablet-4,height_tablet-2*6,6,6);

rotate([0,90,0])translate([-14,0,-12]) roundedcube(2*thickness_tablet+4,height_tablet,6,6);

//right handle
rotate([0,90,0])translate([-10,6,width_tablet+2*side_extension]) roundedcube(2*thickness_tablet-4,height_tablet-2*6,6,6);

rotate([0,90,0])translate([-14,0,width_tablet+2*side_extension+6]) roundedcube(2*thickness_tablet+4,height_tablet,6,6);
}

module roundedcube(xx, yy, height, radius) {

difference(){

    cube([xx,yy,height]);

    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
    translate([xx,0,0])
    rotate(90)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([xx,yy,0])
    rotate(180)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }

    translate([0,yy,0])
    rotate(270)
    difference(){
        translate([-.5,-.5,-.2])
        cube([radius+.5,radius+.5,height+.5]);

        translate([radius,radius,height/2])
        cylinder(height,radius,radius,true);
    }
}
}