# Structured Environment Summary
**Organization:** MedDefense Health Systems  
**Prepared by:** Security Analyst  
**Source:** Internal Onboarding Documentation Packet  

---

# 1. Organization Overview

## Sites

### MedDefense Central Hospital
- **Location Type:** Downtown hospital facility  
- **Function:** Primary acute care hospital  
- **Capacity:** 350 beds  
- **Approximate Staff:** ~1,400 employees  

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
- 6 floors + basement
- Basement contains mechanical and server room

**Facilities**
- Underground parking garage (staff)
- Surface parking lot (visitors)

---

### Westside Clinic
- **Location Type:** Suburban outpatient clinic (approx. 12 minutes from Central Hospital)  
- **Function:** Outpatient healthcare facility  
- **Approximate Staff:** ~180 employees  

**Services Provided**
- Primary care
- Diagnostic imaging (X-ray and ultrasound only)
- Blood work
- Minor procedures
- Physical therapy

**Building Details**
- 2-story medical office complex
- Shared parking with adjacent retail plaza

**IT Note**
- Shares some IT services with Central Hospital
- Has a local **server closet for basic needs**

---

### Corporate Headquarters
- **Location Type:** Administrative office (Greenfield Business Park)  
- **Distance from Central:** ~15 minutes  
- **Approximate Staff:** ~220 employees  

**Departments**
- Finance
- Human Resources
- Legal
- Marketing
- Executive Leadership
- IT Department

**Building Details**
- Leased office space on the **3rd floor of a 5-story commercial building**

**IT Department**
- Total staff: **12**

---

### Organization Summary
- **Total Employees:** ~2,000
- **Total Sites:** 3
- **Primary Activities:** Healthcare delivery, outpatient services, and corporate administration

---

## Security-Relevant Reporting Structure

**CEO:** Dr. Patricia Morales  

### Executive Structure
- **CFO:** Robert Kim
- **COO:** Angela Torres  
  - Oversees clinical directors for hospital departments
- **General Counsel:** David Park

### Security and IT Structure

**CISO Position**
- Currently **vacant**

**Deputy CISO (Acting Security Lead):** James Chen
- Oversees security policy
- Reports in practice directly to the CEO

**Security Team**
- Security Analyst (new role replacing Marcus Webb)

**IT Department (IT Director: Sarah Park)**

Team composition:
- 3 System Administrators
- 2 Network Technicians
- 1 Database Administrator
- 2 Helpdesk Analysts (including lead Mike Torres)
- 2 Desktop Support Technicians
- 1 IT Intern (vacant)

**Governance Note**
- Deputy CISO and IT Director are **peers**
- Security leadership has **policy authority but no operational authority over IT**, which has caused friction.

---

# 2. IT Infrastructure Identified

## Servers

### Central Hospital Servers

| Server Name | Operating System | Function | Location |
|--------------|-----------------|----------|----------|
| ehr-srv-01 | Ubuntu 20.04 LTS | EHR Application Server | Central |
| ehr-db-01 | Ubuntu 20.04 LTS | EHR Database (PostgreSQL) | Central |
| pacs-srv-01 | Windows Server 2016 | PACS Imaging Server | Central |
| billing-srv-01 | Ubuntu 18.04 LTS | Billing and claims processing | Central |
| ad-dc-01 | Windows Server 2019 | Primary Domain Controller | Central |
| ad-dc-02 | Windows Server 2019 | Secondary Domain Controller | Central |
| file-srv-01 | Windows Server 2016 | Department file shares | Central |
| print-srv-01 | Windows Server 2012 R2 | Print server (unverified) | Central |
| backup-srv-01 | Ubuntu 22.04 LTS | Backup server running Veeam | Central |
| web-srv-01 | Ubuntu 20.04 LTS | Public website and patient portal | Central |

**Backup Infrastructure**
- Veeam performs nightly backups
- Backups stored on a **local NAS in the same server room and rack**

---

### Westside Clinic Servers

| Server Name | Operating System | Function | Location |
|--------------|-----------------|----------|----------|
| ws-srv-01 | Windows Server 2016 | Local file server and scheduling | Westside |

**Possible Additional Server**
- Mentioned by staff but **not confirmed**

---

### Corporate HQ Servers
- No on-premise servers
- Staff connect to Central infrastructure via **site-to-site VPN**
- Many services delivered through **cloud platforms**

---

## Network Infrastructure

### Central Hospital
- **Firewall:** Fortinet FortiGate 100F
- **Core Switch:** Cisco core switch (model unknown)
- **Access Switches:** 2 Cisco access switches per floor
- **Wireless Network:** 12 Ubiquiti UniFi access points

**Network Design**
- Flat network architecture
- IP range: **10.10.0.0/16**
- No VLAN segmentation

