---
filetags: ":github:actions:epubnote:"
id: d31aae40-327e-4fa0-ac61-75fe83907cf1
title: GitHub Actions
---

Source: [Learn GitHub Actions - GitHub
Docs](https://docs.github.com/en/actions/learn-github-actions)

- Event \> Job \> Steps \> Actions / Shell Command
  - Job \> Runner \> Run actions, Log results
  - Jobs can run in parallel
  - Actions are the smallest block of a workflow. You can create your
    own actions or reuse existing ones
  - A runner is a server with GitHub actions runner application
    installed
- [Dependabot can be activated to monitor action
  versions](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/keeping-your-actions-up-to-date-with-dependabot)

## [Events](https://docs.github.com/en/actions/learn-github-actions/introduction-to-github-actions#events)

An event is a specific activity that triggers a workflow. - For example,
activity can originate from GitHub when someone pushes a commit to a
repository or when an issue or pull request is created. - You can also
use the [repository dispatch
webhook](https://docs.github.com/en/rest/reference/repos#create-a-repository-dispatch-event)
to trigger a workflow when an external event occurs. - For a complete
list of events that can be used to trigger workflows, see [Events that
trigger
workflows](https://docs.github.com/en/actions/reference/events-that-trigger-workflows).

## Example

``` yaml
# name of workflow
name: learn-github-actions
# when to execute workflow, in this case on a manual trigger through GitHub.com or API
on: workflow_dispatch
# set of actions
jobs:
  check-bats-version:
    # Runner to use
    runs-on: ubuntu-latest
    # Steps
    steps:
      # Check git repo
      - uses: actions/checkout@v2
      # Install node
      - uses: actions/setup-node@v2
        with:
          node-version: '14'
      # Command line actions to run inside runner
      - run: npm install -g bats
      - run: bats -v
```
