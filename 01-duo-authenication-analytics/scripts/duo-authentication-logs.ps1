# ==========================================================
# Project 01: Duo Authentication Analytics
# Script: duo-authentication-logs.ps1
# Purpose: Analyze fictional authentication records
# PowerShell Version: 5.1 compatible
# ==========================================================
 
$BasePath = "$HOME\Documents\Duo-Analytics"
$DataFile = "$BasePath\sample-data\authentication-sample.csv"
$ReportPath = "$BasePath\reports"
 
# Verify source data exists
if (!(Test-Path $DataFile)) {
    Write-Error "Authentication sample data not found."
    return
}
 
# Import authentication records
$AuthData = Import-Csv $DataFile
 
Write-Host "`nDUO AUTHENTICATION ANALYSIS" -ForegroundColor Cyan
Write-Host "Total authentication records: $($AuthData.Count)"
 
# Count successful and denied attempts
$SuccessCount = @($AuthData | Where-Object {$_.Result -eq "SUCCESS"}).Count
$DeniedCount = @($AuthData | Where-Object {$_.Result -eq "DENIED"}).Count
 
Write-Host "`nAuthentication Results" -ForegroundColor Yellow
Write-Host "Successful: $SuccessCount"
Write-Host "Denied: $DeniedCount"
 
# Identify users with repeated denied attempts
$RepeatedFailures = $AuthData |
    Where-Object {$_.Result -eq "DENIED"} |
    Group-Object Username |
    Where-Object {$_.Count -ge 2} |
    Select-Object @{
        Name="Username"
        Expression={$_.Name}
    }, @{
        Name="DeniedAttempts"
        Expression={$_.Count}
    }
 
Write-Host "`nUsers With Repeated Denied Attempts" -ForegroundColor Yellow
 
if ($RepeatedFailures) {
    $RepeatedFailures | Format-Table -AutoSize
}
else {
    Write-Host "No repeated denied attempts found."
}
 
# Analyze application activity
$ApplicationSummary = $AuthData |
    Group-Object Application |
    Select-Object @{
        Name="Application"
        Expression={$_.Name}
    }, @{
        Name="TotalAttempts"
        Expression={$_.Count}
    }
 
# Build summary report
$Summary = [PSCustomObject]@{
    TotalAttempts = $AuthData.Count
    SuccessfulAttempts = $SuccessCount
    DeniedAttempts = $DeniedCount
    UsersWithRepeatedFailures = $RepeatedFailures.Count
}
 
# Export reports
$Summary | Export-Csv `
    "$ReportPath\authentication-summary.csv" `
    -NoTypeInformation
 
$RepeatedFailures | Export-Csv `
    "$ReportPath\repeated-authentication-failures.csv" `
    -NoTypeInformation
 
$ApplicationSummary | Export-Csv `
    "$ReportPath\application-activity-summary.csv" `
    -NoTypeInformation
 
Write-Host "`nAuthentication analysis completed!" -ForegroundColor Green
Write-Host "Reports saved to: $ReportPath"