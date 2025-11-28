---
filetags: ":testing:technology:epubnote:"
id: 64979365-5e29-49ab-9291-a9a9eed98d3c
title: Regression Testing, Quality Assurance and Automation
---

## Use Cases

- Repetitive testing tasks
- Regression testing on applications during releases
- Support frequent releases and deployments and need to do quality
  assurance

## Benefits

- Save person time on testing, increase people capacity to do more
  testing
- Better test coverage due to timely automation
- Support automation of test data creation, for example for load
  testing, realistic data creation

## Approach

- Understand people and application development
  - Need for development and maintenance of tests automation
- Plan automation, assess existing testing, test coverage
- Integrate with testing pipeline
- Schedule automated testing
  - Example: regular regression tests
- Examples:
  - Regression pipeline
    - Continuous Testing
    - App functionality
    - Security scans
    - Accessibility
  - Use similar tests for performance testing

## Example Technology Stack and Implementations

- Automation pipelines
  - GitHub Actions, Azure DevOps, Jenkins
  - Create templates for reuse
    - Pipelines
    - Bug reporting and tracking
  - Reporting
    - For example: total bugs, defects, trends on defects
    - Azure DevOps canned reports
- Security scan
  - OWASP, Zed Attack Proxy (ZAP)
- Web automation
  - Selenium
- Terminal/Desktop
  - Python pyautogui
