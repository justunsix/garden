---
filetags: ":microsoft:tech:azure:infrastructure:data:epubnote:"
id: 80b03a49-4c14-4c35-855d-f8dff5f535ad
title: Azure Hybrid Infrastructure
---

Source: My personal notes on infrastructure course

## Azure Hybrid Infrastructure 2022-03-08 to 09

### Agenda

- Overview of Hybrid Cloud
- Hybrid Cloud Identity and Networking
- Hybrid Cloud Compute Workload
- Hybrid Cloud Applications and Data
- Hybrid Cloud Security

### Module 1: Overview of Hybrid Cloud

Hybrid is like an enhancement and integration with on premise
infrastructure.

Example company used in this session:

Tailwind traders - Hybrid Strategy

- Distributed locations of offices, multi-national
- Branch offices connected with hub and spoke topology
- VPN
- They have on premise infrastructure
  - Near capacity, aging infrastructure
  - They are growing, do not want to invest more on premise
  - Single Active Directory on premise
  - Use cloud where it makes sense and connect to those services
  - They are *not* interested in cloud migrations. On premise is
    working, but new business capacity can be created on cloud.

### What is Hybrid Cloud?

- Some workloads are on premise and in cloud. It is a stable state, not
  in middle of change.
- On premise and cloud resources communicate securely and seamlessly
- A consistent…
  - Identity infrastructure is used for authentication and authorization
    for on-premises and cloud workloads and infrastructure
    - e.g. Active Directory
  - Set of tools is used to manage on-premises and cloud workloads and
    infrastructures.
    - Knowledge of where resource is, is not required when using the
      tool.
  - Set of technologies is used to secure on-premises and cloud
    resources
    - Example, same tool can see security issues on premise and in
      cloud.

### Challenge and Solution Identity and Directory services

- Tailwind Traders currently has Windows Server VM workloads that are
  dependent on Active Directory Domain Services and custom schema
  extensions at a number of branch offices.
- These workloads are running alongside virtualized AD DS domain
  controllers on aging virtualization host hardware that is getting
  close to end of life.
- Workers in these branch offices in multiple countries still require
  secure access to these workloads
- Migrating the workloads to the head office datacenters doesn't make
  sense when the branch offices are half a world away

Solution: Connect branch offices to Azure using VPN or ExpressRoute (non
internet, dedicated link)

- Deploy Windows Server IaaS VMs as domain controllers and configure as
  a new AD DS site in the existing domain
- Migrate the Windows Server VM workloads from the aging virtualization
  hardware to the Azure subnets with Windows Server IaaS domain
  controllers.

Deployment diagram

<figure>
<img
src="../media/Tech-Microsoft-Azure-Hybrid-Infrastructure-2022-03-08-13-19-51.png" />
<figcaption>example hybrid deployment</figcaption>
</figure>

### Hybrid Cloud Architectures

