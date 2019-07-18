echo on


REM WSL feature install
choco install -y --source windowsfeatures Microsoft-Windows-Subsystem-Linux

REM If you have not already configured your Ubuntu environment, you will be prompted now to do so.
bash exit

REM WSL setup script completed.
pause
