# Gets the Windows Activation Status
$winlic = Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | foreach { $_.LicenseStatus }

If ($winlic -eq '1') {
    write-host "Compliant"
    exit 0	
}
else {
    write-host "Non-Compliant"
    exit 1
    }  
