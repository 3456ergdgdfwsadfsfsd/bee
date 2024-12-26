@echo off
:internettest
cls
echo waiting for internet reconnection
echo you may need to manually reconnect to wifi
echo if no wifi networks exist or not reconnecting
echo go to device manager then uninstall your network card
echo its under the network adapters section
echo it will probably have some kind of brand name
echo then go to the action section and click "scan for hardware changes"
echo then you will have internet
ping www.google.com -n 1 | find "=" > nul
if errorlevel==1 goto internettest
cls
cd "%~dp0"
taskkill /f /im EasyAntiCheat_Setup.exe
taskkill /f /im FortniteLauncher.exe
taskkill /f /im EpicWebHelper.exe
taskkill /f /im FortniteClient-Win64-Shipping.exe
taskkill /f /im EasyAntiCheat.exe
taskkill /f /im BEService_x64.exe
taskkill /f /im EpicGamesLauncher.exe
taskkill /f /im FortniteClient-Win64-Shipping_BE.exe
taskkill /f /im FortniteClient-Win64-Shipping_EAC.exe
sc stop BEService
sc stop EasyAntiCheat

reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Hardware Survey" /f 1>nul 2>nul
reg delete "HKEY_CURRENT_USER\Software\Epic Games\Unreal Engine\Identifiers" /f 1>nul 2>nul
reg delete "HKU\S-1-5-21-860440266-1445122309-108474356-1001\Software\Epic Games\Unreal Engine\Identifiers" /va /f 1>nul 2>nul
reg delete "HKU\S-1-5-21-860440266-1445122309-108474356-1001\Software\Epic Games\Unreal Engine\Hardware Survey" /va /f 1>nul 2>nul
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f 1>nul 2>nul
reg delete "HKU\S-1-5-21-860440266-1445122309-108474356-1001\Software\Epic Games" /f 1>nul 2>nul
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName /v ComputerName /t REG_SZ /d %random% /f 1>nul 2>nul
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName /v ComputerName /t REG_SZ /d %random% /f 1>nul 2>nul
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f 1>nul 2>nul

DevManView.exe /uninstall "SWD\MS*" /use_wildcard

start /wait /b  DeviceCleanupCmd.exe * -s
DriveCleanup.exe
echo just wait... 
del "C:\Users\%username%\AppData\Local\Temp.*"
mkdir "C:\Windows\temp"
mkdir "C:\Users\%username%\AppData\Local\Temp"
set try=1

echo usually this takes 1-4 tries
:retry
echo attempting spoof try#%try%
set /A try=%try%+1
for %%p in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%p:\nul DevManView.exe /uninstall "%%p:\" && echo did %%p drive
@echo on
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "WAN Miniport*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Disk drive*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "C:\"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "D:\"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "E:\"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "F:\"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "G:\"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Disk"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "disk"
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Disk&*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "SWD\WPDBUSENUM*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "USBSTOR*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "SCSI\Disk*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "STORAGE*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "WAN Miniport*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "SWD\MS*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Motherboard*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Volume*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "PCI-to-PCI*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Microsoft*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "System*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "ACPI\*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Remote*" /use_wildcard""
echo Y | start "" /min  ""%~dp0DevManView.exe /uninstall "Standard*" /use_wildcard""
DevManView.exe /uninstall "C:\"
DevManView.exe /uninstall "Disk drive*" /use_wildcard
DevManView.exe /uninstall "Disk"
DevManView.exe /uninstall "disk"
DevManView.exe /uninstall "Disk&*" /use_wildcard
DevManView.exe /uninstall "SWD\WPDBUSENUM*" /use_wildcard
DevManView.exe /uninstall "USBSTOR*" /use_wildcard
DevManView.exe /uninstall "SCSI\Disk*" /use_wildcard
DevManView.exe /uninstall "STORAGE*" /use_wildcard
DevManView.exe /uninstall "Motherboard*" /use_wildcard
DevManView.exe /uninstall "Volume*" /use_wildcard
DevManView.exe /uninstall "Microsoft*" /use_wildcard
DevManView.exe /uninstall "System*" /use_wildcard
DevManView.exe /uninstall "ACPI\*" /use_wildcard
DevManView.exe /uninstall "Remote*" /use_wildcard
DevManView.exe /uninstall "Standard*" /use_wildcard
