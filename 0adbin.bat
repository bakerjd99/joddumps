echo off
title Running joddumps to Dropbox source copy ...
pushd
setlocal

rem copy from the proper directory
set dbdir=C:\jod\j701\joddumps
if "%CD%" == "%dbdir%" goto TestFiles
  echo ERROR: not in proper directory %CD%
  goto Exception01
:TestFiles
if exist "%dbdir%\*.ijs" set  dbpath=c:\db\Dropbox\joddumps\
if "%dbpath%" == "" goto Exception01

rem copy source files
copy /y *.ijs %dbpath%
copy /y *.bat %dbpath%
copy .gitignore %dbpath%

title joddumps to Dropbox complete!
goto TheEnd

:Exception01
echo ERROR: no joddumps source or wrong directory - nothing copied!
title joddumps to Dropbox abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause