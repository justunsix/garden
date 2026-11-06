---
date: 2026-10-03
description: Virtual machine management interface for guest machines
  with Libvirt
filetags: ":snippets:epubnote:virsh:guest:virtual-machine:vm:management-interface:"
id: c1c4ab8d-3e7a-476c-b375-1f974e1750dc
title: virsh - guest domain virtual machine management Snippets
---

``` shell

# Connect to a hypervisor session interactively
virsh --connect qemu:///system|qemu:///session|xen:///system|lxc:///system|...

# Connect to session instance
virsh -c qemu///system list --all

# List all domains, virtual machines
virsh --connect uri list --all

# Start a domain
virsh start domain-name-or-uuid

# Stop a domain
virsh shutdown domain-name-or-uuid

# Immediately stop domain (forefully)
virsh destroy domain-name-or-uuid

# Reboot domain
virsh reboot domain-name-or-uuid

# Show information about domain
virsh dominfo

# Show IP of domain
virsh domifaddr

# Basic information about the network object
virsh net-list --all

# List all storage pools
virsh pool-list --all

# List all volumes in storage pool
virsh vol-list pool-or-uuid

# Connect to domain's console
virsh console domain-name-or-uuid

# Activate a network named `default`
sudo virsh net-start default

# Create a domain from a configuration file
sudo virsh create path/to/config_file.xml

# Edit a domain's configuration file (editor can be changed with `$EDITOR` or `$VISUAL`)
sudo virsh edit domain

# Start/reboot/reset/shutdown/destroy/suspend/resume a domain
sudo virsh start|reboot|reset|shutdown|destroy|suspend|resume domain

# Save the current running state of a domain (RAM, but not disk state) to a state file (domain will be powered off)
sudo virsh save domain path/to/state_file

# Remove storage and snapshots of a stopped domain
sudo virsh undefine domain --remove-all-storage --snapshots-metadata

```

## See Also
