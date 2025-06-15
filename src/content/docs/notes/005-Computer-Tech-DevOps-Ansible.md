---
filetags: ":devops:ansible:automation:nana:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 9d393a61-59de-4540-9495-0c2122cf3d59
title: Ansible
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

Source: [What is Ansible \| Ansible Playbook explained \| Ansible
Tutorial for Beginners -
YouTube](https://www.youtube.com/watch?v=1id6ERvfozo)

## What is Ansible

### Introduction to Ansible

Tool to automate IT tasks

Open source GPL licensed

### Why automate?

Save time, reduce errors, ensure consistency

- Solve repetitive and distributed tasks:
  - Updates, backups, system reboots, user management
  - Manage multiple, distributed systemsm complex systems
- For example, update Docker on 10 machines
- Naive approach: Document through notes, then manually execute

### When is Ansible Used? Use Cases

- 4 different ways Ansible helps:
  - Execute task from one machine
  - Config steps with YAML file(s)
  - Re-use same YAML files for different environments
  - Efficient, reliable and less errors

Ansible supports all infrastructure:

- Operating systems, cloud, on-prem
  - Integrations vendor supported
- Agentless, managed remotely from one machine - advantages:
  - No deployment or upgrade effort

## Ansible Components

### Modules and Playbooks

Modules:

- Small programs that do the work. They are sent to the target server.
  One specific tasks like:
  - Start docker container
  - Create/copy file
  - Start nginx service

There are [modules to work with many
systems](https://docs.ansible.com/ansible/2.9/modules/modules_by_category.html),
some examples:

- Cloud
- Commands
- Database
- Files
- Network
- Security
- Source control
- System

### Simple to Understand becase of use of YAML

Ansible uses YAML, making it easier to understand and human readable.

### Usage, Playbooks

- Because modules do specific things, multiple modules will be required
  for complex tasks.

- Sequential modules are grouped into tasks. For example:

  - Task: rename table, set owner of table, and truncase table.
  - Task: create directory, install nginx, start nginx

1.  Tasks Configuration

    - Hosts: where to run
    - Vars: variables
    - remote<sub>user</sub>: user to run as
    - Module name: what to run
    - Arguments: what to do

    Indentation is used in YAML to show hierarchy and is strict.

2.  Plays and Playbooks

    Play = combination of above: hosts, vars, remote<sub>user</sub>,
    tasks with modules and arguments. Should be named after the
    sequential tasks

    Playbook = 1 or more plays

    - How and in which order
    - At what time and where (which hosts)
    - What modules should be executed

    Example Playbook:

    ``` yaml

    hosts: webservers
    remote_user: root

    # Play for Webservers
    tasks:
        - name: create directory for nginx
          file:
            path: /etc/nginx
            state: directory
        - name: install nginx latest version
          apt:
            name: nginx
            state: latest
        - name: start nginx
            service:
                name: nginx
                state: started

    # Play for Database
    - hosts: databases
      remote_user: root

      tasks:
            - name: rename table
            mysql_db:
                name: old_table
                rename: new_table
            - name: set owner of table
            mysql_user:
                name: new_table
                priv: '*.*:ALL'
            - name: truncate table
            mysql_db:
                name: new_table
                state: import
                target: /tmp/new_table.sql
    ```

3.  Host Definition

    Set in Hosts File or Inventory = all machines involed in task
    executions

    - Includes IPs or hostnames
    - Can be grouped like webservers, databases
    - Can be any type of server (cloud, virtual, bare metal)

    For example:

    ``` txt
    10.24.0.100

    [webservers]
    10.24.0.1
    web1.myserver.com

    [databases]
    10.24.1.4
    db1.myserver.com
    ```

### Ansible with Docker and Other Environments

- Dockerfile to prepare application environment, for example config
  file, set log directory, env varaibles, app.jar, start script

Using Ansible, use the same configuration for the Docker container, but
use it also on:

- Docker / Vagrant container
- Cloud instance
- Bare metal

Ansible allows to reproduce the application in any environment

Ansible can also manage the container on the host level, for example
with storage and network.

### Ansible Tower

- UI Dashboard from Redhat to centrally store and manage tasks,
  collaborate with other, manage inventories

### Alternatives to Ansible like Puppet and Chef

| Ansible   | Puppet and Chef           | Comment                  |
|-----------|---------------------------|--------------------------|
| YAML      | Ruby                      | YAML is easier to learn  |
| Agentless | Agent based, installation | Less deployment required |

## See Also

- [Ansible Vault](../005-computer-tech-devops-ansible-vault) - [Ansible
  Vault](id:c61d1c56-c7e2-4ee4-b6a1-cab8ebff5f40)
- [DevOps Bootcamp with
  Nana](../005-computer-tech-devops-bootcamp-twn) - [DevOps Bootcamp
  Series with Nana Janashia](id:47b64b3b-67a0-4cc5-9e96-2369c5877b08)
  - [DevOps Bootcamp - Configuration Management with
    Ansible](../005-computer-tech-devops-bootcamp-twn-configuration-management-with-ansible) -
    [DevOps Bootcamp - Configuration Management with
    Ansible](id:9807996a-b116-4ad5-9e02-52e55c291e7a)
- [DevOps](../005-computer-tech-devops) - [DevOps - Development and
  Operations](id:1daaeec4-145b-4f3c-8579-a9d4519feae5) - Development and
  Operations
- [Terraform](../005-computer-tech-devops-terraform) - [Terraform -
  infrastructure as code](id:df7e9ded-8c8b-4ede-8d31-7ad229c1b7d1) -
  infrastructure as code (IaC)
