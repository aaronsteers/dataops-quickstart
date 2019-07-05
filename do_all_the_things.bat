echo off
echo:
echo Installing Chocolatey - "The package manager for Windows"...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo Chocolatey install complete.
echo:
pause
echo Enabling Hyper-V virtualization (required by Docker) and WSL (Linux Subsystem)...
DISM /online /enable-feature /featurename:Microsoft-Hyper-V-All
echo:
echo:
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux
echo:
echo Installation of Hyper-V and WSL complete!
echo:
echo Installing Docker Desktop ('choco install docker-desktop')...
echo:
choco install docker-desktop
echo:
echo Installing Git ('choco install git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"')...
echo:
choco install git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"
echo:
echo Installing VS Code ('choco install vscode')...
echo:
choco install vscode
echo:
echo Installing Ubuntu 18.04 ('choco install wsl-ubuntu-1804')...
echo:
choco install wsl-ubuntu-1804
echo:
echo All installations complete!
echo:
echo The next step is to launch the Ubuntu system.
echo Ubuntu will now open a new terminal in order to complete the setup.
echo Type 'exit' once complete to return to this installer....
echo:
bash exit
echo:
echo Testing that Docker is working...
echo:
docker run -it hello-world
echo:
echo Docker test complete!
echo:
echo Setup script execution complete!
echo:
echo:
pause
echo on
