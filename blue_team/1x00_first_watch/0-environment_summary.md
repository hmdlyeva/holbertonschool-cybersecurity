# Structured Environment Summary
**Organization:** MedDefense Health Systems  
**Prepared for:** Security Analyst Onboarding  
**Source:** Internal Documentation Packet  

---

# 1. Organization Overview

## Organization Description
MedDefense Health Systems is a healthcare organization with approximately **2,000 employees** operating across **three locations**. The organization provides hospital care, outpatient medical services, and corporate administrative operations.

## Sites

### MedDefense Central Hospital
- **Location Type:** Downtown hospital
- **Function:** Primary acute-care hospital
- **Capacity:** 350 beds
- **Approximate Staff:** ~1,400 employees
- **Departments:**
  - Emergency
  - Surgery
  - Cardiology
  - Radiology
  - Oncology
  - Pediatrics
  - Maternity
  - Pharmacy
  - Laboratory
  - Administration
- **Building Details:**
  - 6 floors plus basement
  - Basement includes mechanical infrastructure and server room
- **Parking:**
  - Underground garage for staff
  - Surface parking lot for visitors

### Westside Clinic
- **Location Type:** Suburban outpatient clinic
- **Distance from Central Hospital:** Approximately 12 minutes
- **Function:** Outpatient healthcare services
- **Approximate Staff:** ~180 employees
- **Services Provided:**
  - Primary care
  - Diagnostic imaging (X-ray and ultrasound)
  - Blood work
  - Minor procedures
  - Physical therapy
- **Building Details:**
  - Two-story medical office complex
  - Shared parking with adjacent retail plaza
- **IT Note:**
  - Shares some IT services with Central Hospital
  - Has a local server closet for basic needs

### Corporate Headquarters
- **Location:** Greenfield Business Park (~15 minutes from Central Hospital)
- **Function:** Corporate administrative operations
- **Approximate Staff:** ~220 employees
- **Departments:**
  - Finance
  - Human Resources
  - Legal
  - Marketing
  - Executive Leadership
  - IT Department
- **Building Details:**
  - Leased office space
  - Located on the 3rd floor of a 5-story commercial building

## Organizational Structure Relevant to Security

### Executive Leadership
- CEO: Dr. Patricia Morales
- CFO: Robert Kim
- COO: Angela Torres
- General Counsel: David Park

### Security Leadership
- CISO: Position currently vacant
- Deputy CISO: James Chen (acting security lead)

### IT Leadership
- IT Director: Sarah Park

### IT Department Staff
- 3 System Administrators
- 2 Network Technicians
- 1 Database Administrator
- 2 Helpdesk Analysts
- 2 Desktop Support Technicians
- 1 IT Intern (vacant)

### Governance Note
The Deputy CISO and IT Director operate as **peer roles**. Security policy authority exists under the Deputy CISO, while IT infrastructure operations remain under the IT Director.

---

# 2. IT Infrastructure Identified

## Servers

### Central Hospital Servers
- ehr-srv-01 – Ubuntu 20.04 LTS – Electronic Health Record application server
- ehr-db-01 – Ubuntu 20.04 LTS – EHR PostgreSQL database
- pacs-srv-01 – Windows Server 2016 – PACS imaging server
- billing-srv-01 – Ubuntu 18.04 LTS – Billing and claims processing server
- ad-dc-01 – Windows Server 2019 – Primary Active Directory domain controller
- ad-dc-02 – Windows Server 2019 – Secondary Active Directory domain controller
- file-srv-01 – Windows Server 2016 – Department file share server
- print-srv-01 – Windows Server 2012 R2 – Print server (unverified)
- backup-srv-01 – Ubuntu 22.04 LTS – Backup server running Veeam agent
- web-srv-01 – Ubuntu 20.04 LTS – Public website and patient portal server

### Westside Clinic Servers
- ws-srv-01 – Windows Server 2016 – Local file server and scheduling system
- Possible additional server mentioned but not confirmed

