#Setting the Credentials for the SIMS Setups folder
cmdkey /add:W-SCH-PROD-SS1 /U W-SCH-PROD-SS1\Setups /p L0c4l53tup5
cmdkey /add:172.16.18.66 /U W-SCH-PROD-SS1\Setups /p L0c4l53tup5
cmdkey /add:W-SCH-PROD-SS1.schools.bristol-cyps.org.uk /U W-SCH-PROD-SS1\Setups /p L0c4l53tup5
Start-Process -Wait -FilePath \\172.16.18.66\SetupsShare\simswaycp\SIMSApplicationSetup.exe -Argument "/silent" -PassThru -NoNewWindow