[Architectures are available at Microsoft
docs](https://docs.microsoft.com/en-us/azure/architecture/hybrid/hybrid-start-here)

[Browse hybrid
architectures](https://docs.microsoft.com/en-us/azure/architecture/browse/?azure_categories=hybrid)

1.  Challenge and Solution Perimeter Security

    - Tailwind Traders has branch office perimeter networks that host
      web applications in multiple countries that they wish to
      decommission
    - Several weeks a year during online retail campaigns, the
      applications are overwhelmed with traffic and fail. Tailwind
      Traders wants to ensure that in future this demand can be met
    - TWT want to implement OWASP filtering and DDOS protection on their
      web apps without having to manage complex perimeter network
      firewall configuration
    - Time is less than 5% of the year

    Solution: Move perimeter network to cloud

    - Tailwind Traders can decommission their branch office perimeter
      networks after moving all externally facing web applications
      hosted on these networks to Azure
    - Protecting web applications from attacks on the OWASP top 10 list
      as well as implementing DDoS protection is straightforward.
    - The web applications can also scale up and down as required as
      traffic fluctuates

### Elements of Hybrid Cloud

- Management: Use a consistent set of management tools to manage
  on-premises and cloud workloads
  - e.g. Azure Portal, Azure Arc (on premise resource management), Azure
    CLI, Windows Admin Center
- Identity: Use a single identity provider for authorization and
  authentication
  - e.g. Azure AD, Azure AD DS, Azure AD Connect
- Networking: Ensure secure and reliable communication between
  on-premise and cloud
  - e.g. ExpressRoute, VPN (connect to VPN as a service)
- Security: Ensure that a single set of tools can be used to monitor and
  respond to suspicious activity in on-premises and cloud assets
  - e.g. Azure Sentinel (can run Jupyter notebooks against data), Azure
    Security Centre
- Fabric: Ensure that on-premises fabric is managed and maintained as
  consistently as cloud fabric
  - e.g. Azure Stack HCI, Azure Stack Edge - Microsoft manages the
    infrastructure
    - Stack HCI - Microsoft manages the configuration of the hardware,
      you only manage the VMs
    - Stack edge - you manage apps like PaaS

1.  Challenge and Solution Virtual Machine (VM) updates

    - Tailwind Traders needs to keep a large number of VMs on-premises,
      but has noted that maintaining the virtualization fabric that
      hosts those virtual machines is increasingly challenging.

    Solution: Outsource hardware management

    - Azure Stack HCI provides TWT with an option of a fully managed
      virtualization infrastructure where TWT IT operations only has to
      worry about the virtual machine workloads and doesn't have to
      worry about managing and maintaining the infrastructure that
      supports those workloads.

### Benefits of Hybrid

- Hybrid cloud technologies enhance on—premises deployments
- Many organizations already have hybrid cloud. They run on-premises
  workloads while using M365 technologies such as Exchange Online, Teams
  and Azure web applications
- Choose cloud technologies that make your organization successful
  whilst keeping the parts of on-premises that still do what you need
- Hybrids allows as little or as much cloud as your organization needs
  while preserving value add on premise resources

1.  Challenge and Solution Software Updates

    - A recent Tailwind Traders audit of Windows Server and Linux
      workloads found that 30% didn't have the most recent software
      updates
    - Because Tailwind Traders has a multitude of branch offices spread
      across multiple geographies, it is difficult to ensure that server
      operating system workloads are kept up to date

    Solution: [Azure Automation Update
    Management](https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-update-mgmt)

    - Linux and Windows on premise and in cloud, one console to manage
      updates and compliance for all servers

2.  Challenge and Solution Compliance

    - In the past, Tailwind Traders spent a substantive amount of time
      auditing the configuration of their Windows Server and Linux
      workloads to determine if they had drifted from a baseline that
      ensured compliance with various standards such as ISO 27001 and
      PCI DSS 3.2.1.

    Solution: Cloud tools audit using Azure Arc, Policy, and Security
    Centre

### Hybrid Cloud Management & Governance

- Azure Arc and Azure Policy can be used to ensure that hybrid workloads
  are configured in a specific manner
- Role Based Access Control can be implemented in hybrid environments to
  ensure that only authorized users can perform specific administrative
  actions
- Tagging can be implemented so that workloads related to specific
  projects can be identified whether they reside on-premises or in Azure

1.  Challenge and Solution File Server Management

    - An ongoing challenge for Tailwind Traders is that they were
      constantly running out of disk space on their file servers.
    - This meant that every few months, an administrator would need to
      make an assessment of which files could be safely removed and
      transferred to long term storage on tape
    - Occasionally it also meant that administrators might have to
      retrieve a file from long term tape storage when it was required
    - File share replication using DFS worked most of the time, but not
      all of the time

    Solution: Synchronize on premise files to cloud

    Azure File Sync replicate share information to cloud.

    - Tailwind Traders implemented Azure File Sync on each file server
      and turned on cloud tiering.
    - They configured Azure File Sync to automatically tier all files
      that haven't been accessed in 30 days up to an Azure File Share.
    - Tiered files appear to the user to be still present on the file
      share. If a user accesses a tiered file, it is automatically
      replicated down to the file share and opens normally for the user
    - Additional file servers can be added to the sync group. These
      additional servers can host replicas of the Azure File Share
    - Automatic backup each day, recovered files appear back in share

### Data in the Hybrid Cloud

- Hybrid cloud allows the cheap and functionally limitless storage
  capacity of the cloud to act as storage for cold data
- Cold data can be placed on less performant, but much cheaper, storage
  tiers
- Azure File Sync can be configured to automatically tier cold data to
  an Azure File Share (data no one is using to long term storage)

### Best Practices for Hybrid Cloud

- Use a consistent set of management tools for on-premises and cloud
  workloads
- Ensure that consistent security policies are applied to hybrid
  workloads
- Backup and Disaster Recovery is critical for on-premises and cloud
  workloads
- Track workload costs on-premises and in cloud
- Understand a workload's lifecycle

### Challenges with Hybrid Cloud

- When adopting hybrid cloud, ensure that the environment doesn't become
  so complicated that it becomes unmanageable
  - Avoid "cloud sprawl" to limit what is deployed
- Ensure that workloads are hosted in the appropriate location from the
  perspective of cost, governance and compliance
- Migrating a VM is only the first step in migrating that workload to
  the cloud
  - It is eventually necessary to migrate the application to a PaaS
    service to take full advantage of what the cloud offers

### Module 2: Hybrid Cloud Identity and Networking

- Look at how to configure hybrid identity and network using Azure VPN,
  ExpressRoute, Virtual WAN, hybrid identity
- Tailwind traders (TWT) context - single AD, occasional direct
  connections between sites/branches. Hub and spoke network topology
  between branches that is poorly documented.
- Requirements:
  - Keep some workloads on-premises Between on-premise & Azure
  - Move some workloads to Azure Secure & reliable
  - Connect branch offices to resources and workloads in Azure
    datacenters without making those resources available to the public
    internet
  - Prevent traffic from entering public internet
  - Simplify network topology when routing traffic between branch
    offices
  - Restrict access to resources and workloads using on premise identity

### Solution Match VPN, Internet Permitted Traffic

[Azure
VPN](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/vpn)

- On-premises gateway device required - managed by Microsoft

- Microsoft guarantees 99.9% availability for only the VPN gateway

- No guarantee on reliability of the connection to the gateway across
  the internet

- Maximum bandwidth per VPN connection is up to 1 GBPS

- May be necessary to have multiple connections

- Encrypted traffic passes across public internet

- Bastion, NSGs can secure access to VMs

Azure VPN Gateways includes the following elements:

- Virtual Network gateway: A virtual VPN appliance for the VNet. Routes
  encrypted traffic from the on-premises network to the VNet.
- Local network gateway: Represents the on-premises VPN appliance.
  Routes traffic from the on-premises network to Azure.
- Connect: The properties that determine the connection type (IPsec) and
  the key shared with on-premises VPN appliance to encrypt traffic
- Gateway subnet: A special subnet that hosts the virtual network
  gateway
  - Hosts the IP addresses that the virtual network gateway VMs and
    services use
  - Do not deploy workloads to the gateway subnet
  - Must be named GatewaySubnet to function
  - Recommended that it be created as a /26, /27 or /28
  - Don't apply an NSG to the gateway subnet

1.  Demo

    - Register Windows Admin Centre from Windows Server to Azure
    - Add Gateway subnet to existing virtual network
    - Add Azure Network Adapter
      - Configures VPN and VPN on Windows server

### Considerations on Data Restrictions

- Data sensitivity
- Restrictions on data crossing internet, remaining on premise

### Solution Match ExpressRoute, Traffic that must remain on private network

- Up to 10 Gbps\*

- Supports dynamic scaling of bandwidth to reduce costs\*

- Allows direct access to national cloud\*

- Traffic does not pass across public internet

- 99.9% availability SLA of entire connection

- \*Depends on connectivity provider

- Issues:

  - Not available all locations
  - Can be complex to configure
  - Third party connectivity provider is responsible for provisioning
    network
  - Requires high bandwidth network equipment on-premises

[Azure ExpressRoute
Architecture](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/hybrid-networking/expressroute)

- Local edge routers \> Microsoft Edge routes \> ExpressRoute Gateway
  and gateway subnet \> management/web/data/etc. tiers in Azure

### Connectivity and Multi-Region Challenges

- Is the on—premises deployment spread across multiple regions?
- Will the Azure deployment be spread across multiple regions?
- Should each on-premises site have connectivity to Azure?
- Should there be VPN or ExpressRoute connections to each Azure region?

### Solution Match Azure Virtual WAN

- Provides branch to branch connectivity through Azure
- Automatic Site-to-Site configuration and connectivity between
  on-premises sites and an Azure Hub
- Automated spoke setup and configuration
- Built in Azure dashboard to provide troubleshooting insights and view
  large scale connectivity

[Overview](https://docs.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about)

- Up to 1000 connections are supported per virtual hub
- Each connection has two tunnels in an active-active configuration On
  premises VPN devices can connect to multiple
- Azure Virtual WAN hubs

1.  VWAN Demo

    - Set up VPN site connections to Azure. Azure is the central hub to
      prevent dependency on site hubs.
    - Create Virtual WAN
    - Create new hubs in VWAN
      - Site to Site VPN gateway
    - Create a VPN site connection
      - Choose closest Azure region to location of that site
    - Repeat last step with new site
    - Download VPN configurations from portal to use on premise
    - Add an existing VNET connection to the hub to other sites
      connected to hub can connect to the VNET

### Hybrid Identity Options

[AD DS Domain Services in
Azure](https://docs.microsoft.com/en-us/azure/architecture/reference-architectures/identity/adds-extend-domain)

- Deploy AD DS domain controllers in Azure as separate site, forest or
  domain
- Connect to on-premises environment using a VPN

[Azure AD
Connect](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-azure-ad-connect)

- Synchronize on-premises identities to Azure AD
- Azure resources use Azure AD for authentication and authorization
- Demo:
  - Solution Match Azure AD Connect to Sign into an Azure VM using on
    premise credentials
  - Create VM (minimum supported Windows server 2019/Windows 10 for this
    scenario)
    - Select management \> identity \> turn System managed identity
  - Ensure users are visible in Azure AD
    - They could have been created in Azure AD or were synced from on
      premise AD
  - Set up role assignment in VM
    - Access Control tab on VM resource: Add Virtual Machine
      User/Administrator Login role to one AAD and one AD created
      accounts, assignment can take 30 minutes to apply
  - Log into VM
    - e.g. use login name AzureAD♃@tailwindertraders.com. Note domain is
      "AzureAD"

Azure AD DS

- AD DS domain controllers "as a service"
- Provides domain join and login with Azure AD accounts without
  requiring AD DS DC VMs

### Hybrid Identity and Network Module Summary

- TWT can use Azure VPN and ExpressRoute to connect branch offices to
  resources and workloads in Azure datacenters without making those
  resources available to the public internet
- TWT can use Azure ExpressRoute to ensure that network traffic from
  specific offices to specific workloads and resources in Azure doesn't
  cross the public internet
- TWT can use Azure Virtual WAN to simplify its network topology when
  routing traffic between branch offices
- TWT can use Azure AD Connect and Azure AD DS to restrict access to
  resources and workloads in Azure datacenters using on-premises
  identity

### Module 3 Hybrid Cloud Compute Workload

### Tailwind Requirements

- What tools can TWT use to consistently manage Windows Server workloads
  in a hybrid cloud environment?
- How does TWT apply policy to compute workloads in a hybrid cloud
  environment?
- How can TWT simplify the management and maintenance of its on-premises
  virtualization fabric?
- How can TWT simplify its disaster recovery strategy for Windows Server
  workloads in hybrid environments?

### Solution Match to Microsoft Services

1.  Windows Admin Center

    - Web based server manager
      - Manage roles and features
      - Connect and manage server
        - Backup, monitor, DNS, Certificates, Devices
        - RDP to server
    - Gateway server to on premise and cloud
    - Remote Desktop and PowerShell sessions to manage computers. Can we
      on Windows Servers or Windows desktop
    - Available in Azure Portal

2.  Azure Arc Enabled Servers

    - Manage servers and monitor, single place to manage them

3.  Azure File Sync

    - Cloud tiering, access, and backup
    - Multi-site sync
    - Server DR
    - [Azure File Sync
      Architecture](https://docs.microsoft.com/en-us/azure/architecture/hybrid/hybrid-file-services)
    - Similar to OneDrive

4.  Azure Backup

    - Backup and restore data in hybrid environments to Azure
    - Azure Backup automatically allocates and manages backup storage
    - Unlimited scale and highly available (LRS or GRS)
    - No charge (by backup) for regular backup data transfer
    - Pay-as-you-use model
    - On-premises, data in transit is encrypted on the on-premises
      machine using AES256
    - For on-premises to Azure backup, data in Azure is encrypted
      at-rest using the passphrase you provide when you set up backup
    - For Azure VMs, data is encrypted at-reset using Storage Service
      Encryption
    - Back up Properties
      - Application consistent backup
      - No limit on amount of time data is stored in a recovery vault
      - A limit of 9999 recovery points per protected instance
      - Azure Backup Options:
        - Azure Backup Agent
        - Azure Backup Server
          - Windows and Linux supported
          - Back up files, folders, volumes, VMs, applications, system
            state
        - Azure IaaS VM Backup (including SQL on Windows IaaS VM)
        - Azure File Share Backup
    - [Azure Backup
      Architecture](https://docs.microsoft.com/en-us/azure/backup/backup-architecture)

5.  Azure Site Recovery

    Recover site using data stored in Azure

### Complex Hybrid Environment

- 1,000s of apps
  - VMs
  - Databases
  - Containers
  - Serverless
- Diverse infrastructure
  - Data centres
  - Hosting servers
  - Branch offices
  - OEM Hardware
  - IoT
- Multi cloud

### Solution Match - Azure Management

Single control plane for Azure resources

- Customers access Portal, shell, bash, CLI
- Management services: Monitoring, update, backup, security centre
- Azure Resource Management
- Azure Services
- Azure Arc manage other connected services (VMs, databases, k8s)
  - Link to log analytics
  - [Sample architecture for on
    premise](https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-arc-hybrid-config)
  - Inventory of servers
  - Policies can manage Azure and Azure Arc managed servers. Security
    baseline.
  - Role based
  - All in portal experience

### Solution Match - Azure Stack HyperConverged Infrastructure (HCI)

- Specialized host operating system
- Native disaster recovery
- Faster Storage Spaces resync
- Full-stack updates

Azure integrated

- Native integration, no agent
- Manage in Azure Portal
- Dedicated team in Azure Support
- Modern subscription billing
- Self-service VMs

Similar to On Premise Hosting

- Choose and customize hardware
- Familiar edge-local tools
- PowerShell, SC VMM, `Altaro` Backup
- Full administrator control

### Hybrid Compute Module Summary

- TWT can use Windows Admin Center to consistently manage Windows Server
  workloads in a hybrid cloud environment
- TWT can use Azure Arc to provide a single control plane to compute
  workloads in a hybrid cloud environment
- TWT can deploy Azure Stack HCI to simplify the management and
  maintenance of its on-premises virtualization fabric
- TWT can use Azure File Sync to make file servers more efficient in a
  hybrid cloud environment
- TWT can simplify its disaster recovery strategy for Windows Server
  workloads in hybrid environments using Azure Backup and Azure Site
  Recovery

### Module 4: Hybrid Cloud Applications and Data

### Business Requirements from TWT

Hybrid:

- Keep some workloads on-premises

- Move some workloads to Azure

- Communications are secure and reliable between cloud and on premise

- Make internal applications available to internet without opening
  inbound ports on perimeter firewall

- Retire current perimeter network and reverse proxy

- Allow Azure Web App to use on-premises data source

- Simplify management of on-premises Kubernetes clusters

- Simplify management of on-premises SQL and PostgreSQL instances

### What are Hybrid Cloud Applications

- Applications that have one tier in the cloud and another on-premises
- Allows organizations to retire perimeter network whilst keeping some
  applications in on-premises datacenters
- Allow application access to application hosted on on-premises internal
  network without requiring a VPN

### Solution Match

1.  Azure Relay

    - Allows you to securely expose workloads running on internal
      network to public cloud
      - Runs via an on premise agent, agent goes outbound
    - Does not require opening inbound port on perimeter network
      firewall
    - Allows applications to be published to internet clients without
      configuring VPN connection
    - Use instead of Azure AD Application Proxy when application doesn't
      require Azure AD authentication

    Supports the following scenarios between on-premises services and
    applications running in Azure:

    - Traditional one—way, request/response, and peer-to-peer
      communication.

    - Event distribution to enable publish/subscribe scenarios.

    - Bidirectional and unbuffered socket communication across network
      boundaries.

    - Hybrid Connections

      - Hybrid Connections uses the open-standard web sockets and can be
        used in multiplatform architectures.
      - Supports .NET Core, .NET Framework, Java script/NodeJS,
        standards-based open protocols, and remote procedure call (RPC)
        programming models.

    - WCF Relays

      - WCF Relays uses Windows Communication Foundation (WCF) to enable
        remote procedure calls.
      - This is an existing option that many customers use with their
        WCF programs. It also supports WCF Relay and .NET Framework.

2.  Azure App Service Hybrid Connections

    - Allows you to connect an Azure Web App to an application resource
      on any network that is able to send outbound requests to Azure on
      port 443
    - Can communicate with any resource provided it can function as a
      TCP endpoint
    - Use a relay agent that is able to connect to internal network as
      well as establish connection to Azure
    - Not necessary to open inbound port on perimeter network firewall
    - Doesn't require VPN or ExpressRoute connection

3.  Azure AD Application Proxy

    - Provide secure remote access to web application running on
      on-premises network through an external URL
    - Can be used as a replacement for reverse proxies or VPNs
    - Can be configured to allow remote access and single sign—on to:
      - Web applications that use Integrated Windows Authentication
      - Web applications that use header-based or form-based
        authentication
      - Applications hosted through Remote Desktop Gateway

4.  Azure Arc enabled Kubernetes

    - Allows management of Kubernetes clusters through Azure Portal
      Connect Kubernetes clusters outside of Azure for inventory,
      grouping, and tagging tasks
    - Deploy applications and apply configurations to Kubernetes
      clusters using GitOps-based configuration management
    - Use Azure Monitor for Containers to review and monitor hybrid
      Kubernetes clusters
    - Apply Azure Policy for Kubernetes Policies to hybrid Kubernetes
      clusters

5.  Azure Arc enabled data services

    - Allows organizations to run Azure Database for PostgreSQL Servers
      and SQL Managed Instances on premises
    - Managed through Azure Data Studio, Azure Portal, or Azure CLI
      Automates the patching and update processes for these on-premises
      database instances
    - Applies database advanced threat protection functionality in Azure
      Security Center for managed SQL instances on-premises
    - Uses container and Kubernetes services to host managed database
      instances

### Module 4 Summary

- Azure Relay makes internal applications available to internet without
  opening inbound ports on perimeter firewall
- Azure AD Application proxy allows TWT to retire reverse proxy Azure
  App Service Hybrid Connection allows Azure Web Apps to use on-premises
  data source
- Azure Arc enabled Kubernetes simplifies management of on-premises
  Kubernetes clusters
- Azure Arc enabled data services simplify management of on-premises SQL
  and PostgreSQL instances

### Module 5: Hybrid Cloud Security

### Business Requirements

Hybrid cloud compute workloads:

- Need latest software updates
  - Both physical and virtual machines, both on-premise and cloud,
    running Windows or Linux remain current with software updates
  - Determine update compliancy
  - Centralize deployment software updates
- Be alerted:
  - If workloads have non-compliant configurations
  - Suspicious security events and are written to logs for those
    workloads
- Check if important files on those workloads were altered

### Solution Match for Hybrid Security

- Cloud security is a shared responsibility
  - Secure foundation
    - Physical assets
    - Data centre
    - Cloud
  - Joint responsibility
    - Microsoft provides built-in controls for all cloud services

1.  Azure Update Management

    - Checks update compliance of their Windows and Linux computers,
      both on-, multi-cloud, and Azure IaaS
    - Can deploy and install software updates to Windows and Linux
      computers, both on-premise and in Azure IaaS
    - Avoids using different products depending on operating system or
      location
    - [Azure Update Management
      Architecture](https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-update-mgmt)
      - Reports available in log analytics workspace
    - Custom approval, automate periodic deployments, single place to
      manage all updates

2.  Azure Arc Configuration Management

    - Address challenge of distributed complex infrastructure

    - [Azure Arc configuration
      architecture](https://docs.microsoft.com/en-us/azure/architecture/hybrid/azure-arc-hybrid-config)

    - Azure policy allows management of policies to Azure / Azure Arc
      managed resources

3.  Azure Security Center

    - Hybrid Windows, Linux agents gather information, can also take in
      network and PaaS logs
    - Apply security analytics from external threat intelligence
      - Threat detections
      - Recommendations
      - Analytics store to log analytics
    - Security dashboard
      - Can take action such as REST APIs, Automation, Notifications

4.  Monitoring Hybrid Security

    - Agents are deployed on hybrid operating system workloads

      - Windows Security Events Connector stream Windows security events
        to Azure Sentinel
      - Connector for Microsoft Defender for Identity can stream on
        premises AD DS telemetry to Azure Sentinel
      - Connector for Microsoft Defender for Endpoint can stream alerts
        for Microsoft Defender for Endpoint into Azure Sentinel
      - Connectors for Linux operating systems can forward Syslog and
        CEF data to Azure Sentinel

    - Azure Sentinel analyzes telemetry to detect, hunt, prevent, and
      respond to threats against hybrid operating system workloads

    - [Monitoring Hybrid
      Security](https://docs.microsoft.com/en-us/azure/architecture/hybrid/hybrid-security-monitoring)

    - Demo

      - After setting up an log analytics workspace and connecting IaaS
        or Arc managed servers to it, go to log analytics advanced
        settings to select which logs you want to get in the workspace
      - Log analytics workspace can be used for further reports, create
        alerts using queries

### Module 5 Summary

- TWT can use Azure Update Management to ensure that all hybrid cloud
  compute workloads have the most recent software updates installed
- TWT can use Azure Arc enabled Servers to be alerted if hybrid cloud
  compute workloads have non-compliant configurations
- TWT can use Azure Security Center to be notified if modifications are
  made to important files on hybrid cloud operating system workloads
- TWT can use Azure Sentinel to be alerted if suspicious security events
  are written to event logs on hybrid cloud operating system workloads
