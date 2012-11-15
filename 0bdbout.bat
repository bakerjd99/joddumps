echo off
title Running Dropbox to joddumps source copy ...
pushd
setlocal

rem copy from the proper directory
set dbdir=C:\db\Dropbox\joddumps
if "%CD%" == "%dbdir%" goto TestFiles
  echo ERROR: not in proper directory %CD%
  goto Exception01
:TestFiles
if exist "%dbdir%\*.ijs" set dbpath=c:\jod\j701\joddumps\
if "%dbpath%" == "" goto Exception01

rem copy source files
copy /y *.ijs %dbpath%
copy /y *.bat %dbpath%
copy .gitignore %dbpath%

title Dropbox to joddumps complete!
goto TheEnd

:Exception01
echo ERROR: no Dropbox joddumps source or wrong directory - nothing copied!
title Dropbox to joddumps abended!
pause
goto TheEnd

:TheEnd
endlocal
popd
rem pause