Duo Security Analytics - Technical Architecture

1. Architecture Overview

This project demonstrates a simulated identity security analytics workflow using fictional Duo Security authentication, user, and device records.

The solution uses PowerShell to process identity data, identify potential security concerns, and generate structured reports and an HTML dashboard.

2. Architecture Diagram

flowchart TD
    A["Fictional Authentication Data"]
    B["Fictional User Data"]
    C["Fictional Device Data"]

    D["PowerShell Analytics Scripts"]

    E["Authentication Analysis"]
    F["User Account Analysis"]
    G["Device Inventory Analysis"]

    H["CSV Security Reports"]
    I["Consolidated HTML Dashboard"]

    A --> D
    B --> D
    C --> D

    D --> E
    D --> F
    D --> G

    E --> H
    F --> H
    G --> H

    H --> I

3. Data Sources

The solution processes three fictional datasets.

Dataset| Purpose
Authentication Records| Analyze authentication outcomes and activity
User Records| Review account status and enrollment
Device Records| Analyze registered devices and platforms

4. Processing Components

Authentication Analysis

Processes authentication records to identify successful and denied authentication events, repeated failures, and application activity.

User Account Analysis

Evaluates user account status and enrollment information to identify accounts that may require administrative review.

Device Inventory Analysis

Processes device records to identify registered devices, operating system platforms, and users without registered devices.

5. Reporting Layer

PowerShell generates structured CSV reports for each analytics category.

The consolidated HTML dashboard presents key metrics and detailed records through a browser-based interface.

6. Security Considerations

- Uses fictional training data.
- Does not connect to a production Duo environment.
- Does not contain real employee information.
- Does not store authentication credentials or API secrets.
- Identifies records for review rather than automatically changing user access.

7. Future Enhancements

Potential improvements include:

- Authorized Duo Admin API integration using a dedicated test environment.
- Microsoft Entra ID identity reporting.
- Automated authentication anomaly detection.
- Scheduled reporting and notifications.
- Centralized identity security analytics.

8. Skills Demonstrated

- Identity and Access Management
- Authentication monitoring
- Identity security reporting
- PowerShell automation
- CSV data processing
- Security analysis
- Technical documentation
- GitHub project management

Project Classification: Educational IAM and Identity Security Simulation.
