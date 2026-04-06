# Structured Environment Summary

**Organization:** MedDefense Health Systems  
**Prepared by:** Security Analyst  
**Source:** Internal Onboarding Documentation Packet  
**Primary Source File:** `0-environment_summary.md`

---

# 1. Organization Overview

## Identified Organization Sites

The onboarding documentation identifies **three primary organizational sites**:

1. **MedDefense Central Hospital**
2. **Westside Clinic**
3. **Corporate Headquarters**

These sites represent the full operational footprint of MedDefense Health Systems.

---

## Site Details

### MedDefense Central Hospital

- Type: Downtown hospital facility
- Role: Primary acute care hospital
- Capacity: Approximately **350 beds**
- Staff: Approximately **1,400 employees**

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

**Building Characteristics**

- 6 floors plus basement
- Basement contains **mechanical systems and the primary server room**

---

### Westside Clinic

- Type: Suburban outpatient clinic
- Distance from Central Hospital: ~12 minutes
- Staff: Approximately **180 employees**

**Services**

- Primary care
- Diagnostic imaging (X-ray and ultrasound)
- Blood work
- Minor procedures
- Physical therapy

**Building Characteristics**

- 2-story medical office building
- Shared parking with nearby retail plaza

---

### Corporate Headquarters

- Type: Administrative office
- Location: Greenfield Business Park
- Staff: Approximately **220 employees**
- Office Space: **3rd floor of a 5-story commercial building**

**Departments**

- Finance
- Human Resources
- Legal
- Marketing
- Executive Leadership
- IT Department

---

## Organization Summary

- **Total Employees:** ~2,000  
- **Total Sites:** 3  
- **Primary Operations:** Healthcare services, outpatient services, and corporate administration.

---

# 2. IT Infrastructure Identified

## Extracted IT Systems

The onboarding documentation identifies multiple IT systems.  
At least **five distinct systems are confirmed**, including:

- `ehr-srv-01` — Electronic Health Record application server
- `ehr-db-01` — Electronic Health Record database server
- `pacs-srv-01` — Medical imaging PACS server
- `billing-srv-01` — Billing and claims processing server
- `ad-dc-01` — Primary Active Directory domain controller
- `ad-dc-02` — Secondary Active Directory domain controller
- `file-srv-01` — Department file sharing server
- `print-srv-01` — Network print server
- `backup-srv-01` — Backup infrastructure server
- `web-srv-01` — Public website and patient portal server
- `ws-srv-01` — Westside Clinic local server

These systems support **clinical, administrative, and public-facing services**.

---

## Server Infrastructure

### Central Hospital Servers

| Server Name | Operating System | Function |
|--------------|-----------------|----------|
| ehr-srv-01 | Ubuntu 20.04 LTS | EHR Application |
| ehr-db-01 | Ubuntu 20.04 LTS | EHR Database |
| pacs-srv-01 | Windows Server 2016 | Imaging System |
| billing-srv-01 | Ubuntu 18.04 LTS | Billing System |
| ad-dc-01 | Windows Server 2019 | Domain Controller |
| ad-dc-02 | Windows Server 2019 | Secondary Domain Controller |
| file-srv-01 | Windows Server 2016 | File Shares |
| print-srv-01 | Windows Server 2012 R2 | Print Services |
| backup-srv-01 | Ubuntu 22.04 LTS | Backup System |
| web-srv-01 | Ubuntu 20.04 LTS | Website / Patient Portal |

---

### Westside Clinic Server

| Server Name | Operating System | Function |
|--------------|-----------------|----------|
| ws-srv-01 | Windows Server 2016 | Local file and scheduling server |

---

## Network Infrastructure

### Central Hospital

- Firewall: **Fortinet FortiGate 100F**
- Core Switch: **Cisco core switch (model unspecified)**
- Access Switches: Cisco switches on each floor
- Wireless: **Ubiquiti UniFi access points**

**Network Characteristics**

- Flat network architecture
- Address space: `10.10.0.0/16`
- No VLAN segmentation currently implemented

