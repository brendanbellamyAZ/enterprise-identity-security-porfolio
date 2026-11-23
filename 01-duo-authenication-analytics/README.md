Duo Security Authentication Analytics

Project Overview

This project demonstrates practical Identity and Access Management (IAM) and Identity Security reporting using PowerShell, CSV datasets, and HTML reporting.

The project simulates an enterprise Duo Security analytics environment using fictional authentication, user, and device records.

The objective is to demonstrate how identity administrators and security teams can analyze authentication activity, identify account risks, review device enrollment, and generate security reports.

Important: This is an educational simulation using fictional data. It does not connect to a live Duo Security environment or contain actual company or employee information.

Technical Skills Demonstrated

- PowerShell scripting and automation
- Identity and Access Management (IAM)
- Authentication monitoring and analysis
- User account and enrollment reviews
- Device inventory reporting
- Security event analysis
- CSV data processing
- HTML dashboard generation
- Security reporting and documentation

Project Components

1. Authentication Analytics

Analyzes authentication records to identify:

- Successful authentication events
- Denied authentication attempts
- Repeated authentication failures
- Application authentication activity

2. User Activity Reporting

Analyzes user records to identify:

- Active accounts
- Disabled accounts
- Users not enrolled in authentication
- Accounts requiring administrative review

3. Device Inventory Reporting

Analyzes registered device information to identify:

- Device inventory
- iOS and Android device distribution
- Active devices
- Users without registered devices

4. Security Analytics Dashboard

A consolidated HTML dashboard combines authentication, user, and device information into one reporting interface.

The dashboard provides an overview of identity activity and highlights records that may require further investigation.

Repository Structure

01-duo-authentication-analytics/
│
├── README.md
│
├── scripts/
│   ├── generate-sample-data.ps1
│   ├── duo-authentication-logs.ps1
│   ├── duo-user-report.ps1
│   ├── duo-phone-report.ps1
│   └── duo-security-dashboard.ps1
│
├── sample-data/
│   ├── authentication-sample.csv
│   ├── users-sample.csv
│   └── phones-sample.csv
│
└── reports/
    └── duo-security-dashboard.html

Tools and Technologies

Technology| Purpose
PowerShell 5.1| Reporting and automation
CSV| Structured sample datasets
HTML| Security dashboard
GitHub| Source control and project documentation
Duo Security concepts| Authentication and identity monitoring

How to Run the Project

Requirements

- Windows PowerShell 5.1 or later
- Windows operating system
- GitHub repository or local project copy

Step 1: Generate Sample Data

Run:

.\scripts\generate-sample-data.ps1

Step 2: Generate Authentication Reports

.\scripts\duo-authentication-logs.ps1

Step 3: Generate User Reports

.\scripts\duo-user-report.ps1

Step 4: Generate Device Reports

.\scripts\duo-phone-report.ps1

Step 5: Generate the Consolidated Dashboard

.\scripts\duo-security-dashboard.ps1

Open the generated HTML dashboard in a web browser.

Security and Data Protection

This project uses fictional sample records created for educational purposes.

No real employee information, authentication logs, credentials, API secrets, or proprietary company information is included.

The project demonstrates reporting concepts and does not represent a production integration with Duo Security.

Project Goals

This project was developed to demonstrate practical capabilities relevant to:

- Identity and Access Management
- Identity Security Analysis
- Authentication Monitoring
- Access Governance
- Security Operations
- PowerShell Automation

Future Enhancements

- Authorized Duo Admin API integration using a dedicated test environment
- Automated authentication anomaly detection
- Expanded identity security reporting
- Scheduled report generation
- Integration with Microsoft Entra ID identity reporting

Author

Enterprise Identity Security Portfolio

Demonstrating practical IAM, identity administration, security reporting, and automation skills.