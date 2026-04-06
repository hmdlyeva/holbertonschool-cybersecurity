# Structured Environment Summary
**Organization:** MedDefense Health Systems  
**Prepared by:** Security Analyst  
**Source:** Internal Onboarding Documentation Packet  

---

# 1. Organization Overview

## Organizational Summary
MedDefense Health Systems is a healthcare organization operating **three primary locations** and employing approximately **2,000 employees** across clinical, outpatient, and administrative functions. The organization provides hospital services, outpatient care, and corporate administrative operations.

Security governance is partially separated from IT operations. The **CISO role is currently vacant**, and the **Deputy CISO (James Chen)** is acting as the security lead. The **IT Director (Sarah Park)** manages infrastructure and operations. Security policy authority and operational control are split between these roles.

---

## Sites

### MedDefense Central Hospital
- **Location Type:** Downtown acute-care hospital
- **Capacity:** 350 beds
- **Approximate Staff:** ~1,400
- **Primary Function:** Main clinical and hospital operations

**Departments**
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

**Building Details**
- 6 floors plus basement
- Basement includes mechanical infrastructure and server room

**Facilities**
- Underground parking garage for staff
- Surface parking lot for visitors

---

### Westside Clinic
- **Location Type:** Suburban outpatient clinic
- **Distance from Central:** ~12 minutes
- **Approximate Staff:** ~180
- **Primary Function:** Outpatient medical services

**Services**
- Primary care
- Diagnostic imaging (X-ray and ultrasound only)
- Blood work
- Minor procedures
- Physical therapy

**Building Details**
- Two-story medical office complex
- Shared parking with retail plaza

**IT Characteristics**
- Shares some IT services with Central Hospital
- Maintains a **local server closet for basic services**

---

### Corporate Headquarters
- **Location Type:** Administrative office
- **Location:** Greenfield Business Park (~15 minutes from Central)
- **Approximate Staff:** ~220
- **Primary Function:** Corporate and administrative operations

**Departments**
- Finance
- Human Resources
- Legal
- Marketing
- Executive Leadership
- IT Department

**Building Details**
- Leased office space
- Located on the **3rd floor of a 5-story commercial building**

---

## Security and IT Reporting Structure

**CEO:** Dr. Patricia Morales  

### Executive Leadership
- **CFO:** Robert Kim
- **COO:** Angela Torres  
  - Oversees clinical directors
- **General Counsel:** David Park

### Security Leadership
- **CISO:** Vacant
- **Deputy CISO:** James Chen (acting security lead)
  - Responsible for security policy
  - Oversees the **Security Analyst** position

### IT Department (Director: Sarah Park)

Team composition:
- 3 System Administrators
- 2 Network Technicians
- 1 Database Administrator
- 2 Helpdesk Analysts (including lead Mike Torres)
- 2 Desktop Support Technicians
- 1 IT Intern (vacant)

**Governance Note**

James Chen (Deputy CISO) and Sarah Park (IT Director) are **peers**.  
Security leadership has authority over **policy**, but **IT operations remain under the IT department**, creating potential coordination challenges.

---

# 2. IT Infrastructure Identified

## Servers

### Central Hospital

| Server | OS | Function | Location |
|------|------|------|------|
| ehr-srv-01 | Ubuntu 20.04 LTS | Electronic Health Record application server | Central |
| ehr-db-01 | Ubuntu 20.04 LTS | EHR PostgreSQL database | Central |
| pacs-srv-01 | Windows Server 2016 | Medical imaging PACS server | Central |
| billing-srv-01 | Ubuntu 18.04 LTS | Billing and claims processing | Central |
| ad-dc-01 | Windows Server 2019 | Primary domain controller | Central |
| ad-dc-02 | Windows Server 2019 | Secondary domain controller | Central |
| file-srv-01 | Windows Server 2016 | Department file shares | Central |
| print-srv-01 | Windows Server 2012 R2 | Print server (unverified) | Central |
| backup-srv-01 | Ubuntu 22.04 LTS | Backup server running Veeam | Central |
| web-srv-01 | Ubuntu 20.04 LTS | Public website and patient portal | Central |

**Backup System**
- Veeam nightly backups
- Backups stored on **local NAS in the same server room and rack**

---

### Westside Clinic

| Server | OS | Function | Location |
|------|------|------|------|
| ws-srv-01 | Windows Server 2016 | Local file server and scheduling system | Westside |

**Possible Additional Server**
- Mentioned by staff but **not confirmed**

---

### Corporate HQ
- **No on-premise servers**
- Staff connect to Central systems via **site-to-site VPN**
- Many services provided through **cloud platforms**

---

## Network Infrastructure

