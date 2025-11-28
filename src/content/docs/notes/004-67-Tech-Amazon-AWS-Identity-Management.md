---
filetags: ":amazon:aws:iam:epubnote:"
id: 7c2d3af3-7daa-4301-a271-0b904515aa74
title: Amazon AWS Identity Management
---

## First Time Setup from Root Account

Use case: A new account/organization is setting up users to use AWS
resources and single sign on (SSO) with the AWS CLI. New users with
least privileges need to be created and managed.

Follow [Get started with common tasks in IAM Identity
Center](https://docs.aws.amazon.com/singlesignon/latest/userguide/getting-started.html)
with these high level steps:

- Enable the IAM Identity Center like at
  <https://ca-central-1.console.aws.amazon.com/singlesignon/home?region=ca-central-1&tab=management#!/>
  - Recommend enable with [AWS
    Organizations](https://docs.aws.amazon.com/singlesignon/latest/userguide/prereq.mds.html)
  - Leaving use of existing default directory
  - Configure MFA, require always for all users
- [Create users and assign them the appropriate
  access](https://docs.aws.amazon.com/singlesignon/latest/userguide/quick-start-default-idc.html)
  - Create a user, a group
  - Assign permissions to the group, for example PowerUserAccess for a
    developers groups
- Have users sign into the AWS access portal and they can then
  [configure SSO for the
  CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)
  - Get access keys from the AWS access portal and use AWS CLI
    `aws configure sso` to log in
