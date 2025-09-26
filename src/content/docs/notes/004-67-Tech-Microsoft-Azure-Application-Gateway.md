---
filetags: ":azure:paas:epubnote:"
id: 049a0ca2-8783-4db1-b754-4793123fd950
title: Azure Application Gateway
---

## About Azure Application Gateway

- Web traffic load balancer that allows management of traffic to web
  applications
- Traditional load balancer functionality is route traffic based on
  source IP address/port to a destination IP address and port.
  - Example use cases
    - Route traffic on incoming URLs like `/images` traffic is routed to
      a specific set of servers - see image: [application layer (OSI
      layer 7) load
      balancing](https://learn.microsoft.com/en-us/azure/application-gateway/media/application-gateway-url-route-overview/figure1-720.png)
    - Route based on URLs

### Other load balancing use cases and Azure products

- No TLS protocol termination - Traffic Manager: If you're looking to do
  DNS based global routing and do not have requirements for Transport
  Layer Security (TLS) protocol termination ("SSL offload"),
  per-HTTP/HTTPS request or application-layer processing, review Traffic
  Manager.
- Global routing for end users - Front Door: If you need to optimize
  global routing of your web traffic and optimize top-tier end-user
  performance and reliability through quick global failover, see Front
  Door.
- Transport layer load balancing - Load Balancer

End-to-end scenarios may benefit from combining these services as
needed. For an Azure load-balancing options comparison, see
[Load-balancing options - Azure Architecture Center \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview)

### Standard V2

Azure Application Gateway V2 provides enhancements and support for
services like:

- Autoscaling
  - Scale based on traffic load, patterns
  - Removes need to set deployment size - elastic
  - Fixed capacity mode with autoscaling disabled is available
- Zone redundancy
  - The Azure application gateway (AAG) or Web application firewall can
    span multiple availability zones
  - Redundancy available in Azure Zones
- Static IPs
  - Static VIP stays for life of the deployment, even after restarts
- Header rewrite
  - Add, remove, update of HTTP request/response headers
- Key vault integration
  - Integrate with key vault for server certificates attached HTTPS
    listeners
- Mutual Authentication (mTLS)
  - Authentication for client requests
- Azure Kubernetes Service Ingress Controller
  - AAG can be used as ingress for Azure Kubernetes Service (AKS)'s AKS
    Cluster service.
- Private link
  - Private connections to other VNets
- Performance compared to Standard/WAF SKU
  - Better TLS offload performance
  - Faster deployment and update time

1.  Azure Application Gateway (AAG) Pattern

    in PlantUML Deployment diagram format

    ``` plantuml
    component [Static VIP]
    file [AAG-Box] {
    component AAG
    node [AZ1 (Azure Kubernetes Service)]
    node [AZ2 (Virtual Machines)]
    }
    collections [Azure Key Vault]
    control [Scale out at load (minimum and maximum capacities)]
    cloud [Azure App Service]
    cloud [On-Premises]

    [Static VIP] --> AAG
    [Azure Key Vault] -- AAG : integration
    AAG --> [AZ1 (Azure Kubernetes Service)]
    AAG --> [AZ2 (Virtual Machines)]
    AAG -- [Scale out at load (minimum and maximum capacities)]
    AAG <--> [Azure App Service]
    AAG <--> [On-Premises]
    ```

### Features

1.  Load balancer feature diagram

    ``` plantuml
    [Browser] --> [App Gateway front end IP]
    [App Gateway front end IP] --> [HTTP/HTTPS listener]
    [HTTP/HTTPS listener] --> [Rule (HTTP setting)]
    [Rule (HTTP setting)] --> [Backend pool]
    ```

    Backend pool can be:

    - Virtual machines
    - Virtual machine scale sets = group of load balanced VMs
    - On-premise servers

2.  Feature Details

    - Secure Sockets Layer (SSL/TLS) Termination
      - Allows termination at gateway with (un)encrypted flow to backend
        servers which frees web servers from costs of
        encryption/decryption or end to end TLS encryption for secure
        communications.
    - Web Application Firewall (WAF)
      - Centralize protection from common exploits and vulnerabilities
        based on certain sets in [OWASP ModSecurity Core Rule Set \|
        OWASP
        Foundation](https://owasp.md/www-project-modsecurity-core-rule-set/).
      - React to threats faster through centralized patching. See more
        at [Introduction to Azure Web Application Firewall \| Microsoft
        Learn](https://learn.microsoft.com/en-us/azure/web-application-firewall/overview)
    - URL based routing
      - Route traffic based on URL path requests for
        <http://contoso.com/video/>\* are routed to `VideoServerPool`.
        See more at [Azure Application Gateway URL-based content routing
        overview \| Microsoft
        Learn](https://learn.microsoft.com/en-us/azure/application-gateway/url-route-overview)
    - Multiple-site Hosting
      - Routing based on host name or domain name for more than one web
        application on the same gateway. For example, multiple domains
        and their routing can be done on the same gateway and domains
        will point to the IP address of the application gateway.
    - Redirection
      - Redirect from and to any port defined in rules, other redirects,
        and external redirects
        - Examples:
          - Redirect HTTP to HTTPS to ensure all secure connections (80
            to 443)
          - Path based redirect like HTTPS for all URLs with `/cart`
    - Session affinity
      - Useful to keep a user session on the same server and if required
        where sessions state is local to a server for a user
      - Gateway managed cookies can direct later traffic from user
        session to the same server for processes
    - Websocket and HTTP/2 traffic
      - Native support for these protocols
    - Connection draining
      - Can remove backend pool member gracefully such as during planned
        changes
    - Custom error pages
    - Rewrite HTTP headers and URL
      - Modify headers to pass additional information such as:
        - Adding security-related header fields like HSTS/
          X-XSS-Protection
        - Removing response header fields that can reveal sensitive
          information
        - Stripping port information from X-Forwarded-For headers
    - Features listed above already in V2 sections
      - Zone redundancy
      - Static VIP
      - Ingress Controller for AKS
        - Application Gateway Ingress Controller (AGIC) allows you to
          use Application Gateway as the ingress for an Azure Kubernetes
          Service (AKS) cluster.
        - Controller run as a pod within AKS, allowing gateway to load
          balance traffic to k8s pods

## See Also

### Resources

- [What is Azure Application Gateway \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/application-gateway/overview)
