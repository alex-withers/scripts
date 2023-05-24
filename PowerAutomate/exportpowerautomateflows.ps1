foreach ($flow in $flows) {
    Export-PnPFlow -Identity $flow -OutPath "C:\ADT\Github\powerautomate\PowerAutomateFlows\ADT\$($flow.Name).zip" -AsZipPackage
}
