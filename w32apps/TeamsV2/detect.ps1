$ErrorActionPreference = 'SilentlyContinue'

$app = Get-AppxPackage | where-object {$_.name -like "*MSTeams*"}
if ($app -eq $null) {
    Write-Host "App is Not installed"
    exit 1
} else {
    Write-Host "The App is Installed."
    exit 0
}