# ==========================================================
# Project 01: Duo Authentication Analytics
# Script: duo-phone-report.ps1
# Purpose: Analyze fictional phone/device inventory
# PowerShell Version: 5.1 compatible
# ==========================================================
 
$BasePath = "$HOME\Documents\Duo-Analytics"
$PhoneFile = "$BasePath\sample-data\phones-sample.csv"
$UserFile = "$BasePath\sample-data\users-sample.csv"
$ReportPath = "$BasePath\reports"
 
# Verify source data
if (!(Test-Path $PhoneFile)) {
    Write-Error "Phone sample data not found."
    return
}
 
if (!(Test-Path $UserFile)) {
    Write-Error "User sample data not found."
    return
}
 
# Import datasets
$Phones = Import-Csv $PhoneFile
$Users = Import-Csv $UserFile
 
Write-Host "`nDUO PHONE AND DEVICE INVENTORY" -ForegroundColor Cyan
 
# Count device records
$TotalDevices = $Phones.Count
 
# Analyze platforms
$PlatformSummary = $Phones |
    Group-Object Platform |
    Select-Object @{
        Name="Platform"
        Expression={$_.Name}
    }, @{
        Name="DeviceCount"
        Expression={$_.Count}
    }
 
# Analyze device status
$ActiveDevices = @(
    $Phones | Where-Object {$_.Status -eq "Active"}
)
 
# Identify users without a device record
$UsersWithoutDevices = foreach ($User in $Users) {
 
    $MatchingDevice = @(
        $Phones | Where-Object {
            $_.Username -eq $User.Username
        }
    )
 
    if ($MatchingDevice.Count -eq 0) {
        [PSCustomObject]@{
            Username = $User.Username
            DisplayName = $User.DisplayName
            AccountStatus = $User.Status
            DeviceStatus = "No device listed"
        }
    }
}
 
# Display results
Write-Host "`nDevice Summary" -ForegroundColor Yellow
Write-Host "Total devices: $TotalDevices"
Write-Host "Active devices: $($ActiveDevices.Count)"
 
Write-Host "`nPlatform Breakdown" -ForegroundColor Yellow
$PlatformSummary | Format-Table -AutoSize
 
Write-Host "`nUsers Without Listed Devices" -ForegroundColor Yellow
 
if ($UsersWithoutDevices) {
    $UsersWithoutDevices | Format-Table -AutoSize
}
else {
    Write-Host "All users have a listed device."
}
 
# Build inventory summary
$DeviceSummary = [PSCustomObject]@{
    TotalDevices = $TotalDevices
    ActiveDevices = $ActiveDevices.Count
    IOSDevices = @(
        $Phones | Where-Object {$_.Platform -eq "iOS"}
    ).Count
    AndroidDevices = @(
        $Phones | Where-Object {$_.Platform -eq "Android"}
    ).Count
    UsersWithoutDevices = @($UsersWithoutDevices).Count
}
 
# Export reports
$Phones | Export-Csv `
    "$ReportPath\device-inventory-report.csv" `
    -NoTypeInformation
 
$PlatformSummary | Export-Csv `
    "$ReportPath\device-platform-summary.csv" `
    -NoTypeInformation
 
$UsersWithoutDevices | Export-Csv `
    "$ReportPath\users-without-devices.csv" `
    -NoTypeInformation
 
$DeviceSummary | Export-Csv `
    "$ReportPath\device-summary.csv" `
    -NoTypeInformation
 
Write-Host "`nDevice inventory analysis completed!" -ForegroundColor Green
Write-Host "Reports saved to: $ReportPath"