echo off
title Running Dropbox to joddumps source copy ...
pushd
setlocal

rem copy from the proper directory
if exist "c:\db\Dropbox\joddumps\*.ijs" set dbpath=c:\jod\j701\joddumps\
if "%dbpath%" == "" goto Exception01

rem copy source files
c:
cd \db\Dropbox\joddumps
copy /y *.ijs %dbpath%
copy /y *.bat %dbpath%
copy .gitignore %dbpath%

title Dropbox to joddumps complete!
goto TheEnd

:Exception01
echo ERROR: not in Dropbox joddumps directory - nothing copied!
title Dropbox to joddumps abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause