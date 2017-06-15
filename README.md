# Theta9Points

This batch file assumes you have connected your Theta S to your computer and copied all the image files to 
the PHOTOPATH folder you specify in the batch file. It then will loop through all the jpg files in that folder and create 9 individual non-360 photos.
That is, one pointed a 0 degrees, and one each at 45, 90, 135, 180, 225, 270 and 315 and another pointed straight up. 

That's why I called it 9 points.

Optionally, you can set it to also include 8 more images looking up at an angle you specify (default 25 degrees). Useful for places like cities.

Another option you can select is to include a set o 8 images looking down at an angle you specify (default 20 degrees).

I usually go through and select the ones I want to keep. It is a nice way to take a quick photo with the Theta S and the have photos to share or even print.
Makes the camera useful beyond just 360-degree images.

The new file will have 00_degreenumber added to the name. Example: R0010260.jpg becomes R0010260-00_000.jpg,R0010260-00_045.jpg, etc
The output files will be put in a sub folder called 9PointsOutput

This batch file requires you first install the Hugin photo processing software for Windows
Download that software from here: http://hugin.sourceforge.net/download/
Also required is ExifTool by Phil Harvey. Hugin comes with ExifTool but I like to have the latest one from here:
http://owl.phy.queensu.ca/~phil/exiftool/
You MUST update the paths that are used on your system. See the notes in the batch file.

Examples of this technique can be found there: https://goo.gl/photos/3PBXqkzssy9s5jxJ7
