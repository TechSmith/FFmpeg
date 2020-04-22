
$LameRoot = "../libmp3Lame"

# copy header/libs/dlls to the output folder for FFmpeg to consume
$lameOutputForFFmpeg = "$LameRoot/output"

# create the output folder structure
Remove-Item "$lameOutputForFFmpeg/" -ErrorAction Ignore -Force -Recurse
New-Item -Path $lameOutputForFFmpeg -ItemType Directory | Out-Null
New-Item -Path $lameOutputForFFmpeg/lame -ItemType Directory | Out-Null
New-Item -Path $lameOutputForFFmpeg/x64 -ItemType Directory | Out-Null
New-Item -Path $lameOutputForFFmpeg/x64/Debug -ItemType Directory | Out-Null
New-Item -Path $lameOutputForFFmpeg/x64/Release -ItemType Directory | Out-Null

# note we put lame.h in a folder lame - this is needed for FFmpeg to locate it
Write-Host "Copying header file..."
copy-item -Path "$LameRoot/include/lame.h" -Destination "$lameOutputForFFmpeg/lame/lame.h" -Force

# note we the dll name is unchanged
Write-Host "Copying dlls..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.dll" -Destination "$lameOutputForFFmpeg/x64/Debug/libmp3Lame.dll" -Force
copy-item -Path "$LameRoot/redist/x64/Release/libmp3lame.dll" -Destination "$lameOutputForFFmpeg/x64/Release/libmp3lame.dll" -Force

# note we the pdb name is unchanged
Write-Host "Copying pdb..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.pdb" -Destination "$lameOutputForFFmpeg/x64/Debug/libmp3Lame.pdb" -Force

# note we the lib name is changed - this is needed for FFmpeg to find and link to the lib correctly
Write-Host "Copying libs..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.lib" -Destination "$lameOutputForFFmpeg/x64/Debug/mp3lame.lib" -Force
copy-item -Path "$LameRoot/redist/x64/Release/libmp3lame.lib" -Destination "$lameOutputForFFmpeg/x64/Release/mp3lame.lib" -Force