---

### Westside Clinic
- **Router:** Netgear Nighthawk consumer router
- **Switch:** Unmanaged switch (brand unknown)
- **Firewall:** None
- **Connectivity:** IPSec VPN to Central Hospital

---

### Corporate Headquarters
- Network managed by building landlord
- MedDefense operates within a **dedicated VLAN**
- Site-to-site VPN connection to Central Hospital

---

## Endpoint Devices

### Central Hospital
- ~320 Windows 10 workstations
- ~60 thin clients in clinical areas
- ~25 iPads used by physicians during rounds

### Westside Clinic
- ~45 Windows 10 workstations

### Corporate HQ
- ~120 Windows 10/11 workstations
- ~30 laptops (remote-capable)

---

## Medical Devices (IoT)

| Device | Quantity | Notes | Location |
|------|------|------|------|
| Philips IntelliVue patient monitors | ~80 | Network-connected | Central |
| BD Alaris infusion pumps | ~120 | Network-connected for dosage updates | Central |
| Siemens MAGNETOM MRI scanner | 1 | Runs Windows XP | Central |
| GE Revolution CT scanner | 1 | Operating system unknown | Central |
| Nurse call system | Unknown | IP-based system integrated with phone system | Central |
| HID Global badge system | Unknown | Integrated with Active Directory for some doors | Multiple sites |

---

# 3. Data and Services

## Types of Data Handled

### Patient Data
- Electronic Health Records (EHR)
- Medical imaging data (PACS)
- Diagnostic test results
- Treatment histories
- Patient portal information

### Clinical Device Data
- Patient monitoring information
- Infusion pump configuration and dosage updates

### Administrative and Business Data
- Billing and insurance claims
- Financial records
- HR records
- Legal documentation
- Organizational communications

### IT and Security Data
- Active Directory authentication records
- Department file shares
- System backups

---

## Critical IT Services

### Clinical Services
- Electronic Health Record system
- PACS medical imaging system
- Network connectivity for medical devices
- Nurse call system

### Administrative Services
- Billing and claims processing
- File sharing services
- Print services
- Active Directory authentication

### Public Services
- Public website
- Patient portal

### Organizational IT Services
- Microsoft 365 (O365 E3)
- Endpoint protection via Sophos
- Backup operations using Veeam
- VPN connectivity between sites

---

## Primary Users

| User Group | Systems Used |
|-----------|-------------|
| Physicians | EHR system, PACS, iPads, workstations |
| Nurses | EHR system, nurse call system, workstations |
| Radiology staff | PACS imaging system |
| Administrative staff | File shares, Microsoft 365, billing systems |
| IT staff | Infrastructure and system management tools |
| Patients | Patient portal and hospital services |

---

# 4. Known Unknowns

## Asset Inventory Gaps
- IT asset list is **explicitly incomplete**
- Several servers marked **unverified for over a year**
- Endpoint counts based on **8-month-old AD report**
- Exact number and management status of **iPads unclear**
- Possible **additional server at Westside not confirmed**

---

## Network Architecture Uncertainty
- Network diagram is **incomplete and simplified**
- Cisco core switch **model unknown**
- Actual network topology likely more complex
- Guest WiFi isolation **not verified**
- Wireless infrastructure at Westside **unknown**

---

## Security Configuration Gaps
- VPN access control lists not audited
- Endpoint protection deployment status uncertain
- SSH hardening incomplete across Linux servers
- PostgreSQL database access not restricted to application server

---

## Medical Device Security
- CT scanner operating system **unknown**
- No network segmentation for IoT medical devices
- Security configuration of medical devices **undocumented**

---

## Physical Security Unknowns
- Server room uses **generic employee badge access**
- No cameras in server room corridor
- Westside server closet **does not lock**
- Physical access logging status unknown

---

## Compliance and Governance
- No formal **HIPAA Security Rule assessment**
- No documented **incident response plan**
- No **business continuity plan**
- No **disaster recovery plan**

---

## Cloud and External Services
- Confirmed cloud platform: **Microsoft 365**
- Other departmental cloud services **not inventoried**

---

## Backup and Disaster Recovery
- Backups stored on NAS in **same rack as backup server**
- No confirmed **offsite or cloud backup**
- Disaster recovery testing status **unknown**

---

# Summary

MedDefense Health Systems operates three sites supporting approximately 2,000 employees. Central Hospital serves as the primary healthcare facility and hosts most IT infrastructure. The environment includes multiple Linux and Windows servers supporting clinical, administrative, and public-facing services.

Documentation indicates several major gaps including incomplete asset inventory, lack of network segmentation, legacy medical systems, and limited formal security governance. A comprehensive asset discovery, network review, and formal security assessment would be required to obtain a complete understanding of the environment.