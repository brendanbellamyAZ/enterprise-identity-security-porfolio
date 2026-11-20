# ==========================================================
# Project 01: Duo Authentication Analytics
# Script: duo-user-report.ps1
# Purpose: Analyze fictional user inventory
# PowerShell Version: 5.1 compatible
# ==========================================================
 
$BasePath = "$HOME\Documents\Duo-Analytics"
$DataFile = "$BasePath\sample-data\users-sample.csv"
$ReportPath = "$BasePath\reports"
 
# Verify source data
if (!(Test-Path $DataFile)) {
    Write-Error "User sample data not found."
    return
}
 
# Import user records
$Users = Import-Csv $DataFile
 
Write-Host "`nDUO USER ACTIVITY REPORT" -ForegroundColor Cyan
Write-Host "Total users: $($Users.Count)"
 
# Analyze account status
$ActiveUsers = @($Users | Where-Object {$_.Status -eq "Active"})
$DisabledUsers = @($Users | Where-Object {$_.Status -eq "Disabled"})
 
# Analyze enrollment status
$NotEnrolled = @(
    $Users | Where-Object {$_.Enrollment -eq "Not Enrolled"}
)
 
# Display summary
Write-Host "`nAccount Summary" -ForegroundColor Yellow
Write-Host "Active users: $($ActiveUsers.Count)"
Write-Host "Disabled users: $($DisabledUsers.Count)"
Write-Host "Not enrolled: $($NotEnrolled.Count)"
 
# Identify accounts requiring review
$ReviewUsers = $Users | Where-Object {
    $_.Status -eq "Disabled" -or
    $_.Enrollment -eq "Not Enrolled"
} | Select-Object Username, DisplayName, Status, Enrollment
 
Write-Host "`nAccounts Requiring Review" -ForegroundColor Yellow
 
if ($ReviewUsers) {
    $ReviewUsers | Format-Table -AutoSize
}
else {
    Write-Host "No accounts requiring review."
}
 
# Build summary
$UserSummary = [PSCustomObject]@{
    TotalUsers = $Users.Count
    ActiveUsers = $ActiveUsers.Count
    DisabledUsers = $DisabledUsers.Count
    NotEnrolledUsers = $NotEnrolled.Count
    AccountsRequiringReview = $ReviewUsers.Count
}
 
# Export reports
$Users | Export-Csv `
    "$ReportPath\user-activity-report.csv" `
    -NoTypeInformation
 
$ReviewUsers | Export-Csv `
    "$ReportPath\users-requiring-review.csv" `
    -NoTypeInformation
 
$UserSummary | Export-Csv `
    "$ReportPath\user-summary.csv" `
    -NoTypeInformation
 
Write-Host "`nUser analysis completed!" -ForegroundColor Green
Write-Host "Reports saved to: $ReportPath"