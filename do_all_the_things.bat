REM Enable Hyper-V Virtualization (required by Docker):
DISM /online /enable-feature /featurename:Microsoft-Hyper-V-All

REM Enable WSL Linux Support:
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux

REM Download and install VS Code:
bitsadmin /transfer myDownloadJob /download /priority normal https://aka.ms/win32-x64-user-stable c:\Files\VS-Code-Install-latest.exe
c:\Files\VS-Code-Install-latest.exe

REM Install the latest stable version of Ubuntu from Windows Store:
explorer "ms-windows-store://pdp/?ProductId=9NBLGGH4MSV6"

REM Launch Ubuntu:
bash

REM Download and install the latest stable version of Docker Desktop:
bitsadmin /transfer myDownloadJob /download /priority normal https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe c:\Files\Docker%20for%20Windows%20Installer.exe
c:\Files\Docker%20for%20Windows%20Installer.exe

REM Download and install the latest stable version of Git:
REM WARNING: The version number is built-in to the URL. To update to the latest version number, check https://git-scm.com/download/win
bitsadmin /transfer myDownloadJob /download /priority normal https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/Git-2.21.0-64-bit.exe c:\Files\Git-2.21.0-64-bit.exe
Git-2.21.0-64-bit.exe

REM Download and install the latest stable version of GitHub Desktop:
bitsadmin /transfer myDownloadJob /download /priority normal https://central.github.com/deployments/desktop/desktop/latest/win32 c:\Files\GitHubDesktopSetup.exe
c:\Files\GitHubDesktopSetup.exe

REM Test that Docker is working (Windows):
docker run -it hello-world