### Corporate Headquarters
- No on-premise servers
- Staff connect to Central Hospital infrastructure via site-to-site VPN
- Cloud services used for productivity systems

---

## Network Infrastructure

### Central Hospital
- Firewall: Fortinet FortiGate 100F
- Core switch: Cisco core switch (model unknown)
- Access switches: Approximately two Cisco access switches per floor
- Wireless network: 12 Ubiquiti UniFi access points
- Network architecture:
  - Flat network design
  - Address space: 10.10.0.0/16
  - No VLAN segmentation

### Westside Clinic
- Router: Netgear Nighthawk consumer-grade router
- Switch: Unmanaged switch (brand unknown)
- Firewall: None
- Connectivity: IPSec VPN connection to Central Hospital

### Corporate Headquarters
- Network managed by building landlord
- MedDefense operates within a dedicated VLAN
- Site-to-site VPN connection to Central Hospital

---

## Endpoint Devices

### Central Hospital
- ~320 Windows 10 workstations
- ~60 thin clients in clinical areas
- ~25 iPads used by physicians

### Westside Clinic
- ~45 Windows 10 workstations

### Corporate Headquarters
- ~120 Windows 10 or Windows 11 workstations
- ~30 laptops

---

## Medical Devices (IoT)

- Philips IntelliVue patient monitors (~80 units)
- BD Alaris infusion pumps (~120 units)
- Siemens MAGNETOM MRI scanner (runs Windows XP)
- GE Revolution CT scanner (operating system unknown)
- IP-based nurse call system
- HID Global badge access system integrated with Active Directory for some doors

---

# 3. Data and Services

## Types of Data Handled

### Patient Data
- Electronic Health Records (EHR)
- Diagnostic results
- Medical imaging data
- Treatment histories
- Patient portal records

### Clinical Device Data
- Patient monitoring telemetry
- Infusion pump configuration and dosage updates

### Administrative Data
- Billing and insurance claims
- Financial records
- HR records
- Legal documentation

### IT and Security Data
- Active Directory authentication data
- Department file shares
- System backups

---

## Critical Services

### Clinical Services
- Electronic Health Record system
- PACS medical imaging system
- Network-connected medical device systems
- Nurse call communication system

### Administrative Services
- Billing and claims processing systems
- Department file sharing
- Print services
- Active Directory authentication services

### External Services
- Public website
- Patient portal

### Enterprise Services
- Microsoft 365 (O365 E3)
- Sophos endpoint protection
- Veeam backup system
- VPN connectivity between sites

---

## Primary Users of Services
- Physicians
- Nurses
- Radiology staff
- Administrative staff
- IT personnel
- Patients using the patient portal

---

# 4. Known Unknowns

## Asset Inventory Gaps
- IT asset inventory explicitly marked as incomplete
- Some servers listed as unverified
- Endpoint numbers based on outdated Active Directory report
- Management status of iPads unclear
- Possible additional server at Westside not confirmed

## Network Information Gaps
- Network diagram described as simplified
- Cisco core switch model not documented
- Guest WiFi isolation not verified
- Wireless infrastructure at Westside unknown

## Security Configuration Gaps
- VPN access control lists not audited
- Endpoint protection deployment status uncertain
- SSH configuration not fully hardened on Linux servers
- Database access restrictions not implemented

## Medical Device Security Gaps
- CT scanner operating system unknown
- Medical devices located on same network as other systems
- Security configuration of IoT devices undocumented

## Physical Security Gaps
- Server room accessible using generic employee badges
- No cameras in server room corridor
- Westside server closet does not lock
- Physical access monitoring status unknown

## Compliance and Governance Gaps
- No formal HIPAA Security Rule assessment
- No documented incident response plan
- No business continuity plan
- No disaster recovery plan

## Cloud Services Gaps
- Microsoft 365 confirmed
- Other departmental cloud services not documented

## Backup and Recovery Gaps
- Backups stored on NAS in same rack as backup server
- No confirmed offsite backups
- Disaster recovery procedures not documented