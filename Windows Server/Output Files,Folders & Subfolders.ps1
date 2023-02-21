$rootPath = "D:\"
$getFilesfromRootDirectory = Get-ChildItem -Path $rootPath | %{$_.FullName}

$csvFilename = "D:\outputs.csv"   #Output will be written to csv file

function get_files_under_folders($value)
{
  $getFiles = Get-ChildItem -Path $value | %{$_.FullName}

    foreach ($value in $getFiles)
    {

        if(checkFileorFolder($value))
        {    
             echo "$value" >> $csvFilename
             Write-Host $value
             get_files_under_folders($value)         
        }
        else
        {        
            Write-Host $value 
            echo "$value" >> $csvFilename
        }
    }     
}

function checkFileorFolder($value)
{
   $CheckFile = Test-Path -Path $value -PathType Container 
  return $CheckFile
}

foreach($value in $getFilesfromRootDirectory)
{


 if(checkFileorFolder($value))
 {        
     Write-Host $value
     get_files_under_folders($value)         
 }
 else
 {        
    Write-Host $value 
    echo "$value" >> $csvFilename
 }
}