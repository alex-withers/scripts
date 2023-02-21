$TeamsDir = $env:LOCALAPPDATA + '\Microsoft\Teams\current\teams.exe'
$firewallRuleName = 'teams.exe'

$ruleExist = Get-NetFirewallRule -DisplayName $firewallRuleName -ErrorAction SilentlyContinue

if($ruleExist)
{
    Set-NetFirewallRule -DisplayName $firewallRuleName -Profile Any -Action Allow
}
else
{
    New-NetfirewallRule -DisplayName $firewallRuleName -Direction Inbound -Protocol TCP -Profile Any -Program $TeamsDir -Action Allow
    New-NetfirewallRule -DisplayName $firewallRuleName -Direction Inbound -Protocol UDP -Profile Any -Program $TeamsDir -Action Allow
}
