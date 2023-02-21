$dirlist = "Simitive limited"
$userdirs = (Get-CimInstance -ClassName Win32_UserProfile -Filter "Special=$false").LocalPath

foreach ($ud in $userdirs) {
    foreach ($d in $dirlist) {
        if (Test-Path -Path "$ud\$d") {
            Remove-Item -Path "$ud\$d" -Recurse -Remove-Item
        }
    }
}