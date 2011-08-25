rem copies dud source files to ubuntu one synchronized directory
echo off
title Exporting J source ...
pushd
setlocal

set jdir=c:\jod\j701\joddumps\

rem synch directories are on different paths on various machines
set pipdocs="c:\Documents and Settings\jdbaker\My Documents\Ubuntu One\joddumps\"
if exist %pipdocs%*.ijs goto CopySource
set pipdocs="c:\Documents and Settings\Administrator\My Documents\Ubuntu One\joddumps\"
if exist %pipdocs%*.ijs goto CopySource
goto Exception01

:CopySource
copy /y %jdir%*.ijs %pipdocs%
copy /y %jdir%*.bat %pipdocs%
copy /y %jdir%*.sh  %pipdocs%
title J source export complete!
goto TheEnd

:Exception01
echo ERROR: pipdocs Ubuntu One directory not found!
title J source export abended!
goto TheEnd

:TheEnd
endlocal
popd
pause