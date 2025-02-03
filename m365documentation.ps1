
# Connect to your tenant
Connect-M365Doc

# Collect information for component Intune as an example 
$doc = Get-M365Doc -Components AzureAD -ExcludeSections "MobileAppDetailed"

# Output the documentation to a Word file
$doc | Write-M365DocWord -FullDocumentationPath "C:\Shine\entra.docx"

