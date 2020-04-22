
# Set up Visual Studio 2017 (x64) building environment  
function Invoke-BatchFile
{
   param([string]$Path, [string]$Parameters)  

   $tempFile = [IO.Path]::GetTempFileName()  

   ## Store the output of cmd.exe.  We also ask cmd.exe to output   
   ## the environment table after the batch file completes  
   cmd.exe /c " `"$Path`" $Parameters && set > `"$tempFile`" " 

   ## Go through the environment variables in the temp file.  
   ## For each of them, set the variable in our local environment.  
   Get-Content $tempFile | Foreach-Object {   
       if ($_ -match "^(.*?)=(.*)$")  
       { 
           Set-Content "env:\$($matches[1])" $matches[2]  
       } 
   }  

   Remove-Item $tempFile
}
Invoke-BatchFile "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

# Parse out the folder path of current script file
$FFmpeg_Source_Folder = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
write-host $FFmpeg_Source_Folder

write-host Building FFmpeg binaries...

# Start MSYS2 bash environment and build FFmpeg binaries
Start-Process -FilePath "C:\msys64\msys2_shell.cmd" -ArgumentList "$FFmpeg_Source_Folder\BuildFFmpeg.sh" -Wait -NoNewWindow

write-host Done