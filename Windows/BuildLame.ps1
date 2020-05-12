# adapted from https://blog.lextudio.com/locate-msbuild-via-powershell-on-different-operating-systems-140757bb8e18

Install-Module VSSetup -Scope CurrentUser -Force
$instance = Get-VSSetupInstance -All | Select-VSSetupInstance -Require 'Microsoft.Component.msbuild' -Latest
$installDir = $instance.installationPath
$msbuild = $installDir + '\msbuild\Current\Bin\msbuild.exe' # VS2019
if (![System.IO.File]::Exists($msbuild))
{
    $msbuild = $installDir + '\msbuild\15.0\Bin\msbuild.exe' # VS2017
    if (![System.IO.File]::Exists($msbuild))
    {
        Write-Host "msbuild doesn't exist."
        exit 1
    }
}

# from FFmpeg\Windows
$LameRoot = "../libmp3lame"
$lameSln = "$LameRoot/vc_solution/Lame.sln"

# build $lameSln for debug mode
Start-Process "$msbuild" -NoNewWindow -ArgumentList $lameSln,"/t:Build","/p:Configuration=Debug"

# build $lameSln for release mode
Start-Process "$msbuild" -NoNewWindow -ArgumentList $lameSln,"/t:Build","/p:Configuration=Release"
