cd C:\Users\wladadmin

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Download AzCopy
Invoke-WebRequest -Uri "https://aka.ms/downloadazcopy-v10-windows" -OutFile AzCopy.zip -UseBasicParsing
 
#Curl.exe option (Windows 10 Spring 2018 Update (or later))
curl.exe -L -o AzCopy.zip https://aka.ms/downloadazcopy-v10-windows
 
#Expand Archive
Expand-Archive ./AzCopy.zip ./AzCopy -Force
 
#Move AzCopy to the destination you want to store it
Get-ChildItem ./AzCopy/*/azcopy.exe | Move-Item -Destination "C:\Users\wladadmin\AzCopy\AzCopy.exe"
 
#Add your AzCopy path to the Windows environment PATH (C:\Users\wladadmin\AzCopy in this example), e.g., using PowerShell:
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";C:\Users\wladadmin\AzCopy", "User")

Start-Sleep -s 3