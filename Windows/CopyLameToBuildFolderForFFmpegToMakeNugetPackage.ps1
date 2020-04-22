
# copy Lame header/libs/dlls to the Build folder for FFmpeg to make nuget package
$FFmpegBuildFolder = "../Build"
$LameRoot = "../libmp3Lame"

# create the output folder structure
Remove-Item "$FFmpegBuildFolder/Debug/include/lame" -ErrorAction Ignore -Force -Recurse
New-Item -Path "$FFmpegBuildFolder/Debug/include/lame" -ItemType Directory | Out-Null
Remove-Item "$FFmpegBuildFolder/Release/include/lame" -ErrorAction Ignore -Force -Recurse
New-Item -Path "$FFmpegBuildFolder/Release/include/lame" -ItemType Directory | Out-Null


# note we put lame.h in a folder lame
Write-Host "Copying header file..."
copy-item -Path "$LameRoot/include/lame.h" -Destination "$FFmpegBuildFolder/Debug/include/lame/lame.h" -Force
copy-item -Path "$LameRoot/include/lame.h" -Destination "$FFmpegBuildFolder/Release/include/lame/lame.h" -Force

# note we the dll name is unchanged
Write-Host "Copying dlls..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.dll" -Destination "$FFmpegBuildFolder/Debug/bin/libmp3Lame.dll" -Force
copy-item -Path "$LameRoot/redist/x64/Release/libmp3lame.dll" -Destination "$FFmpegBuildFolder/Release/bin/libmp3lame.dll" -Force

# note we the pdb name is unchanged
Write-Host "Copying pdb..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.pdb" -Destination "$FFmpegBuildFolder/Debug/bin/libmp3Lame.pdb" -Force

# note we the lib name is changed
Write-Host "Copying libs..."
copy-item -Path "$LameRoot/redist/x64/Debug/libmp3lame.lib" -Destination "$FFmpegBuildFolder/Debug/bin/mp3lame.lib" -Force
copy-item -Path "$LameRoot/redist/x64/Release/libmp3lame.lib" -Destination "$FFmpegBuildFolder/Release/bin/mp3lame.lib" -Force

