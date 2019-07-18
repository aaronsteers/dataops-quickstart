echo on

REM Performing choco software uninstalls (in reverse install order)...

REM Python packages
choco uninstall -y --source python ^
    awscli ^
    pylama ^
    pytest ^
    pytest-cov ^
    nose ^
    s3fs

REM Software uninstalls
choco uninstall -y ^
    7zip ^
    azure-cli ^
    chocolateygui ^
    docker-desktop ^
    microsoftazurestorageexplorer ^
    powerbi ^
    python3 ^
    r-project ^
    sql-server-management-studio ^
    terraform ^
    vscode ^
    wsl-ubuntu-1804 ^
    git.install

REM Windows feature uninstalls
choco uninstall -y --source windowsfeatures ^
    Microsoft-Windows-Subsystem-Linux ^
    Microsoft-Hyper-V-All

pause
