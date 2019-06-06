$Release = (Get-ChildItem "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\" | Get-ItemProperty -Name Release).Release

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