@if not defined _echo echo off

if "%~1" == "" (
  echo Need path to qt installation as parameter, either root as c:\Qt\5.15.0 or dir as in c:\Qt\5.15.0\msvcyyyy_64
  exit /b 1
)
set QTDIR=%1


call %~dp0setcompilerenv.bat -arch=x64 -host_arch=x64
if not defined GSTREAMER_1_0_ROOT_X86_64 (
 echo gstreamer 1.0 64 bit is not installed.
 echo Download the following packages and install them.
 echo https://gstreamer.freedesktop.org/data/pkg/windows/1.16.2/gstreamer-1.0-msvc-x86_64-1.16.2.msi
 echo https://gstreamer.freedesktop.org/data/pkg/windows/1.16.2/gstreamer-1.0-devel-msvc-x86_64-1.16.2.msi
 exit /b 1
)
set gstbin=%GSTREAMER_1_0_ROOT_X86_64%\bin
echo %path%|find /i "%gstbin:"=%">nul  || set path=%gstbin%;%path%


call :getvsyear

echo VSYEAR=%VSYEAR%

echo Trying %QTDIR%
if not exist %QTDIR%\bin (
  if exist %QTDIR%\msvc%VSYEAR%_64\bin (
   set QTDIR=%QTDIR%\msvc%VSYEAR%_64\bin
  ) else (
    echo Error: cannot find Qt using %1 parameter, lookign for %QTDIR%\msvc%VSYEAR%_64\bin
	exit /b 1
  )
) else (
  set QTDIR=%QTDIR%\bin
)

echo Using QTDIR=%QTDIR%

echo %path%|find /i "%QTDIR:"=%">nul  || set path=%QTDIR%;%path%

set QTC_PATH=%QTDIR%\..\..\..\Tools\QtCreator\bin

if exist %QTC_PATH% (
   for %%i in ("%QTC_PATH%") do SET "QTC_PATH=%%~fi"
)
setlocal enableDelayedExpansion
if defined QTC_PATH (
  echo Info: adding qtcreator to PATH
  echo !path!|find /i "%QTC_PATH:"=%">nul  || set path=!QTC_PATH!;!path!
)
endlocal&set "PATH=%PATH%"

exit /b 0

:getvsyear
setlocal enableDelayedExpansion
set VCINST=%VCINSTALLDIR:\= %
set VCINST=%VCINST:(= %
set VCINST=%VCINST:)= %
set VCINST=%VCINST::= %

for %%x in (!VCINST!) do (
 echo %%x|findstr /r ^[0-9][0-9][0-9][0-9]$ >nul
 if not defined Y (
   if !ERRORLEVEL! EQU 0 ( 
     set Y=%%x
   )
 )
)
endlocal & set "VSYEAR=%Y%"
exit /b 0


