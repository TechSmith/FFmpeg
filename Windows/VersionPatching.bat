REM ### Patch the version

set "FFmpeg_Source_Folder=%~dp0"
echo FFmpeg_Source_Folder: %FFmpeg_Source_Folder%


REM ### Release

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\avcodec-58.dll" "58.54.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avcodec-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\avdevice-58.dll" "58.8.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avdevice-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\avfilter-7.dll" "7.57.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avfilter-7.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\avformat-58.dll" "58.29.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avformat-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\avutil-56.dll" "56.31.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avutil-56.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\swresample-3.dll" "3.5.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "swresample-3.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Release\bin\swscale-5.dll" "5.5.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "swscale-5.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

REM ### Debug
     
C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\avcodec-58.dll" "58.54.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avcodec-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\avdevice-58.dll" "58.8.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avdevice-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\avfilter-7.dll" "7.57.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avfilter-7.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\avformat-58.dll" "58.29.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avformat-58.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\avutil-56.dll" "56.31.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "avutil-56.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\swresample-3.dll" "3.5.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "swresample-3.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"

C:\verpatch\verpatch.exe "%FFmpeg_Source_Folder%\..\Build\Debug\bin\swscale-5.dll" "5.5.100.3" /va /s description "FFmpeg codec library" /s copyright "(C) 2000-2019 FFmpeg Project" /s OriginalFilename "swscale-5.dll" /s ProductName "FFmpeg" /pv "4.2.1.0"