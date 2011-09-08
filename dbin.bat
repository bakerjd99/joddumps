echo off
title Running joddumps to Dropbox source copy ...
pushd
setlocal

rem copy from the proper directory
if exist "c:\jod\j701\joddumps\*.ijs" set dbpath=c:\db\Dropbox\joddumps\
if "%dbpath%" == "" goto Exception01

rem copy source files
c:
cd \jod\j701\joddumps
copy /y *.ijs %dbpath%
copy /y *.bat %dbpath%
copy .gitignore %dbpath%

title joddumps to Dropbox complete!
goto TheEnd

:Exception01
echo ERROR: not in joddumps directory - nothing copied!
title joddumps to Dropbox abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause