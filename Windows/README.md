# How to Build FFmepg on Windows using Visual Studio 2017
Instructions for building FFmpeg as shared libraries (dlls) on Windows using Visual Studio 2017.

## Prerequisites and First Time Setup Instructions

### Prerequisites
* Visual Studio 2017
* [MSYS2 ](http://msys2.github.io/) (GNU Make environment)
* [YASM ](http://yasm.tortall.net/Download.html) (x86 assembly code compiler)

### MSYS2 Setup
Download the latest MSYS2 installer from ​http://msys2.github.io/ and **follow the installation instruction closely** from the installation webpage. For us, we need to download the x86_64 one, NOT the i686 one.

Run the installer and install it to its default folder (eg: we use c:\msys64\ as the installation folder), at the end, run MSYS2 by clicking "Finish" button. And MSYS2 shell command line terminal is open, run the command below:

```Shell
pacman -Syu
```

Continue the installation with typing in "Y(es)" when asked. When this round is done, close the ternimal and run MSYS2 again with command below:

```Shell
pacman -Su 
```

Continue the installation with typing in "Y(es)" when asked.

Get the latest make package by invoking the following command in your MSYS2 shell

```Shell
pacman -S make
```

Install the diffutils for configuring script later

```Shell
pacman -S diffutils
```

Install the package configure

```Shell
pacman -S msys/pkg-config
```

Close the terminal and we need to do a few tweaks to MSYS2. 

Now open msys2_shell.cmd (which should be found in c:\msys64\ folder) in a text editor, in order for the environment from the Windows side to be inherited on the MSYS2 side: 

replace `rem set MSYS2_PATH_TYPE=inherit` with `set MSYS2_PATH_TYPE=inherit`

This will allow the environment variables for Visual Studio to be transferred to the MSYS2 environment and back. Now close the terminal and reopen it.

Rename link.exe to link_bak.exe in the MSYS2 usr bin folder (E.g. C:\msys64\usr\bin\link.exe) to prevent conflict with MSVC link.exe

Making MSYS2 inherit the Windows PATH values means making sure C:\msys64\msys2.ini looks like this:
CHERE_INVOKING=1
MSYS2_PATH_TYPE=inherit
MSYSTEM=MSYS

MSYS2 should now be fully installed for Windows use.

### YASM Setup
Download [YASM executable](​http://yasm.tortall.net/Download.html). You have to download the "general use" binaries and NOT the ones for VS2010. Either Win32 or Win64 binaries support outputting object files for both architectures so that should not matter. The last tested version was [yasm-1.3.0-win64.exe](http://www.tortall.net/projects/yasm/releases/yasm-1.3.0-win64.exe).

Rename the downloaded executable to yasm.exe and place it in your MSYS2 path. E.g.C:\msys64\usr\bin\yasm.exe.

### Verifying your FFmpeg Environment Setup
Launch x64 Native Tools Command Prompt for VS 2017. E.g. Open Command Prompt, then run command below:

```Shell
%comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat" x64
```

Open MSYS2 Shell from the command prompt above (use the correct drive and location of your MSYS2 installation). Note that the command shell above will close and it may take a while for the MSYS2 shell to launch.

```Shell
C:\msys64\msys2_shell.cmd
```

In the MSYS2 shell verify that all the tools below are setup properly by running the following commands

```Shell
$ which cl
```
You would see something like this: 
/c/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.14.26428/bin/HostX64/x64/cl

```Shell
$ which link
```
You would see something like this: 
/c/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.14.26428/bin/HostX64/x64/link

```Shell
$ which yasm
```
You would see something like this: 
/usr/bin/yasm

This verifies that the tools are in the path and point to the right location where MSYS2 and Visual Studio are installed. Now close the terminal for MSYS2.

## Compiling for Windows

Launch x64 Native Tools Command Prompt for VS 2017 if it is not open yet from previous session. E.g. Open Command Prompt, then run command below:

```Shell
%comspec% /k "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
```

Open MSYS2 Shell from the command prompt above (use the correct drive and location of your MSYS2 installation). Note that the command shell above will close and it may take a while for the MSYS2 shell to launch.

```Shell
C:\msys64\msys2_shell.cmd
```

In your MSYS2 shell navigate to your cloned FFmpeg folder. E.g.: C:\Git\FFmpeg

```Shell
cd /c/Git/FFmpeg
```

Run the configure file to configure the code. Full list of configure options can be found [here](https://github.com/TechSmith/FFmpeg/blob/master/configure) Make sure we build it as LGPL, details on license issues can be found [here](https://www.ffmpeg.org/legal.html)

### Generate release build configre files

Invoke the following make commands

```Shell
mkdir -p Output/Release
```

```Shell
cd Output/Release
```

```Shell
../../configure \
--toolchain=msvc \
--disable-programs \
--disable-doc \
--arch=x86_64 \
--enable-shared \
--disable-static \
--enable-cross-compile \
--target-os=win64 \
--extra-cflags="-MD" \
--disable-debug \
--disable-network \
--disable-autodetect \
--disable-encoders \
--disable-decoders \
--disable-filters \
--disable-muxers \
--disable-demuxers \
--disable-bsfs \
--disable-parsers \
--disable-protocols \
--disable-devices \
--enable-protocol=file \
--enable-decoder=h264,mp3*,aac,pcm*,mpeg4 \
--enable-demuxer=h264,mp4,mp3,avi,mov,aac \
--enable-parser=h264,aac,mpeg4video \
--enable-d3d11va \
--enable-hwaccel=h264_d3d11va \
--prefix=../../Build/Release
```
This takes a couple of minutes and you should see no errors when it is done generating config files and the last line should read:
License: LGPL version 2.1 or later

### Generate debug build configure files

Invoke the following make commands

```Shell
mkdir -p Output/Debug
```

```Shell
cd Output/Debug
```

```Shell
../../configure \
--toolchain=msvc \
--disable-programs \
--disable-doc \
--arch=x86_64 \
--enable-shared \
--disable-static \
--disable-optimizations \
--enable-cross-compile \
--target-os=win64 \
--extra-cflags="-MDd" \
--extra-ldflags="/NODEFAULTLIB:libcmt" \
--enable-debug \
--disable-network \
--disable-autodetect \
--disable-encoders \
--disable-decoders \
--disable-filters \
--disable-muxers \
--disable-demuxers \
--disable-bsfs \
--disable-parsers \
--disable-protocols \
--disable-devices \
--enable-protocol=file \
--enable-decoder=h264,mp3*,aac,pcm*,mpeg4 \
--enable-demuxer=h264,mp4,mp3,avi,mov,aac \
--enable-parser=h264,aac,mpeg4video \
--enable-d3d11va \
--enable-hwaccel=h264_d3d11va \
--prefix=../../Build/Debug
```

This takes a couple of minutes and you should see no errors when it is done generating config files and the last line should read:
License: LGPL version 2.1 or later

### Build binaries

And we build it by calling "make". Note this will take about 5 to 30 minutes or so to finish depending on the "config" and "make" switches you use.
```Shell
make
```
You can speed-up compilation using parallel build "make -j4" or the number of cores you want it to use

Then assemble the binaries by calling "make install" and put them in the output folder. This should be very quick and take less than a minute.
```Shell
make install
```

Generated libraries can be found in Build folder specified in --prefix option above.


## Automated Compiling for Windows Using Script

Open PowerShell console, make sure FFmpeg\Windows folder is current and run the script below. This will automate the compiling process menioned above:
```Shell
.\Build.ps1
```

# Post-Processing

## Copy PDB files to the detination folder

Make sure FFmpeg\Windows folder is current:
```Shell
CopyPDB.bat
```

## Patch the dlls with proper version and copyright info

Download the version patching tool here: https://github.com/pavel-a/ddverpatch/releases , make sure you put it in C drive of your build machine, and this file should look exactly like this: “C:\verpatch\verpatch.exe”. This file is used to patch the version info for FFmpeg dlls built from the steps above. Make sure FFmpeg\Windows folder is current:
```Shell
VersionPatching.bat
```

## Build Nuget Package

### Prerequisites
Make sure you have a nuget packaging tool installed. Make sure you have run the steps above and all the FFmpeg binaries are in the Build folder mentioned above.

### Build the nuget package
Open commad line tool, and ..\FFmpeg\Windows is your current location. Use command below to build the nuget package:

```Shell
Write-NuGetPackage .\FFmpeg.autopkg
```

Generated nuget files should be listed in the ..\FFmpeg\Windows folder.
