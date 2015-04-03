# itunes-convert
iTunes Convert and Export plug-in

Installation:

Installing the iTunes Script
1. Go to Finder
2. Click on Go at the top
3. Click on Go to folder
4. Type in ~/Library/iTunes/Scripts and click Go.  If you don't have a Scripts directory,
	go to ~/Library/iTunes and create a folder called Scripts.
5. Copy the "Covert and Export" script to the Scripts folder.

Installing kid3
1. Go to the folder where you unpacked the zip file.
2. Double-click on the kid3 DMG file.
3. Drag the kid3 application to the Applications folder in the window.
4. Close the window and unmount the DMG file (drag to the trash)

To access the script, select the file(s) in iTunes that you want to export and click
on the script icon (looks like an S) at the top and select "Covert and Export".
You will be prompted with a series of questions about your export.  If you do not select
any files, you will be told that files are not selected and it will quit.

To close the exporter at any time, hit the Cancel button.  To stop the process once it
has started, you will need to Force-Quit the AppleScript icon in the dock at the bottom.
This can be a bit challenging.

During the export, your sound will be muted in case any conversions take place.  A
conversion operation creates a 'ding' that cannot be stopped within iTunes.  Upon
successful completion of the script, your sound will be un-muted.