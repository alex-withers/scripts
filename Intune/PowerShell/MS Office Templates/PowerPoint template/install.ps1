﻿$PackageName = "PowerPoint-template"
$Version = "1"

$Path_local = "$ENV:LOCALAPPDATA\_MEM"
Start-Transcript -Path "$Path_local\Log\$PackageName-install.log" -Force

try{
    # Create Templates folder
    New-Item -Path "$env:APPDATA\Microsoft\Templates" -ItemType "Directory" -Force
    # Copy template
    Copy-Item -Path "blank.potx" -Destination "$env:APPDATA\Microsoft\Templates\blank.potx" -Recurse -Force

    # Validation File
    New-Item -Path "$Path_local\Validation\$PackageName" -ItemType "file" -Force -Value $Version

}catch{$_}

Stop-Transcript
