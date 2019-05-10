DISM /online /enable-feature /featurename:Microsoft-Hyper-V-All
DISM /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux


bitsadmin /transfer myDownloadJob /download /priority normal https://aka.ms/win32-x64-user-stable c:\VS-Code-Install-latest.exe
c:\VS-Code-Install-latest.exe
