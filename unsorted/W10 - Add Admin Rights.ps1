$user = (Get-WMIObject -class Win32_ComputerSystem | select username).username

net localgroup "Administrators" $user /add