---

### Westside Clinic

- Router: **Netgear Nighthawk**
- Switch: **Unmanaged switch**
- Firewall: **None**
- Connectivity: **IPSec VPN to Central Hospital**

---

### Corporate Headquarters

- Network managed by building operator
- MedDefense connected through **dedicated VLAN**
- Secure **site-to-site VPN** connection to Central Hospital

---

## Endpoint Devices

### Central Hospital

- ~320 Windows workstations
- ~60 thin clients
- ~25 iPads used by physicians

### Westside Clinic

- ~45 Windows workstations

### Corporate Headquarters

- ~120 workstations
- ~30 laptops

---

## Medical Network Devices

Examples of network-connected medical equipment include:

- Philips IntelliVue patient monitors
- BD Alaris infusion pumps
- Siemens MAGNETOM MRI scanner
- GE Revolution CT scanner

These devices support patient monitoring and medical imaging operations.

---

# 3. Data and Services

## Types of Data

### Patient Data

- Electronic Health Records (EHR)
- Diagnostic imaging
- Laboratory results
- Treatment histories

### Clinical Device Data

- Patient monitoring telemetry
- Infusion pump configuration data

### Administrative Data

- Billing records
- Insurance claims
- Financial documentation
- Human resources records

### IT Operational Data

- Active Directory authentication logs
- System backups
- Department file shares
- Security event logs

---

## Critical Services

### Clinical Services

- Electronic Health Record system
- PACS imaging system
- Medical device network connectivity
- Nurse call system

### Administrative Services

- Billing and insurance processing
- File sharing infrastructure
- Print services
- Active Directory identity management

### Public Services

- Public website
- Patient portal

### Organizational IT Services

- Microsoft 365 collaboration platform
- Endpoint protection using Sophos
- Backup operations using Veeam
- VPN connectivity between organizational sites

---

# 4. Known Unknowns

## Asset Inventory Gaps

- Complete IT asset inventory is unavailable
- Several servers marked as **unverified**
- Endpoint counts derived from older reports
- Possible additional server at Westside Clinic not confirmed

---

## Network Documentation Gaps

- Network diagrams incomplete
- Cisco core switch model unspecified
- Wireless network architecture not fully documented

---

## Security Configuration Unknowns

- VPN access rules not audited
- Endpoint protection deployment status unclear
- Database access restrictions not confirmed

---

## Medical Device Security

- Operating system of CT scanner unknown
- Network segmentation for medical devices not implemented
- Security configurations undocumented

---

## Physical Security Gaps

- Server room accessible with general employee badges
- Westside Clinic server closet lacks secure locking
- Physical access logging status unclear

---

## Compliance and Governance

- HIPAA security assessment not documented
- Incident response plan not documented
- Disaster recovery plan not documented
- Business continuity planning not confirmed

---

# Summary

The onboarding documentation for **MedDefense Health Systems** identifies **three primary organizational sites**:

- **MedDefense Central Hospital**
- **Westside Clinic**
- **Corporate HQ**

These locations represent the operational structure of the organization and support healthcare delivery, outpatient services, and corporate administration for approximately **2,000 employees**.

The documentation also identifies multiple **distinct IT systems** that support the organization’s infrastructure. Examples of these systems include:

- **ehr-srv-01** – Electronic Health Record (EHR) application server  
- **ehr-db-01** – Electronic Health Record database server  
- **pacs-srv-01** – Medical imaging PACS server  
- **billing-srv-01** – Billing and claims processing server  
- **ad-dc-01** – Primary Active Directory domain controller  
- **ad-dc-02** – Secondary Active Directory domain controller  

These systems provide critical functionality for **clinical services, identity management, imaging systems, and financial operations** across the organization.

Overall, the onboarding packet confirms the presence of **three sites and multiple IT infrastructure systems** supporting both clinical and administrative services. However, the documentation also indicates several areas where information is incomplete, including asset inventory accuracy, network architecture documentation, and certain security configuration details.