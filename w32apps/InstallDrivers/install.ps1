# Define the path to the RTK folder using the script's directory
$DriverFolder = Join-Path -Path $PSScriptRoot -ChildPath "Drivers"

# Define the path to the local pnputil.exe
$PnPUtilPath = Join-Path -Path $PSScriptRoot -ChildPath "pnputil.exe"

# Define the log file path
$LogFile = "C:\ProgramData\DriversInstall.log"

# Start the transcript to log the output
Start-Transcript -Path $LogFile -Append:$false

# Check if the RTK folder exists
if (Test-Path -Path $DriverFolder) {
    # Function to install drivers
    function Install-Drivers {
        param (
            [string]$folderPath
        )

        try {
            # Get all .inf files in the specified folder and its subfolders
            $infFiles = Get-ChildItem -Path $folderPath -Recurse -Filter *.inf -ErrorAction Stop

            # Install each .inf driver
            foreach ($infFile in $infFiles) {
                try {
                    # Install the driver using the local pnputil.exe
                    Write-Host "Installing driver: $($infFile.FullName)"
                    & $PnPUtilPath -add-driver $infFile.FullName -install
                } catch {
                    Write-Host "Failed to install driver: $($infFile.FullName) - $_"
                }
            }
        } catch {
            Write-Host "Access denied or error accessing folder: $folderPath - $_"
        }
    }

    # Call the function to install drivers
    Install-Drivers -folderPath $DriverFolder
} else {
    Write-Host "The specified Driver folder does not exist: $DriverFolder"
}

# Stop the transcript
Stop-Transcript
