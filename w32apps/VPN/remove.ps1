$ErrorActionPreference = 'SilentlyContinue'

Remove-VpnConnection -Name "Corp.Central" -AllUserConnection -force
Remove-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Services\PolicyAgent" -Name "AssumeUDPEncapsulationContextOnSendRule" -Force