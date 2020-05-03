@echo off
setlocal enableDelayedExpansion
if not defined GSTREAMER_1_0_ROOT_X86_64 (
  echo Error:GSTREAMER_1_0_ROOT_X86_64 is not set.
  exit /b 1
)
set gstbin=%GSTREAMER_1_0_ROOT_X86_64%\bin
@if not defined _echo echo off


FOR /F "tokens=* USEBACKQ" %%F IN (`where jom`) DO (
  SET MAKECMD=%%F
)
if not defined MAKECMD set "MAKECMD=nmake"

echo %path%|find /i "%gstbin:"=%">nul  || set path=%gstbin%;%path%
SETLOCAL EnableDelayedExpansion
call %~dp0setupqtbldenv.bat
pushd %~dp0\qtmultimedia
set INCLUDE=%GSTREAMER_1_0_ROOT_X86_64%\include\gstreamer-1.0;%GSTREAMER_1_0_ROOT_X86_64%\include;%GSTREAMER_1_0_ROOT_X86_64%\include\glib-2.0;%GSTREAMER_1_0_ROOT_X86_64%\lib\glib-2.0\include;%INCLUDE%
set LIB=%GSTREAMER_1_0_ROOT_X86_64%\lib;%LIB%
echo "INCLUDE=%INCLUDE%"
ECHO "LIB=%LIB%
qmake 
call %MAKECMD%
set INSTALL_ROOT=%1
nmake install
popd


exit /b 0


