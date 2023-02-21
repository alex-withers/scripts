
#Open the folder en Windows Explorer under C:\Users\USERNAME\AppData\Roaming\CustomerXXXX
########################################################################################
$path = [Environment]::GetFolderPath('ApplicationData') + "\StephensonLaw"

If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
########################################################################################


#Download the image from ImGur to user profile
########################################################################################
$url = "https://file-transfer.co.uk/desktopbackgrounds/stephensonlaw/Stephenson%20Law_Screen%20image.jpg"
$output = $path + "\CustomerBackground.png"
Start-BitsTransfer -Source $url -Destination $output

########################################################################################



# Update the background of the desktop
########################################################################################
Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $output

rundll32.exe user32.dll, UpdatePerUserSystemParameters




########################################################################################
