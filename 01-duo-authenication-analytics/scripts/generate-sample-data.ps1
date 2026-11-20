 
# Duo Authentication Analytics
# Project 01 - Sample Data Generator
# Uses fictional authentication records only.
 
$ReportPath = "$HOME\Documents\Duo-Analytics\reports"
 
# Create sample authentication records
$AuthenticationData = @(
    [PSCustomObject]@{
        Username = "alex.morgan"
        Result   = "SUCCESS"
        Factor   = "Duo Push"
        App      = "Microsoft 365"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result   = "DENIED"
        Factor   = "Duo Push"
        App      = "VPN"
    },
    [PSCustomObject]@{
        Username = "taylor.smith"
        Result   = "SUCCESS"
        Factor   = "Passcode"
        App      = "Microsoft 365"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result   = "DENIED"
        Factor   = "Duo Push"
        App      = "VPN"
    }
)
 
# Analyze authentication results
$AuthenticationData |
    Group-Object Result |
    Select-Object Name, Count |
    Format-Table -AutoSize
 
# Export report
$AuthenticationData |
    Export-Csv "$ReportPath\authentication-analysis.csv" -NoTypeInformation
 
Write-Host "Authentication report successfully generated!"
 
 
$ScriptPath = "$HOME\Documents\Duo-Analytics\scripts\authentication-analysis.ps1"
 
@'
# Duo Authentication Analytics
# Project 01 - Sample Data Generator
# Uses fictional authentication records only.
 
$ReportPath = "$HOME\Documents\Duo-Analytics\reports"
 
$AuthenticationData = @(
    [PSCustomObject]@{
        Username = "alex.morgan"
        Result   = "SUCCESS"
        Factor   = "Duo Push"
        App      = "Microsoft 365"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result   = "DENIED"
        Factor   = "Duo Push"
        App      = "VPN"
    },
    [PSCustomObject]@{
        Username = "taylor.smith"
        Result   = "SUCCESS"
        Factor   = "Passcode"
        App      = "Microsoft 365"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result   = "DENIED"
        Factor   = "Duo Push"
        App      = "VPN"
    }
)
 
Write-Host "`nAuthentication Summary" -ForegroundColor Cyan
 
$AuthenticationData |
    Group-Object Result |
    Select-Object Name, Count |
    Format-Table -AutoSize
 
$AuthenticationData |
    Export-Csv "$ReportPath\authentication-analysis.csv" -NoTypeInformation
 
Write-Host "Report successfully generated!" -ForegroundColor Green
'@ | Set-Content -Path $ScriptPath -Encoding UTF8
 
Write-Host "Script created at: $ScriptPath" -ForegroundColor Green
 
 
# Project 01 - Duo Authentication Analytics
# Generate fictional Duo-style sample datasets
# No real employee or company data is used.
 
$DataPath = "$HOME\Documents\Duo-Analytics\sample-data"
 
New-Item -ItemType Directory -Force -Path $DataPath | Out-Null
 
# 1. Authentication sample data
$Authentication = @(
    [PSCustomObject]@{
        Username = "alex.morgan"
        Result = "SUCCESS"
        Factor = "Duo Push"
        Application = "Microsoft 365"
        Device = "iPhone"
        Timestamp = "2026-11-18 08:15:00"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result = "DENIED"
        Factor = "Duo Push"
        Application = "VPN"
        Device = "Android"
        Timestamp = "2026-11-18 08:30:00"
    },
    [PSCustomObject]@{
        Username = "taylor.smith"
        Result = "SUCCESS"
        Factor = "Passcode"
        Application = "Microsoft 365"
        Device = "iPhone"
        Timestamp = "2026-11-18 09:00:00"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        Result = "DENIED"
        Factor = "Duo Push"
        Application = "VPN"
        Device = "Android"
        Timestamp = "2026-11-18 09:05:00"
    },
    [PSCustomObject]@{
        Username = "alex.morgan"
        Result = "SUCCESS"
        Factor = "Duo Push"
        Application = "VPN"
        Device = "iPhone"
        Timestamp = "2026-11-18 09:30:00"
    },
    [PSCustomObject]@{
        Username = "casey.brown"
        Result = "SUCCESS"
        Factor = "Duo Push"
        Application = "Microsoft 365"
        Device = "Android"
        Timestamp = "2026-11-18 10:00:00"
    }
)
 
$Authentication | Export-Csv `
    "$DataPath\authentication-sample.csv" `
    -NoTypeInformation
 
# 2. User inventory sample data
$Users = @(
    [PSCustomObject]@{
        Username = "alex.morgan"
        DisplayName = "Alex Morgan"
        Status = "Active"
        Enrollment = "Enrolled"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        DisplayName = "Jordan Lee"
        Status = "Active"
        Enrollment = "Enrolled"
    },
    [PSCustomObject]@{
        Username = "taylor.smith"
        DisplayName = "Taylor Smith"
        Status = "Active"
        Enrollment = "Enrolled"
    },
    [PSCustomObject]@{
        Username = "casey.brown"
        DisplayName = "Casey Brown"
        Status = "Active"
        Enrollment = "Not Enrolled"
    },
    [PSCustomObject]@{
        Username = "morgan.jones"
        DisplayName = "Morgan Jones"
        Status = "Disabled"
        Enrollment = "Enrolled"
    }
)
 
$Users | Export-Csv `
    "$DataPath\users-sample.csv" `
    -NoTypeInformation
 
# 3. Phone and device inventory sample data
$Phones = @(
    [PSCustomObject]@{
        Username = "alex.morgan"
        DeviceType = "Smartphone"
        Platform = "iOS"
        DeviceName = "iPhone"
        Status = "Active"
    },
    [PSCustomObject]@{
        Username = "jordan.lee"
        DeviceType = "Smartphone"
        Platform = "Android"
        DeviceName = "Samsung Galaxy"
        Status = "Active"
    },
    [PSCustomObject]@{
        Username = "taylor.smith"
        DeviceType = "Smartphone"
        Platform = "iOS"
        DeviceName = "iPhone"
        Status = "Active"
    },
    [PSCustomObject]@{
        Username = "casey.brown"
        DeviceType = "Smartphone"
        Platform = "Android"
        DeviceName = "Google Pixel"
        Status = "Active"
    }
)
 
$Phones | Export-Csv `
    "$DataPath\phones-sample.csv" `
    -NoTypeInformation
 
Write-Host ""
Write-Host "Duo sample datasets generated successfully!" -ForegroundColor Green
 
Get-ChildItem $DataPath
 