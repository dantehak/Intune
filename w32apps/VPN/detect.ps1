$ErrorActionPreference = 'SilentlyContinue'

$vpn = Get-VpnConnection -Name "Corp.Central" -AllUserConnection
if ($vpn -eq $null) {
    Write-Host "Variable is null"
    exit 1
} else {
    Write-Host "The variable is not null."
    exit 0
}