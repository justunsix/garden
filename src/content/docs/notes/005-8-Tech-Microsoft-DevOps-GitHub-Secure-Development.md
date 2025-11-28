---
description: Stop right now and put your Repo up – How to develop
  securely in the cloud
filetags: ":devops:github:microsoft:tech:epubnote:security:"
id: 6396303d-6c14-48cc-a292-c29005511e9c
title: GitHub DevOps - Secure Development
---

Source: My personal note from Microsoft DevOps course

## Introduction

- Shock, you've been hacked – you don't even know what to do – you rush
  to your laptop, power it up, and panic, potentially introducing more
  risk. But wait, there is a better idea – use GitHub codespaces and
  GitHub security to develop securely.

Session agenda:

- Navigating the whole GitHub Codespaces experience.
- Push an insecure app full of vulnerabilities.
- Powerful new GitHub Security features to scan and suggest fixes.

## DevSecOps

- DevSecOps = software development and operations (DevOps) and security

- Vulnerability sources:

  - Unchecked dependencies (80-90% of our code)
    - Dependencies can have vulnerabilities, ex. log4shell
  - Developer errors
    - Exposed access tokens
    - Unsafe code patterns
  - Environment:
    - There are 570 times more developers than security researchers
    - Higher risks in production

- "Shifting security left": Develop \> Build \> Test \> Deploy \> Breach

  - Shift security processes towards beginning of development cycle

- Benefits of DevSecOps:

  - Faster remediation time
  - Integrate with security tools
  - Faster threat identification

- Barriers to DevSecOps:

  - Organization
    - Dev vs. Ops vs. Security as supposed to integrated teams
  - People, skills, knowledge gaps

## Securing Software Development

- Requirements:
  - Shared accountability: developers, security
  - Secure environments

### Sample governance

- Central security team
- Industry security research
- Community of practice

Teams cover security testing, research, and development

## Secure Environments

GitHub codespaces

- Advantages:
  - Limit scope of non-trusted repositories
  - Manage trusted resources
  - Isolated environments
- DevOps pipelines
  - Scan for policies compliance
  - Managed trusted and non-trusted pipelines
  - Builds:
    - Compilers - signed
    - Build - verified
    - Build machines & infrastructure - least privilege
    - DevOps pipelines - trusted
- Code
  - Repositories must have maintainers
  - Least privileges access, only access for developers to specific
    code, not at organization level
- Pipelines
  - Secure machines, endpoint protection
  - Automatically apply IAA policies
  - Multi-factor authentication, Just-in-time access
- Monitor developer cloud
  - Automatic detection and response to suspicious activity
  - Alerting
  - Scan for policy issues

## Development Lifecycle Security

### Pre-commit

- Threat modeling
- IDE security plug-in
- Pre-commit hooks
- Secure coding standards
- Peer review

### Commit

- Static code analysis
  - Ex. code scanning
    - Security and Vulnerabilities
    - CWEs
    - OWASP Top 10
    - SANS 25
    - Language specific
    - Correctness
    - Code best practices like readability
    - Community
    - Custom
- Security unit tests
  - Ex. penetration testing
- Dependency management
- Credential scanning
  - Detect secrets in code

### Deploy

- Infrastructure as code (laC)
- Dynamic security scanning
- Cloud configuration checks
- Security acceptance tests

### Operations

- Continuous monitoring
  - Ex. Azure Policy, Monitor, Secure ARM templates
- Threat intelligence
  - Microsoft Defender for Cloud
- Blameless post-mortems

## Demo

- [OWASP WebGoat](https://owasp.org/www-project-webgoat/) - deliberately
  insecure web app
- Fork WebGoat into GitHub
- Run in Codespaces, use port forwarding to access remote web
  application
- Find vulnerabilities:
  - Use CodeQL command line so CodeQL can scan code hierarchy and build
    a database
  - Use database to scan for issues, check vulnerabilities or check on
    your specific vulnerability

## See Also

- [DevOps - Development and Operations](/garden/notes/005-computer-tech-devops) -
  [DevOps - Development and
  Operations](id:1daaeec4-145b-4f3c-8579-a9d4519feae5)
- [Microsoft Technology](/garden/notes/005-tech-microsoft) - [Microsoft
  Technology](id:fd8af895-8c3f-483c-80a9-e082b1e62581)

### Resources

- [GitHub Advanced
  Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security)
