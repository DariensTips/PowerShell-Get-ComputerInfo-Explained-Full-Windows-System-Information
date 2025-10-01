##############################################################
# Title :   	PowerShell Get-ComputerInfo Explained | Full Windows System Information
# Channel:		https://www.youtube.com/@darienstips9409
# Link:			https://youtu.be/Wg7FxbojWW8
##############################################################

# Legacy System Information
systeminfo.exe
systeminfo.exe | findstr /i ver

# Get-ComputerInfo cmdlet
Get-ComputerInfo -Property csdomain,CsManufacturer,BiosSerialNumber,CsModel,CsName,CsPrimaryOwnerName, CsTotalPhysicalMemory,OsName,OsVersion,OsHotFixes,LogonServer
Get-ComputerInfo -Property *name*,*vers*
Get-ComputerInfo -Property *name*,*vers* | Where-Object {$_.OsName -like "*10*"}
Get-ComputerInfo | Out-String -Stream | Select-String Window
Get-ComputerInfo | findstr Window

# Invoke-Command to run on other computers
Invoke-Command -ComputerName web01 -ScriptBlock {Get-ComputerInfo} 

# Get IP address information
Get-NetIPAddress | Select-Object ipaddress,interfacealias,AddressFamily

# Query CIMv2
Get-CimInstance -namespace "Root\CIMV2\Security\MicrosoftTpm" -ClassName Win32_Tpm
Get-Tpm

# Get installed hotfixed
Get-HotFix | Sort-Object InstalledOn -Descending