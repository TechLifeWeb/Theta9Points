:: Theta9Points
:: Created by Scott Kingery
:: techlifeweb.com
:: -------------------------
:: This batch file assumes you have connected your Theta S to your computer and copied all the image files to 
:: the PHOTOPATH folder you specify below. It then will loop through all the jpg files in that folder and create 9 individual non-360 photos.
:: Thats is, one pointed a 0 degrees, and one each at 45, 90, 135, 180, 225, 270 and 315 and another pointed straight up. 
:: Thats why I called it 9 points.
:: Optionally, you can set it to also include 8 more images looking up at an angle you specify (default 25 degrees). Useful for places like cities.
:: Another option you can select is to include a set o 8 images looking down at an angle you specify.
:: I usuall go through and select the ones I want to keep. It is a nice way to take a quick photo with the Theta S and the have photos to share or even print.
:: Makes the camera useful beyond just 360-degree images.
:: The new file will have str added to the name. Example: R0010260.jpg becomes R0010260-str.jpg
:: The original file is moved to a folder called Processed that will be created if necessary under your PHOTOPATH folder
:: -----------------------
:: This batch file requires you first install the Hugin photo processing software for Windows
:: Download that software from here: http://hugin.sourceforge.net/download/
:: Also required is ExifTool by Phil Harvey. Hugin comes with ExifTool but I like to have the latest one from here:
:: http://owl.phy.queensu.ca/~phil/exiftool/
:: You MUST update the paths that are used on your system. See the notes below
:: ---------------------------
@echo off
SetLocal ENABLEDELAYEDEXPANSION
::Put the path to your hugin program here
set hughinpath=C:\Program Files (x86)\Hugin\bin

::Put the path to ExifTool here
set exiftoolpath=D:\OneDrive\Programs\ExifTool

::Put the path to the pictures you want to process here
set photopath=E:\Imported\360ToProcess

::By setting this value to yes (lower case) you will get an extra set of photos that orient the view up
set lookup=yes

::By setting this value to yes (lower case) you will get an extra set of photos that orient the view down
set lookdn=yes

::Set the angle amount you want to adjust up and\or down
set upangle=25
set dnangle=20

::No further edits needed
if not exist "%photopath%\9PointsOutput" md "%photopath%\9PointsOutput"
for  %%f in ("%photopath%\*.jpg") do (
	
	set image=%%f
	set filepath=%%~dpf
	set filename=%%~nf

	call :procimage
	if %lookup% == yes call :procupimage
	if %lookdn% == yes call :procdnimage
)

goto:eof

:procimage
"%hughinpath%\pto_gen" -o tempin.pto "%image%"

"%hughinpath%\pano_modify" --rotate=0,0,0 --fov=120x75  --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_000 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_000.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_000.jpg_original"

"%hughinpath%\pano_modify" --rotate=45,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_045 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_045.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_045.jpg_original"

"%hughinpath%\pano_modify" --rotate=90,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_090 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_090.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_090.jpg_original"

"%hughinpath%\pano_modify" --rotate=135,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_135 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_135.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_135.jpg_original"

"%hughinpath%\pano_modify" --rotate=180,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_180 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_180.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_180.jpg_original"

"%hughinpath%\pano_modify" --rotate=225,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_225 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_225.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_225.jpg_original"

"%hughinpath%\pano_modify" --rotate=270,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_270 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_270.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_270.jpg_original"

"%hughinpath%\pano_modify" --rotate=315,0,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_315 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_315.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_315.jpg_original"

"%hughinpath%\pano_modify" --rotate=0,-90,0 --fov=120x75  --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_00_up tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_00_up.jpg"
del /q "%filepath%\9PointsOutput\%filename%_00_up.jpg_original"

goto:eof

:procupimage
"%hughinpath%\pto_gen" -o tempin.pto "%image%"

"%hughinpath%\pano_modify" --rotate=0,-%upangle%,0 --fov=120x75  --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_000 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_000.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_000.jpg_original"

"%hughinpath%\pano_modify" --rotate=45,-%upangle%,-%upangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_045 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_045.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_045.jpg_original"

"%hughinpath%\pano_modify" --rotate=90,0,-%upangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_090 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_090.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_090.jpg_original"

"%hughinpath%\pano_modify" --rotate=135,%upangle%,-%upangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_135 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_135.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_135.jpg_original"

"%hughinpath%\pano_modify" --rotate=180,%upangle%,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_180 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_180.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_180.jpg_original"

"%hughinpath%\pano_modify" --rotate=225,%upangle%,%upangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_225 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_225.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_225.jpg_original"

"%hughinpath%\pano_modify" --rotate=270,0,%upangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_270 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_270.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_270.jpg_original"

"%hughinpath%\pano_modify" --rotate=315,-30,30 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_up_315 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_up_315.jpg"
del /q "%filepath%\9PointsOutput\%filename%_up_315.jpg_original"

goto:eof
:procdnimage
"%hughinpath%\pto_gen" -o tempin.pto "%image%"

"%hughinpath%\pano_modify" --rotate=0,%dnangle%,0 --fov=120x75  --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_000 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_000.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_000.jpg_original"

"%hughinpath%\pano_modify" --rotate=45,%dnangle%,%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_045 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_045.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_045.jpg_original"

"%hughinpath%\pano_modify" --rotate=90,0,%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_090 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_090.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_090.jpg_original"

"%hughinpath%\pano_modify" --rotate=135,-%dnangle%,%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_135 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_135.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_135.jpg_original"

"%hughinpath%\pano_modify" --rotate=180,-%dnangle%,0 --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_180 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_180.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_180.jpg_original"

"%hughinpath%\pano_modify" --rotate=225,-%dnangle%,-%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_225 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_225.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_225.jpg_original"

"%hughinpath%\pano_modify" --rotate=270,0,-%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_270 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_270.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_270.jpg_original"

"%hughinpath%\pano_modify" --rotate=315,%dnangle%,-%dnangle% --fov=120x75 --canvas=AUTO --crop=AUTO -o tempout.pto tempin.pto
"%hughinpath%\nona" -m JPEG -o %filepath%\9PointsOutput\%filename%_dn_315 tempout.pto
"%exiftoolpath%\exiftool" -TagsFromFile "%image%" -FileModifyDate -ModifyDate -DateTimeOriginal -CreateDate "%filepath%\9PointsOutput\%filename%_dn_315.jpg"
del /q "%filepath%\9PointsOutput\%filename%_dn_315.jpg_original"

goto:eof

:eof
del /q "%filepath%\tempin.pto"
del /q "%filepath%\tempout.pto"