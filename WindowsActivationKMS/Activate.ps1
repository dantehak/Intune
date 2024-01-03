# Clears current settings
slmgr /upk
# Set Activation Server
slmgr /skms "Enter address of KMS Server Here and remove quotes"
# Set Windows key, in this case its the general Windows 10/11 Enterprise Key for KMS Activation
slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
# Activate Windows
slmgr /ato

Start-Sleep 15

# Gets the Windows Activation Status
$winlic = Get-CimInstance SoftwareLicensingProduct -Filter "Name like 'Windows%'" | where { $_.PartialProductKey } | foreach { $_.LicenseStatus }

If ($winlic -eq '1') {
    write-host "Remediation completed"
    exit 0	
}
else {
    write-host "Remediation failed"
    exit 1
    }  
