<#
.SYNOPSIS
Retrieves information about .NET framework and displays the installed version

.DESCRIPTION
This script checks the registry for the internal version number of the .NET framework on the current computer.
It displays a human readable version number for all .NET framework versions > 4.5.

.NOTES
You don't need any special permissions to run the script. This script is based on the information from Microsoft:
https://docs.microsoft.com/de-de/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed

Author:  Marc Debold
Version: 1.2
Version History:
    1.2  27.11.2023  Added error handling
    1.1  06.06.2019  Added support for 4.8
    1.0  15.03.2018  Initial release

.LINK
https://www.team-debold.de

#>

try {
    $Release = (Get-ChildItem "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\" -ErrorAction Stop | Get-ItemProperty -Name Release -ErrorAction Stop).Release
} catch {
    return "Error fetching .NET Framework: $($_.Exception.Message)"
}

if ($Release -ge 528040) {
    return '.NET Framework 4.8 or later'
} elseif ($Release -ge 461808) {
    return '.NET Framework 4.7.2'
} elseif ($Release -ge 461308) {
    return '.NET Framework 4.7.1'
} elseif ($Release -ge 460798) {
    return '.NET Framework 4.7'
} elseif ($Release -ge 394802) {
    return '.NET Framework 4.6.2'
} elseif ($Release -ge 394254) {
    return '.NET Framework 4.6.1'
} elseif ($Release -ge 393295) {
    return '.NET Framework 4.6'
} elseif ($Release -ge 379893) {
    return '.NET Framework 4.5.2'
} elseif ($Release -ge 378675) {
    return '.NET Framework 4.5.1'
} elseif ($Release -ge 378389) {
    return '.NET Framework 4.5'
} else {
    return '.NET Framework < 4.5'
}