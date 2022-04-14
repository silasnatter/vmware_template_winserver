# Vorbereitung zur Feature-Installation



#Telnet-Client installieren

Add-WindowsFeature Telnet-Client

#.NET Framework 3.5.1 installieren

dism /online /enable-feature /featurename:NetFX3 /all /Source:d:\sources\sxs /LimitAccess

Add-WindowsFeature AS-NET-Framework

# Datenausführungsverhinderung deaktivieren

bcdedit /set nx AlwaysOff

# Boot-Animationen deaktivieren

bcdedit /set bootux disabled

# Benutzerkontensteuerung deaktivieren

Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -Value 0

# Assistent für Erstkonfiguration deaktivieren

Set-ItemProperty -Path "HKLM:\Software\Microsoft\ServerManager\Oobe" -Name "DoNotOpenInitialConfigurationTasksAtLogon" -Value "1"

# Start vom Server-Manager deaktivieren

Set-ItemProperty -Path "HKLM:\Software\Microsoft\ServerManager\" -Name "DoNotOpenServerManagerAtLogon" -Value "1"

# Verstärkte Sicherheitskonfiguration für Internet Explorer deaktivieren

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value "0"

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}" -Name "IsInstalled" -Value "0"

# Leistungsoptionen - Für optimale Leistung anpassen

$path = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'
try {
    $s = (Get-ItemProperty -ErrorAction stop -Name visualfxsetting -Path $path).visualfxsetting 
    if ($s -ne 2) {
        Set-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 2  
        }
    }
catch {
    New-ItemProperty -Path $path -Name 'VisualFXSetting' -Value 2 -PropertyType 'DWORD'
    }

# Energieoptionen auf Höchstleistung

powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c




# Server Reboot

Restart-Computer
# w2019
dism /online /add-package /packagepath:"C:\Windows\servicing\Packages\Adobe-Flash-For-Windows-Package~31bf3856ad364e35~amd64~~10.0.17763.1.mum"

# w2016
dism /online /add-package /packagepath:"C:\Windows\servicing\Packages\Adobe-Flash-For-Windows-Package~31bf3856ad364e35~amd64~~10.0.14393.0.mum"

# w2012
Install-WindowsFeature Desktop-Experience




https://helpx.adobe.com/flash-player.html




