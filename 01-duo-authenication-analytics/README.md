
Project 01: Duo Authentication Analytics

Project Overview

This project focuses on retrieving, analyzing, and reporting identity authentication data using the Duo Security Admin API.

The objective is to develop a practical identity security analytics solution that helps administrators understand authentication activity, monitor user access, and review registered devices.

The solution will use API integration, PowerShell automation, structured data analysis, and reporting.

Project Objectives

- Retrieve authentication logs through the Duo Admin API.
- Retrieve user information and account details.
- Retrieve registered phone and device information.
- Analyze authentication activity and trends.
- Identify unsuccessful authentication attempts.
- Generate structured reports for security review.
- Document the API integration and reporting workflow.

Technologies

Technology| Purpose
Duo Security Admin| Identity administration
Duo Admin API| Retrieve identity and authentication data
PowerShell| Automation and data processing
JSON| API response format
CSV| Report storage and analysis
GitHub| Project documentation and version control

Project Components

1. Authentication Log Analysis

Retrieve and analyze authentication events.

Planned reporting fields:

- Username
- Authentication date and time
- Authentication result
- Authentication factor
- Access device
- Application
- Authentication location, when available

2. User Activity Reporting

Retrieve user information and organize account activity data.

Planned reporting fields:

- User ID
- Username
- Display name
- Account status
- Enrollment information, when available

3. Phone and Device Reporting

Retrieve registered phone and device information.

Planned reporting fields:

- User association
- Device type
- Platform
- Device identifier
- Enrollment information, when available

4. Security Analytics

Analyze authentication records to identify:

- Failed authentication attempts
- Authentication trends
- Unusual activity patterns
- Device enrollment information
- Potential account access concerns

These findings are indicators for further review, not automatic proof of compromise.

Repository Structure

01-duo-authentication-analytics/
|
|-- README.md
|
|-- scripts/
|   |-- duo-authentication-logs.ps1
|   |-- duo-user-report.ps1
|   |-- duo-phone-report.ps1
|   |-- duo-api-functions.ps1
|
|-- sample-data/
|   |-- authentication-sample.csv
|   |-- users-sample.csv
|   |-- phones-sample.csv
|
|-- reports/
|   |-- authentication-analysis.csv
|   |-- user-activity-report.csv
|   |-- device-inventory-report.csv
|
|-- screenshots/

Security Considerations

- API credentials must never be committed to GitHub.
- Use authorized Duo API integrations with the minimum required permissions.
- Use fictional or sanitized sample data for public demonstrations.
- Protect authentication logs and personally identifiable information.
- Store credentials securely using appropriate secret-management practices.

Expected Deliverables

1. Working Duo Admin API integration.
2. PowerShell reporting scripts.
3. Authentication analytics reports.
4. User activity reports.
5. Phone and device inventory reports.
6. Technical documentation.
7. Screenshots demonstrating project functionality.

Project Status

In Progress

Disclaimer

This project is intended for educational and professional portfolio purposes. Demonstrations will use authorized lab environments and fictional sample data. No proprietary company information or confidential authentication records will be published.