### Central Hospital
- **Firewall:** Fortinet FortiGate 100F
- **Core Switch:** Cisco core switch (model unknown)
- **Access Switches:** 2 Cisco switches per floor
- **Wireless:** 12 Ubiquiti UniFi access points

**Network Architecture**
- Flat network design
- Address range: **10.10.0.0/16**
- No VLAN segmentation

---

### Westside Clinic
- **Router:** Netgear Nighthawk (consumer grade)
- **Switch:** Unmanaged switch
- **Firewall:** None
- **Connectivity:** IPSec VPN tunnel to Central

---

### Corporate Headquarters
- Network managed by building landlord
- MedDefense operates within a **dedicated VLAN**
- Site-to-site VPN connection to Central

---

## Endpoints

### Central Hospital
- ~320 Windows 10 workstations
- ~60 thin clients
- ~25 iPads used by physicians

### Westside Clinic
- ~45 Windows 10 workstations

### Corporate HQ
- ~120 Windows 10/11 workstations
- ~30 laptops

---

## Medical Devices (IoT)

| Device | Quantity | Notes | Location |
|------|------|------|------|
| Philips IntelliVue patient monitors | ~80 | Network connected | Central |
| BD Alaris infusion pumps | ~120 | Network connected for dosage updates | Central |
| Siemens MAGNETOM MRI | 1 | Runs Windows XP | Central |
| GE Revolution CT scanner | 1 | OS unknown | Central |
| Nurse call system | Unknown | IP-based phone integration | Central |
| HID Global badge system | Unknown | Connected to Active Directory for some doors | Multiple |

---

# 3. Data and Services

## Types of Data

### Patient Data
- Electronic Health Records
- Diagnostic results
- Medical imaging
- Treatment histories
- Patient portal information

### Clinical Device Data
- Patient monitoring telemetry
- Infusion pump configuration and dosage updates

### Administrative Data
- Billing and insurance claims
- Financial records
- HR data
- Legal documentation

### IT and Security Data
- Active Directory user authentication data
- Department file shares
- System backups

---

## Critical Services

### Clinical Systems
- Electronic Health Record system
- PACS imaging system
- Network-connected medical devices
- Nurse call system

### Administrative Systems
- Billing and claims processing
- File sharing
- Printing
- Active Directory authentication

### Public Services
- Hospital website
- Patient portal

### Enterprise Services
- Microsoft 365 (O365 E3)
- Sophos endpoint protection
- Veeam backup system
- VPN connectivity between sites

---

## Primary Users

| User Group | Systems Used |
|------|------|
| Physicians | EHR, PACS, iPads |
| Nurses | EHR, nurse call system |
| Radiology staff | PACS imaging |
| Administrative staff | Billing, file shares, Microsoft 365 |
| IT staff | Infrastructure and systems management |
| Patients | Patient portal |

---

# 4. Known Unknowns

## Asset Inventory Gaps
- Asset inventory is **explicitly incomplete**
- Some servers marked **unverified for over a year**
- Endpoint numbers based on **8-month-old AD report**
- Management status of iPads unclear
- Possible **additional Westside server not confirmed**

---

## Network Architecture Gaps
- Network diagram labeled **simplified and incomplete**
- Cisco core switch model unknown
- Actual topology may differ from documented diagram
- Guest WiFi isolation **not verified**
- Wireless infrastructure at Westside **unknown**

---

## Security Configuration Gaps
- VPN access control lists not audited
- Endpoint security status unclear
- SSH hardening incomplete across Linux servers
- PostgreSQL database accessible from entire internal network

---

## Medical Device Security
- CT scanner operating system unknown
- Medical devices not segmented from corporate network
- Security configuration of IoT devices undocumented

---

## Physical Security Gaps
- Server room accessible using **generic employee badges**
- No cameras in server room corridor
- Westside server closet **does not lock**
- Physical access monitoring unclear

---

## Compliance and Governance
- No formal **HIPAA Security Rule assessment**
- No **incident response plan**
- No **business continuity plan**
- No **disaster recovery plan**

---

## Cloud Services
- Confirmed service: **Microsoft 365**
- Other departmental cloud services may exist but are not documented

---

## Backup and Recovery
- Backups stored on NAS in **same rack as backup server**
- No confirmed **offsite or cloud backups**
- Disaster recovery testing status unknown

---

# Summary

MedDefense Health Systems operates three facilities supporting approximately 2,000 employees and delivering hospital, outpatient, and administrative services. Central Hospital hosts the majority of the IT infrastructure supporting clinical and business operations.

Documentation reveals several visibility and governance gaps including incomplete asset inventory, flat network architecture, legacy medical devices, and lack of formal security programs. A full asset discovery, network segmentation initiative, and formal compliance assessment would be necessary to obtain a complete security posture for the organization.