echo off
echo:
echo Installing Chocolatey - "The package manager for Windows"...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo Chocolatey install complete.
echo:
pause

echo Enabling Hyper-V virtualization (required by Docker) and WSL Linux support...
DISM /online /enable-feature /featurename:Microsoft-Hyper-V-All
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux

choco install docker-desktop
choco install git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"
choco install vscode
choco install wsl-ubuntu-1804

REM Launch Ubuntu:
echo The next step is to launch the Ubuntu system.
echo Ubuntu will now launch and the Linux kernel will finalize its updates.
echo Type 'exit' once complete to return to this installer....
bash exit

echo:
echo Testing that Docker is working...
echo:
docker run -it hello-world

echo Setup script execution complete!
echo:
echo:
pause
echo on

REM Deprecated bitsadmin in favor of choco install
REM REM Download and install the latest stable version of Docker Desktop:
REM echo Attempting to download Docker for Windows...
REM echo NOTE: If the default download link does not work, you can create an account with DockerHub.com and
REM echo       download manually from: https://docs.docker.com/docker-for-windows/install/
REM cls
REM echo Downloading Docker...
REM bitsadmin /transfer "Docker Download" /download /priority normal https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe c:\Files\Docker%20for%20Windows%20Installer.exe
REM echo Attempting to install Docker for Windows...
REM c:\Files\Docker%20for%20Windows%20Installer.exe

REM echo Downloading Git...
REM echo WARNING: The version number is built-in to the URL: Downloading version '2.21.0-64-bit'...
REM cls
REM echo Downloading Git...
REM set GIT_VERSION=2.22.0
REM set GIT_DOWNLOAD_PATH=https://github.com/git-for-windows/git/releases/download/v%GIT_VERSION%.windows.1/Git-%GIT_VERSION%-64-bit.exe
REM bitsadmin /transfer "Git Download" /download /priority normal %GIT_DOWNLOAD_PATH% c:\Files\Git-%GIT_VERSION%-64-bit.exe
REM echo Installing Git from '%GIT_DOWNLOAD_PATH%'...
REM C:\Files\Git-%GIT_VERSION%-64-bit.exe /LOADINF="git-install-config.ini" /SAVEINF=".logs/git-install-config.new.ini" /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"


REM echo Creating a new folder 'C:\Files\' for downloads...
REM mkdir C:\Files
REM mkdir .logs

REM echo Downloading the latest version of VS Code...
REM cls
REM echo Downloading VS Code...
REM bitsadmin /rawreturn /transfer "VS Code Download" /download /priority normal https://aka.ms/win32-x64-user-stable c:\Files\VS-Code-Install-latest.exe
REM echo Installing VS Code...
REM runas /trustlevel:0x20000 c:\Files\VS-Code-Install-latest.exe
REM echo The VS Code installer should now have opened in a new window. Complete the installation and then return to this window.
REM echo:
REM pause

REM REM Install the latest stable version of Ubuntu from Windows Store:
REM echo Loading the Ubuntu app in the Microsoft Store...
REM explorer "ms-windows-store://pdp/?ProductId=9NBLGGH4MSV6"
REM echo Windows store should now have opened in a new window. Click 'Install' to install the Ubuntu app and then return to this window.
REM echo:
REM echo Note: If you have not used the Microsoft Store previously, you may need to log in and/or 
REM echo       create a Microsoft account if you do not have one already.
REM echo:
REM echo Note: Once the install completes, you will need to create a new Linux username and password. The
REM echo       username cannot contain special characters (including '.'). The password is also not synced
REM echo       with or rotated on the same schedule as your Windows credentials.
REM echo:
REM pause
