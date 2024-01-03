# Gets the Bitlocker Status
$bitlock = Get-BitLockerVolume -MountPoint 'C:' | select-object ProtectionStatus  | foreach { $_.ProtectionStatus }

If ($bitlock -eq 'On') {
    write-host "Compliant"
    exit 0	
}
else {
    write-host "Non-Compliant"
    exit 1
    }
