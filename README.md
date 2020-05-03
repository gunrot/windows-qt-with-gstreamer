# How to use Qt in Windows with gstreamer
This repository contains scripts and documentation to build qtmultimedia support with gstreamer on windows 10 and Visual Studio 2017/19

Note that I only did this for the 64 bit version of Qt and gstreamer on 64 bitWindows 10.

## Prerequisite

1. Install Visual Studio 2017 or 2019 (recommended). Community version is sufficient.
2. Install Qt for windows >= 5.13 (my tests were made with Qt 5.15.0 beta4) for your Visual Studio  version
3. Install gstreamer-1.0 packages for windows and msvc.
  *  https://gstreamer.freedesktop.org/data/pkg/windows/1.16.2/gstreamer-1.0-msvc-x86_64-1.16.2.msi
  *  https://gstreamer.freedesktop.org/data/pkg/windows/1.16.2/gstreamer-1.0-devel-msvc-x86_64-1.16.2.msi

Note that Windows 10 will probably block the installation, as the msi is unsigned.
Click on the More info link in the warning box, which appears and press the appearing Run Anyway Button.
See also https://www.youtube.com/watch?v=_JZNCypATOY

## Build QtMultimedia with gstreamer support.

1. Open a command shell
2. clone this repository
3. cd into the repository directory
4. clone the qtmultimedia repository
  * ```` git clone http://code.qt.io/qt/qtmultimedia.git ````
  * ```` git checkout <version> ````  *\<version\>*  should match the qt version, you have installed.
5. execute ````bld_qtmultimedia.bat```` ( you could give an alternative install directory as parameter without the volume, for example ````bld_qtmultimedia.bat \Users\<myuser>\qtmultimedia```` to get a add-on installtion, which you can copy onto other Qt installations of the same type and version ) 

## Build and run a video test application using rtsp url.



