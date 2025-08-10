---
filetags: ":vagrant:snippets:epubnote:"
id: f6eac044-2ed3-4bbb-8578-61d95ba6ba22
title: Vagrant Snippets
---

``` shell

# Create a new Vagrantfile with image
vagrant init hashicorp/bionic64

# Start the VM from stopped or suspend state
vagrant up

# SSH into the VM
vagrant ssh

# SSH into VM with X11
vagrant ssh -- -X
# in Vagrantfile, set config.ssh.forward_x11 to true
# For guest, install xauth
# If on Windows, use Xming X server and Putty for display

# View SSH configuration related to VM
vagrant ssh-config
## Recreate the vagrant public key using the identify file listed in
## the output of the ssh-config command
ssh-keygen -y -f <identity-file-location> > key.pub
## key.pub can be used to restore vagrant access to the VM
## by appending the contents to the /home/vagrant/.ssh/authorized_keys file

# Reload the VM after changes to Vagrantfile
vagrant reload --provision

# Temporarilty suspend the VM for start up later
vagrant suspend

# Stop the VM
vagrant halt

# Destroy the VM
vagrant destroy
# Destroy the VM without confirmation
vagrant destroy -f

# Add box to local cache
vagrant box add hashicorp/bionic64

# Update a specific box
vagrant box update --box archlinux/archlinux

# List all environments on the system for the logged in user
vagrant global-status

# List all boxes
vagrant box list

# Delete a vagrant box
vagrant box remove hashicorp/bionic64

```

## Proxy

``` shell

# Enable proxy support using plugin
# See instructions at https://github.com/tmatilai/vagrant-proxyconf
vagrant plugin install vagrant-proxyconf

```

``` rb

Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://192.168.0.2:3128/"
    config.proxy.https    = "http://192.168.0.2:3128/"
    config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    config.proxy.enabled = true
  end
  # ... other stuff
end

```
