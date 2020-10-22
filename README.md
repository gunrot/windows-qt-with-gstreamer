# How to use Qt in Windows with gstreamer, especially to display rtsp streams
This repository contains scripts, simple sample programs and documentation to build qtmultimedia support with gstreamer on windows 10 and Visual Studio 2017/19.
Additonally a simple test program is provided , which shows an publicly available(at the time of this writing)  rtsp stream inside a qml application.

Note that I only did this for the 64 bit version of Qt and gstreamer on Windows 10.

## Prerequisite

1. Install Visual Studio 2017 or 2019 (recommended). Community version is sufficient.
2. Install Qt for windows >= 5.13 (my tests were made with Qt 5.15.0) for your Visual Studio  version
3. Install gstreamer-1.0 packages for windows and msvc.
  *  https://gstreamer.freedesktop.org/data/pkg/windows/1.18.0/msvc/gstreamer-1.0-msvc-x86_64-1.18.0.msi	
  *  https://gstreamer.freedesktop.org/data/pkg/windows/1.18.0/msvc/gstreamer-1.0-devel-msvc-x86_64-1.18.0.msi

Note that Windows 10 will probably block the installation, as the msi is unsigned.
Click on the More info link in the warning box, which appears and press the appearing Run Anyway Button.
See also https://www.youtube.com/watch?v=_JZNCypATOY

## Build QtMultimedia with gstreamer support.

1. Open a command shell
2. clone this repository
3. cd into the repository directory
4. clone the qtmultimedia repository
  * ```` git clone http://code.qt.io/qt/qtmultimedia.git ````
  * ```` cd qtmultimedia````
  * ```` git checkout <version> ````  *\<version\>*  should match the qt version tag, you have installed, e.g. v5.15.1
  * ```` cd .. ```` 
  
5. execute ````bld_qtmultimedia.bat <qt_install_dir> [<installdir>]}```` ( you can give an alternative install directory as second parameter without the volume, for example ````bld_qtmultimedia.bat C:\Qt\5.15.0 \Users\<myuser>\qtmultimedia```` to get a add-on installation, which you can copy onto other Qt installations of the same type and version ) 

## Build and run a video test application using rtsp url.

1. execute ````setupqtbldenv.bat c:\Qt\5.15.1```` or where you have qt installed. (You can also give the full path to the qt bin directory as parameter)
2. ````cd videotst````
2. ````qmake````
2. ````jom```` or ````nmake````
2. ````release\videotst```` 

Now the rtsp stream rtsp://170.93.143.139/rtplive/470011e600ef003a004ee33696235daa showing a highway will be displayed.


### Bonus: creating your own rtsp stream from your notebook webcam

1. download and unzip http://www.happytimesoft.com/downloads/happytime-rtsp-server-x64.zip
2. start rtspserver.exe in the unzipped directory
3. copy the url shown below "stream from camera device." in the appearing dos box.
4. I had to add 1 to the end of the url (making it videodevice1), when setting it as source property in the Video element in main.qml.
5. After a rebuild with nmake or jom, start ````release\videotst```` and you will hopefully see yourself ;-).
