$ErrorActionPreference = 'SilentlyContinue'

Remove-VpnConnection -Name "VPNName" -AllUserConnection -force
Remove-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Services\PolicyAgent" -Name "AssumeUDPEncapsulationContextOnSendRule" -Force
