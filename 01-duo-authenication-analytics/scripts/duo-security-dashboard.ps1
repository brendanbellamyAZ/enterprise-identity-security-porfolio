# Duo Security Analytics Dashboard
# Educational project using fictional sample data.
# Compatible with Windows PowerShell 5.1.
 
$BasePath = "$HOME\Documents\Duo-Analytics"
$DataPath = Join-Path $BasePath "sample-data"
$ReportPath = Join-Path $BasePath "reports"
 
# Import fictional datasets
$auth = @(Import-Csv (Join-Path $DataPath "authentication-sample.csv"))
$users = @(Import-Csv (Join-Path $DataPath "users-sample.csv"))
$phones = @(Import-Csv (Join-Path $DataPath "phones-sample.csv"))
 
# Authentication metrics
$success = @($auth | Where-Object { $_.Result -eq "SUCCESS" }).Count
$denied = @($auth | Where-Object { $_.Result -eq "DENIED" }).Count
 
# Identify users with repeated denied authentication attempts
$repeatFailures = @(
    $auth |
    Where-Object { $_.Result -eq "DENIED" } |
    Group-Object Username |
    Where-Object { $_.Count -ge 2 } |
    ForEach-Object {
        [PSCustomObject]@{
            Username = $_.Name
            DeniedAttempts = $_.Count
        }
    }
)
 
# User metrics and review list
$activeUsers = @($users | Where-Object { $_.Status -eq "Active" }).Count
$disabledUsers = @($users | Where-Object { $_.Status -eq "Disabled" }).Count
$notEnrolled = @($users | Where-Object { $_.Enrollment -eq "Not Enrolled" }).Count
 
$reviewUsers = @(
    $users | Where-Object {
        $_.Status -eq "Disabled" -or $_.Enrollment -eq "Not Enrolled"
    }
)
 
# Device metrics
$activeDevices = @($phones | Where-Object { $_.Status -eq "Active" }).Count
$iosDevices = @($phones | Where-Object { $_.Platform -eq "iOS" }).Count
$androidDevices = @($phones | Where-Object { $_.Platform -eq "Android" }).Count
 
# Identify users without registered devices
$deviceUsernames = @($phones | Select-Object -ExpandProperty Username -Unique)
 
$usersWithoutDevices = @(
    $users | Where-Object {
        $deviceUsernames -notcontains $_.Username
    } | Select-Object Username, DisplayName, Status
)
 
# Application activity
$applicationSummary = @(
    $auth |
    Group-Object Application |
    ForEach-Object {
        [PSCustomObject]@{
            Application = $_.Name
            AuthenticationEvents = $_.Count
        }
    }
)
 
# Build HTML tables
$authTable = $auth | ConvertTo-Html -Fragment -Property Username, Result, Factor, Application, Device, Timestamp
$repeatTable = $repeatFailures | ConvertTo-Html -Fragment
$userTable = $reviewUsers | Select-Object Username, DisplayName, Status, Enrollment | ConvertTo-Html -Fragment
$deviceTable = $phones | ConvertTo-Html -Fragment -Property Username, DeviceType, Platform, DeviceName, Status
$missingDeviceTable = $usersWithoutDevices | ConvertTo-Html -Fragment
$appTable = $applicationSummary | ConvertTo-Html -Fragment
 
# Create dashboard HTML
$html = @"
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Duo Security Analytics Dashboard</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: #f3f5f8;
    color: #222;
    margin: 30px;
}
h1 { color: #17365d; }
h2 {
    color: #17365d;
    border-bottom: 2px solid #d5dce5;
    padding-bottom: 8px;
}
.cards {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    margin: 20px 0;
}
.card {
    background: white;
    padding: 18px;
    border-radius: 8px;
    min-width: 145px;
    box-shadow: 0 2px 5px #ccc;
}
.metric {
    font-size: 28px;
    font-weight: bold;
    color: #176b87;
}
table {
    border-collapse: collapse;
    width: 100%;
    background: white;
    margin-bottom: 25px;
}
th, td {
    border: 1px solid #ddd;
    padding: 9px;
    text-align: left;
}
th {
    background: #17365d;
    color: white;
}
.note {
    background: #fff3cd;
    padding: 12px;
    border-radius: 6px;
}
</style>
</head>
<body>
 
<h1>Duo Security Analytics Dashboard</h1>
<p>Enterprise Identity Security Portfolio | Synthetic Training Data</p>
 
<div class="note">
<strong>Data notice:</strong> This dashboard uses fictional sample data.
It does not connect to a live Duo environment.
</div>
 
<h2>Security Overview</h2>
<div class="cards">
<div class="card">Total Authentication Events<div class="metric">$($auth.Count)</div></div>
<div class="card">Successful Events<div class="metric">$success</div></div>
<div class="card">Denied Events<div class="metric">$denied</div></div>
<div class="card">Users Requiring Review<div class="metric">$($reviewUsers.Count)</div></div>
<div class="card">Active Devices<div class="metric">$activeDevices</div></div>
</div>
 
<h2>Authentication Activity</h2>
<p>Repeated denied attempts: $($repeatFailures.Count) user(s)</p>
$repeatTable
 
<h3>Authentication Records</h3>
$authTable
 
<h2>User Account Review</h2>
<p>Active: $activeUsers | Disabled: $disabledUsers | Not Enrolled: $notEnrolled</p>
$userTable
 
<h2>Device Inventory</h2>
<p>iOS devices: $iosDevices | Android devices: $androidDevices</p>
$deviceTable
 
<h3>Users Without Registered Devices</h3>
$missingDeviceTable
 
<h2>Application Activity</h2>
$appTable
 
<p>Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")</p>
</body>
</html>
"@
 
# Save dashboard
$DashboardFile = Join-Path $ReportPath "duo-security-dashboard.html"
 
$html | Set-Content -Path $DashboardFile -Encoding UTF8
 
Write-Host ""
Write-Host "Duo Security Dashboard successfully generated!" -ForegroundColor Green
Write-Host "Location: $DashboardFile" -ForegroundColor Cyan