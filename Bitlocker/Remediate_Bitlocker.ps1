# Write Log File
Start-Transcript -path "C:\Users\Public\Documents\Remediate-Bitlocker.log" -append

# Enable Bitlocker on drive C
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes128 -UsedSpaceOnly -SkipHardwareTest -RecoveryPasswordProtector

start-sleep 300

# Backup Bitlocker key to Azure AD

(Get-BitLockerVolume -MountPoint $volume.MountPoint).KeyProtector | 
Where-Object { 
$_.KeyProtectorType -eq 'RecoveryPassword' 
} | 
Foreach-Object { 
$key = "$($_.KeyProtectorId)"
}

Manage-BDE -Protectors -AADBackup C: -ID "$key"

start-sleep 10

# Gets the Bitlocker Status
$bitlock = Get-BitLockerVolume -MountPoint 'C:' | select-object ProtectionStatus  | foreach { $_.ProtectionStatus }

If ($bitlock -eq 'On') {
    write-host "Compliant"
     exit 0	
}
 If ($bitlock -eq 'Off') {
    write-host "Non-Compliant"
     exit 1	
}
 else {
    write-host "Error in script"
     exit 0
    }
Stop-Transcript
