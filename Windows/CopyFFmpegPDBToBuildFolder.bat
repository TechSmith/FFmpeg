REM ### Copy PDB files from source to destination folder

set "FFmpeg_Source_Folder=%~dp0"
echo FFmpeg_Source_Folder: %FFmpeg_Source_Folder%

set SRC="%FFmpeg_Source_Folder%\..\Output\Debug\" 
set DST="%FFmpeg_Source_Folder%\..\Build\Debug\bin\"
for /R %SRC% %%f in (*.pdb) do copy %%f %DST%