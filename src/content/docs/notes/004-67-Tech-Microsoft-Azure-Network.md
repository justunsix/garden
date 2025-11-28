---
filetags: ":azure:network:virtual:epubnote:"
id: 6f1f7de9-782d-403e-9df6-a9235a913a6d
title: Microsoft Azure Network
---

## Azure Virtual Network (VNet)

### About

- VNet allows Azure resources like VMs to communicate with each other,
  internet, and on premise networks.
- Like traditional network with cloud scale, availability and isolation
  - VNets and subnets can be in all availability zones in a region.
- No charge, included in resource costs like VMs
- Has limits

### Use cases

- Internet, internal Azure, and/or on premise communications
- Network filtering, routing,
  - Network security groups (NSG) control inbound and outbound traffic
    by source/destination IP address, port, and protocol
  - Network virtual appliances (NVA) are virtual machines that provide
    network security and routing services like firewall, WAN
    optimization, and other functions
- Network routing
  - Route traffic between subnets, connected VNets, on premise networks,
    and internet
    - Route tables - control traffic routing for subnets
    - Border Gateway Protocol (BGP): when connected to on premise via
      Azure VPN Gateway or ExpressRoute, propagate on premise BGP routes
      to VNets
- Network integration
  - Private access to dedicated instances of Azure services from
    resources or use Private Link to access an instance of a service
    privately from within VNet and on premise
  - Service is also available using public endpint using a service
    endpoint and extending the virtual network
- Control outbound connections with public IP and load balancers
- Virtual network service endpoint to extend virtual network private
  address space and the identity to other Azure resources
  - Service endpoints secure connections only to that virtual network
  - Connect to other VNets with VNet peering to resources in each VNet
    can communicate. Networks can be in different regions.
- Communicate with on premise:
  - Point to site VPN: encrypted tunnel over internet for a single
    computer to the VNet
  - Site to site VPN: authorized on premise resources can access VNet
    - Through on premise VPN device and Azure VPN gateway
    - Encrypted tunnel over internet
  - ExpressRoute: private connection between on premise network and
    Azure through an ExpressRoute partner. Connection is private and
    does not go over internet

### VNet Concepts and Practices

From [Azure Virtual Network - Concepts and best practices \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/virtual-network/concepts-and-best-practices)

1.  Concepts

    - Address space: Needed when creating VNet with a custom private IP
      address using public and private addresses
      - Example: Create VNet with address space `10.0.0.0/16` and VM can
        be given IP `10.0.0.4`
        - Per [Classless Inter-Domain Routing -
          Wikipedia](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing),
          this address space is `10.0.0.0` to `10.0.255.255` with
          2<sup>16</sup> addresses
    - Subnets: Allow to segment the VNet into sub-networks and deploy
      resources in subnets.
      - Subnets can be secured with network security groups
    - Regions: A VNet is scoped to a single region. Multiple VNets from
      different regions can be connected using Virtual Network Peering
    - Subscription: A VNet is scoped to a single subscription. Multiple
      VNets can be within a subscription.

2.  Best Practices

    - Check the VNet address space (CIDR block) does not overlap with
      your organization's other network ranges.
    - Subnets should only cover part of the VNet to reserve future space
    - Recommendation is having fewer large VNets rather than many small
      ones to reduce administration.
    - Secure VNets with network security groups (NSG) to subnets.

## See Also

### Resources

- [Azure Virtual Network \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
