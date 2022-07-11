# owltab_extension
Scalable extension for [Owltab](https://owltab.com) tablet holder

## WHY?
Our ipad pro was not easily adjustable/ mountable with the owltab tablet holder.
Reason is the rubber around our ipad pro case from logitech.
Additionally the cords of the owltab holder did cover parts of the touchscreen.
Goal was create an extension to the owltab holder which is more easily movable and allows
simple retraction of the ipad.
Note: You can find the original scad file in the corresponding subdirectory, which will allow fast and simple 
adaption to any tablet.

## Example with ipad pro 11"

<p float="left">
  <img src="https://github.com/SteffMUC/owltab_extension/blob/main/pics/owltab_extension_back.jpeg" alt="Back" width="200"/>
  <img src="https://github.com/SteffMUC/owltab_extension/blob/main/pics/owltab_extension_front.jpeg" alt="Front" width="200"/>
</p>

## Assembly instructions for large volume 3d printers

* Print stl in subdirectory <stl_full_print>
* Can be printed without support

## Assembly instructions for Ender3

* Since the print volume for Ender3 is not large enough, it is possible to "break" up the extension into two parts which 
  can be reconnected with a connector and appropriate screws
* Print stl in subdirectory <stl_ender3>
* Can be printed without support
* Potentially you have to turn the connector stl by 45° in z-axis in order to fit it to Ender3 in Cura
* Octopi issues a warning before print, at least for my Ender3 i was able to print without problems

## Links
* [Owltab](https://owltab.com) tablet holder, really genious product.
* [Logitech ipad Pro Case](https://smile.amazon.de/Logitech-Tastatur-Trackpad-Connector-Modell/dp/B07W7LBV84/ref=sr_1_3?keywords=logitech+ipad+pro+11+tastatur&qid=1657569448&sprefix=logitech+iPad+pro%2Caps%2C110&sr=8-3)
* The scad design uses [mx-screws](https://github.com/GillesBouissac/agentscad)

##TODO
* Include hooks at the back of the extension to mount the cords of the owltab holder.
