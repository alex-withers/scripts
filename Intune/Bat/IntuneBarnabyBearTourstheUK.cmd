md 'C:\Program Files (x86)\BarnabyBearTourstheUK'
copy /Y .\BarnabyBearTourstheUK.zip 'C:\Program Files (x86)\BarnabyBearTourstheUK'
cd "C:\Program Files (x86)\BarnabyBearTourstheUK"
powershell.exe -ExecutionPolicy Unrestricted -Command expand-archive -path 'C:\Program Files (x86)\BarnabyBearTourstheUK\BarnabyBearTourstheUK.zip' -destinationpath 'C:\Program Files (x86)\BarnabyBearTourstheUK'