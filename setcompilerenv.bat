@if not defined _echo echo off

if defined VCINSTALLDIR (
  echo Info: VCINSTALLDIR is set, so compiler env was setup already
  exit /b 0
)
setlocal enableDelayedExpansion

if "%~1" == "" (
  set "VSCMD=-arch=x64 -host_arch=x64"
)

set rlocalp=Microsoft Visual Studio\Installer\vswhere.exe
echo "%ProgramFiles(x86)%\!rlocalp!" 
if exist "%ProgramFiles(x86)%\!rlocalp!" (
  set vswbin="%ProgramFiles(x86)%\!rlocalp!" 
) else if exist "%ProgramFiles%\!rlocalp!" (
  set vswbin="%ProgramFiles%\!rlocalp!"
) else (
 echo "Error: cannot find vswhere.exe"
)
endlocal&set "vswbin=%vswbin%"&set "VSCMD=%VSCMD%

 
for /f "usebackq delims=" %%i in (`%vswbin% -prerelease -latest -property installationPath`) do (
  if exist "%%i\Common7\Tools\vsdevcmd.bat" (
    call "%%i\Common7\Tools\vsdevcmd.bat" %* %VSCMD%
    exit /b 0
  )
)

echo  "No Compiler installation found with vswhere"
exit /b 2