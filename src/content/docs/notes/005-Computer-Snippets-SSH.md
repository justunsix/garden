---
filetags: ":ssh:snippets:epubnote:"
id: df000228-d572-4544-8dcb-86f94b1cd346
title: SSH Snippets
---

``` shell

# Create a private and public key
ssh-keygen
# Create with type and email
ssh-keygen -t ed25519 -C "myemail@domain.com"
# Optionally, can use flag to specific where files are created -f /path/to/key

# SSH to destination with an identity file "id_rsa_myidentity"
ssh -i id_rsa_myidentity user@ip_address

```

## Start SSH agent and add keys

### On Linux, Unix, MacOS and Windows with MSYS2/Cygwin

These commands also work using msys2 and cygwin on Windows with
`openssh` package installed. See [Working with SSH key passphrases -
GitHub
Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows)
for using a similar method with git bash on Windows.

Source: [Generating a new SSH key and adding it to the ssh-agent -
GitHub
Docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

``` shell

# Run ssh agent in background
eval "$(ssh-agent -s)"

# Add ssh private key
ssh-add /path/to/key

# List identities and private keys
ssh-add -l

```

### On Windows

Source: [Key-based authentication in OpenSSH for Windows \| Microsoft
Learn](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_keymanagement)

Below commands require administrative rights to start ssh-agent. For a
non-administrative rights method, see the above instructions.

``` powershell

# By default, the ssh-agent service is disabled. Configure it to start automatically.
# Run the following command as an administrator - use an administrator powershell session
Get-Service ssh-agent | Set-Service -StartupType Automatic

# Start the service.
Start-Service ssh-agent

# The following command should return a status of Running.
Get-Service ssh-agent

# Load your key private files into ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ecdsa

```

## Example SSH Config File using Identity File

A user-specific config file is in ~/.ssh/config and system-wide
configuration file for all users at /etc/ssh/ssh<sub>config</sub>.

``` txt

Host my-website.com
    HostName my-website.com
    User my-user
    IdentityFile ~/.ssh/id_rsa

```

## See Also

- [GNU Privacy Guard](/garden/notes/005-8-tech-security-gpg) - [GNU Privacy Guard
  (GPG)](id:42b3dfbb-141c-4aa8-9dc0-06cefa20f62d)
