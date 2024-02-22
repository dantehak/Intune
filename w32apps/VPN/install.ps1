$ErrorActionPreference = 'SilentlyContinue'

Add-VpnConnection -Name "VPNName" -ServerAddress "VPNAddress" -TunnelType L2tp -L2tpPsk "YourSecretHere" -EncryptionLevel "Required" -AuthenticationMethod Eap -RememberCredential -Force -SplitTunneling $true -AllUserConnection

Set-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Services\PolicyAgent" -Name "AssumeUDPEncapsulationContextOnSendRule" -Type DWORD -Value 2 -Force
