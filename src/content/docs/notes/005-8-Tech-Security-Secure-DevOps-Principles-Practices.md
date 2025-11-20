---
filetags: ":devops:security:epubnote:"
id: 4430aaeb-2a31-4f60-8a77-3e2bffae9eac
title: "Secure DevOps: Security Principles and Practices"
---

Source: My personal notes from Microsoft session with Jay Atkins - full
stack engineer, healthcare in 2021

Work use case: have DevSecOps, Azure, Openshift Container Platform, some
threat modeling, architects, developers, testers, development

[Labs in public
repo](https://dev.azure.com/SecureDevOpsDelivery/_git/MyHealthClinicSecDevOps-Public?path=%2FLabs)

## Security and Secure DevOps

- Many different attacks present from criminals, nation states,
  individuals
- Government could be a target of a nation state, e.g. get health
  records for intelligence gathering
- Today: data theft, spying, "advanced persistent threats"; Future:
  Internet of things with new forms of attack. Militarization of
  Cyberspace

### Examples and Threats

- Equifax: lost half of the population of the US personal information,
  their website was using Java Struts 1 month out of date with a known
  vulnerability. Hackers had scanned the site for vulnerabilities
- Phishing example: 524 recipients, 220 clicked sign up (42%), 37
  clicked both emails, 11 people reported to IT security (2%)
- Attackers have access to the same public information as we do: [OWASP
  Top 10](https://owasp.org/www-project-top-ten/), [SANS Top
  25](https://www.sans.org/top25-software-errors/),
  [CVE](https://cve.mitre.org/), [NVD](https://nvd.nist.gov/),
  [CERT](https://www.kb.cert.org/vuls/). Attackers can be organized: have
  website, addresses, business organizations.
- Developer Workstations: common target due to administrative privileges
  and access to tools and access to the areas.
  [BloodHound](https://github.com/BloodHoundAD/BloodHound) hacking tool
  to reveal the hidden and often unintended relationships within an
  Active Directory.
- In 2002, Microsoft aimed to become a security company

### Mindset Shift: Assume Breach

> "Fundamentally, if somebody wants to get in, they're getting… accept
> that." Michael Hayden, Former Director of NSA, CIA

- Zero trust approach, assume each component could be compromised
- Don't assume "no one will think of that / only someone internal will
  know that", assume someone will discover your vulnerabilities

### Standards and Practices

- Data Classification
- Compliance Standards: GDPR, HIPAA, HITRUST, FedRAMP, PCI DSS 12, ISO
  27001:2005, FIPS 199:AC-21

1.  Basics Practices

    - Provide training
    - Define security requirements
    - Define metrics, compliance reporting
    - Perform threat modeling
    - Establish design requirements
    - Define and use cryptography standards
    - Manage and security risk of using third party components
    - Use approved tools
    - Perform static application security testing (SAST)
    - Perform dynamic application security testing (DAST)
    - Perform penetration testing
    - Establish incident response process

### DevOps

"DevOps is the union of people, process, and products."

1.  Why?

    - Shorten cycle times
    - Quality improvement through continuous feedback, continuous
      innovation with experimentation
    - Optimize resources, reduce waste

2.  Secure DevOps

    "Shifting security left" strategy means shifting security to
    workstation that is developing the solutions and solved earlier in
    the build and release cycle.

    Usability problems:

    - Tools must be integrated
    - Tools must not require security expertise
    - Tool results must be accurate
    - Engineers must have high confidence that fixing issues won't break
      other things
    - Don't ignore warnings and let it become noise - e.g. compiling
      code - avoid warnings and clean them up

## Secure DevOps Principles

### Shift Left and Automate

- Security reviews of all features, security should be built into
  software delivery
- Source control of operations
- Understand what components make up your application:
- 3rd party, OSS, license
- Dependency scanning - e.g. WhiteSource Bolt, black duck, Dependabot,
  SonarQube
- Check licenses
- WhiteSource Bolt can be integrated in a DevOps pipeline - yaml
- Automation:
- Endpoint security
- Azure Security Centre, Defender

Q: `Dockerfile` dependency scanning? DockerHub could scan

### Assume Breach

Red vs Blue team - Cyber war games, internal game with red (attackers)
and blue (defenders) to improve mean time to solve security issues

- Red team: model real world attacks, identify gaps, demonstrate gap
- Kali Linux, penetrating testing and assessment
- Blue team: exercise ability to detect and response, better situational
  awareness, measure readiness and impact

Are there any online tools built in Azure for developer to use?

- Kudu console to check a site - in browser
  `...azurewebsites.net/Env.cshtml`
- Log analytics, application insights
- Azure policies

### Prevent Breach

- Security code reviews - Look are people overriding frameworks, enforce
  reviews for high sensitivity code, git branch policies, changes to
  master should always have a least one reviewer for PRs
- Credential scanning - ensure credentials are not in pipeline (API
  keys, endpoints, passwords, license keys)
- SysInternals Strings - dump strings from binaries to check credentials
- [Use Azure Key Vault secrets in Azure
  Pipeline](https://docs.microsoft.com/en-us/azure/devops/pipelines/release/azure-key-vault?view=azure-devops)
- Move to modern authentication (e.g. stop using basicauth) like OAuth,
  Azure Active Directory
- CredScan tool in DevOps pipelines
- Key vaults: hardware is worth the extra cost, software is sufficient
  (e.g. HashiCorp, DigiCerts for CAs)
- Threat modeling
- Dynamic Application Security Tools (DAST) - operational / behavioral
  testing, utility automation in DevOps pipeline, May "fuzz" the
  application - check vulnerabilities and compliance
- Use service accounts (managed identities you don't have to manage or
  have regular authentication management)
- **Software composition analysis** check dependencies and
  vulnerabilities

### Secure DevOps Kit for Azure (AZSK)

[About](https://azsk.azurewebsites.net/). Being replaced later in 2021
with [Azure Tenant Scanner (AZTS)](https://github.com/azsk/AzTS-docs),
but AZTS is being developed.

- Set of tools and scanners for Microsoft DevOps to secure Azure
  subscriptions
- Looks at subscriptions continuously, DevOps dashboard

### Operational Security Assurance

- Use multi-factor authentication - authenticator app is preferred
  rather than SMS due to weakness in telephony security
- Enforce least privilege
- Only have permissions for what you need for your work
- like "need to know"
- Reduces risk if an account is compromised
- Protect secrets
- Minimize attack surface - encrypt data in transit and at rest, double
  encrypt may make sense
- Encrypt data in transit and at rest
- Implement security monitoring
- Implement a security upgrade strategy - patches, dependencies
- Protect again DDOS attacks
- Validate the configuration of web applications
- Perform penetration testing

### Secure DevOps Culture

- Start small and grow naturally
- Team autonomy and use of Secure DevOps improves security and agility
- Make vulnerabilities real and personal, transparent mistakes
- Assume people make mistakes
- Make production everyone's responsibility
- Do not wait for a breach
- Roles: Security champions

### Establish security requirements

- Annual security training
- Cryptographic standards
- Secure coding guidelines
- Encrypt data in transit using approved cryptographic protocols and
  algorithms

### Incident Response Planning

- Support policy
- Cyber incident response plan (CIRP)
- Identify contacts and resources to response
- 24x7x365 contact information for first responders
- Test incident plans, like DR plan
- Documentation, process standards

## Application Security Principles

### Trust Boundaries

- Where attacks are launched
- If you don't own a service, that is a trust level change
- Changes in trust level
- internet to web app
- partner to web app
- Team 1 to team 2 apps
- User to kernel mode, my app to extension library
- Gate keeper
- App Azure Gateway with web application firewall (WAF) - uses OWASP,
  Azure Front door
- Firewalls

### Security issues

> 3 security issues: input, input, and everything else

- Do not assume that input is valid, all input is suspect
- Never rely on client-side validation (low trust), validate on server
- Process only accepted data, log all else
- Validate for type, length, range, format
- Create a strategy for your team
- Entity framework, use data annotations if possible, use regex if
  needed though hard to test
- Consistent semantics

Everything else

**Open Web Application Security Project (OWASP)** - keep inventory of
common security issues in applications

- Auditing, logging, SIEM
- Cryptography
- Secret handling
- Error handling
- Outdated components

1.  Tips

    - Reuse existing security libraries, cryptography
    - Secure defaults
    - Protect secrets - avoid security by obscurity
    - Do not think a secret is kept forever
    - Security by design
    - threat modeling, patterns
    - Security is your job, not just security teams
    - Do manual and automated penetration tests
    - Use tools
    - Keep learning
    - e.g. in Azure - read each screen and option and read about each
      option

2.  Cryptography

    - Encryption relies on algorithms not known to be compromised
    - Strong key generation
    - Secure key management (minimum key lengths, key exchange, rotate
      keys), today AES265
    - Random number generation is pseudo
    - Use crypto libraries, have standards
    - Hashing algorithms
    - Know eventually all cryptography will be broken in future

    Crypto agility:

    - Configure current algorithm
    - Store the algorithm uses with data
    - Key generation, rotation and management

## OWASP Top 10

Some reviewed above. Top 10 and prevention techniques

| OWASP Top 10 2017 | Code Review | Threat Modeling | Static Analysis | Dynamic Analysis |
|----|----|----|----|----|
| A1: Injection | Y |  | Y | Y |
| A2: Broken Auth |  | Y |  | Y |
| A3: Sensitive Data Exposure |  | Y |  | Y |
| A4: XML External Entities | Y |  | Y | Y |
| A5: Broken Access Control |  | Y |  | Y |
| A6: Secure Misconfiguration |  | Y |  |  |
| A7: Cross-Site Scripting | Y |  | Y | Y |
| A8: Insecure Deserialization | Y |  | Y | Y |
| A9: Using Vulnerable Comp. |  |  | Y | Y |
| A10: Insufficient Logging |  | Y |  |  |

A9 is common due to insecure JavaScript libraries

Help:

- Linters, programming standards, IDE warnings
- Open source policy (dependency checking, WhiteSource Bolt, licensing)
- GPL license workarounds, wrap GPL code around an API
- Q: Should GPL / OSS be code checked when incorporating into Jenkins
  pipeline? Yes, for example use WhiteSource Bolt Standards, but
  compliance is not equal to security Azure Security Centre - automate
  compliance

### Authentication (AuthN), Authorization (AuthZ), Least privilege

What: users, services, applications

If someone has physical access to a device, it is not secure

AuthN failure: incorrect idea of other party's identity

- No AuthN, weak AuthN, credential theft
- Tokenization - hashing sensitive data to lower risk of physical
  security breaches such in unsecured IOT devices

1.  Problems

    - Stolen credentials
    - Weak passwords
    - Implementing own user management
    - Stealing tokens (replay attacks)
    - Secrets - do not store in plaintext, config, unprotected plan,
      application files
    - [Google Hacking Database (GHDB) - Google Dorks, OSINT,
      Recon](https://www.exploit-db.com/google-hacking-database) -
      database of known vulnerable systems

2.  Solutions

    - Usable password policies
    - MFA
    - SSO (Azure AD, social logins, federated, AAD B2C, B2B)
    - Separate AuthN from app
    - Modern protocols (OAuth2, OpenID connect)
    - Last resort: program framework
    - OAuth2 flows: authorization code grant, client credential, device
      code flow

    1.  Authenticating applications

        - Clean source (e.g. corporate code repositories)
        - App stores
        - Safe-listing via Windows defenses
        - App Guard
        - Device Guard
        - Signed code
        - Publish hash on https web site

3.  Case \#1 Canonicalization Example

    Different languages/formats than expected by application

    Use libraries to handle these issues rather than parsing it yourself

4.  Case \#2 injection flaws

    - SQL injection
    - LDAP injection (e.g. enumeration of directories on searches)

    1.  Cross site scripting (XSS)

        How does it happen? caused by improper input validation, failing
        to encode output, trusting data from shared resources

        1.  Reflected XSS - non-persistent, requires social engineering
        2.  Example, attacker sends link to a person where link could
            have malicious code like
            `https://www.site.com?id=<malicious code>`
        3.  Stored XSS - often referred to as persistent, e.g. forum
            comment
        4.  `Blog comment ... <malicious code>`, anyone reading comment
            will be compromised
        5.  DOM XSS
        6.  Like reflected but with script embedded in client code

        How to mitigate?

        - Validate inputs
        - Output must be encoded to prevent executable code
        - Content security policy: browser setting to allow
          valid/invalid sources for scripts/font files, control inline
          scripts
        - Restrict functionality such as iframes in HTML5
        - Protect your cookies

    2.  Injections

        All types (SQL, XML, LDAP, command …)

        Similar to XSS, validate inputs:

        - Regular expression
        - Validation frameworks

### Error Handling

1.  Exceptions

    - Handle expected exceptions
    - Logs: do not leak information/secrets to logs. Log issues to use
      to alert security team
    - Unexpected exceptions are security bugs

2.  Error Messages

    - Custom error pages/error code, do not leak program language/SQL
      errors
    - Do not leak sensitive data

### Auditing and Logging

- Intentional security logging
- Authentication and authorization
- Sensitive data use, key app events
- Read/writes
- Exceptions
- Backup logs regularly
- Real time analysis
- Use a security incident and event management (SIEM) and security
  orchestration, automation and response (SOAR) system
- for Azure it is Sentinel, Azure has a correlation ID

### Broken authentication

Weak and flawed authentication and session management lead to user
impersonation and information disclosure.

Elements of authentication and things that can go wrong

- Credentials - insecure handling of creds and session IDs, social
  engineering, phishing
- Authentication
- Identity - logout issues, lengthy sessions

1.  Solutions for Authentication

    Biometrics, device based authentication

    Risk detection: e.g. multiple logins, geographic assessment

    Questionable practices:

    - Weak passwords
    - published rules
    - Forcing renewal
    - Forcing use of new passwords for a new app vs single sign on

    Protocol:

    - Kerberos - best for internal only applications
    - WS-Federation / SAML - Internet friendly, lack of support for
      single page apps/modern flows
    - OpenIDConnect / OAuth2 - internet friendly, broad support

    Sessions:

    - Use HTTPS
    - Encrypted storage
    - Use http auths
    - Use secure cookies, do not use cookie less / pass variables in
      URLs

    Technical tools and features:

    - Microsoft MSAL for AAD
    - OWIN namespaces, modern auth protocol in ASP.NET 4.x apps
    - Azure AD / B2C, AD FS, Intune for user devices, MSAL/ADAL for
      OAuth2 client side SDKs

### Data Disclosure

Causes: weak cryptography, sensitive data stored unencrypted,
eavesdropping/man in middle attack/physical tapping

Solutions:

- Enable TDE always on
- Key vault
- CRUD keys/secrets
- Request, import, revoke certificates
- Grant roles to users/applications
- All Azure services are rate limited - careful not to lock yourself out
  of the vault
- Monitor key usage
- Modes: dedicated hardware security module (HSM), shared HSM, software
- Use different vaults for different environments
- Avoid log leaking
- Password hashing
- Developer and security pipelines: Code analysis - Roslyn security
  analyzers, SonarLint, ReSharper, SonarQube, CodeQL

Q: What if your app cannot go to internet to check CRLs?

Replicate to local access

### OWASP Authorization Failures

Attack:

- API tool, modifying URLs/HTML page
- Modifying client side variables, tokens (like JSON Web Token)

Solutions:

- Disable directory listings
- Global filters
- Validate authorization claims before processing them

### Threat Modeling

In [Microsoft ServicesHub](https://serviceshub.microsoft.com/databoard)
\> IT Health \> On Demand Assessments \> example Well Architected
Security Assessment

Assessment will recommend threat modeling - e.g. [Threats
Manager](https://threatsmanager.com/) (designed by Microsoft employee,
review dashboard, export model to documents) and older tool [Microsoft
Threat Modeling
Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49168)

**Who?** People building / testing / know the business requirements /
managing the system. Every person can inform a threat model.

**Benefits?** Security, Quality, Awareness, Confidence in solution

**How?** Threat modeling is best early in design phase. Model \>
Enumerate Threats \> Mitigate \> Validate (iterate again)

1.  Elements

    1.  User
    2.  Trust boundary - ownership changes, physical location changes,
        3rd party, network segments. Example [airport
        security](http://news.bbc.co.uk/2/hi/uk_news/8449008.stm)
    3.  Application
    4.  Middle Tier
    5.  Data

    <figure>
    <img src="../media/Tech-Security-2021-06-11-13-26-59.png" />
    <figcaption>Threat Modeling Illustrated</figcaption>
    </figure>

2.  STRIDE: ask questions for each element using STRIDE

    - **S** - Spoofing - Authentication
    - **T** - Tampering - Integrity
    - **R** - Repudiation - Nonrepudiation
    - **I** - Information disclosure - Data Protection
    - **D** - Denial of service - Availability
    - **E** - Elevation of privilege - Authorization

    Common Mistakes: Missing interactions with systems like temporary
    user / machine interactions

3.  Mitigations

    **How to prioritize threats?** do easy fixes first, bug bar method =
    set a level of bugs (e.g. low impact) that are acceptable to release
    to production, CVSS = score vulnerabilities

    Address threats:

    - Redesign
    - Standard / invented mitigations
    - Transfer risk within policy, insurance
    - Accept residual risk

    Identify out-of-scope items: trusted partners, 3rd party

    Security controls:

    - Preventive: reduce probability and impact
    - Deterrent: make cost too high for attackers
    - Detective: identify attacks in progress
    - Correcting and responding: controls to recover from an attack

4.  Diagram Process

    1.  Add trust boundaries
    2.  Add data flows
    3.  Add components
    4.  Add threats
    5.  Add mitigations
    6.  Auto generate documentation using threat model
