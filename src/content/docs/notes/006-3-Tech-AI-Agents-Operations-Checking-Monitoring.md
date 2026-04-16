---
filetags: ":artificial-intelligence:ai:epubnote:agent:"
id: 1c7b17d9-89dd-4068-9ec0-fefef15912e5
title: Agent Operations, Checking and Monitoring Agents
---

Source: [Are Your AI Agents Flying Blind? The Truth About AgentOps - IBM
Technology - YouTube](https://www.youtube.com/watch?v=jWDCnJKouhw)

Problem: How do you know your agents are producing correct results? and
track their work and results

Similar solutions include DevOps for software and MLOps for machine
learning models.

## AgentOps Areas and Metrics to Use

### Observation

- Track calls to things like LLM, tools
- End to end trace duration (E2E): time for work
- Agent to agent (A2A) hand off latency
- Cost per request

### Evaluation

- Task completion rate: how many tasks were successful without human
  intervention
- Guardrail violation rate: how often does agent do something wrong like
  leak data, give incorrect advice
- Factual accuracy rate: how often is agent correct

### Optimization

- Prompt token efficiency: output quality per token
- Retrieval precision at K: When agent pulls results from documents, how
  much is useful
- Hand off success rate: rate of A2A passes successful

## Understanding Metrics

Event small rates of error, like in a health care use case, can be 1000s
of cases and result in incorrect medical advice and wrong medication.

## AgentOps Dashboard

Use case: health care insurance system with payer authorization
requested by a pharmacy for a patient seeking medication.

Benefit of agents: then can reduce times by doing payer authorization
and clinical documentation verification.

Dashboard could track:

- Observation
  - Clinical documentation calls to electronic health records (EHR)
  - Check A2A hand off latency for time
  - Cost per authorization and compare with manual authorization flows
- Evaluation
  - See completion rate, factual accuracy of authorization, guardrail
    violations
  - Clinical appropriateness from human review of output
  - First pass approval rate: no back and forth
- Optimization
  - Prompt token efficiency: reduce tokens used through changes
  - Flow step efficiency: how many steps required for different parts of
    flow, for example retrieval from EHR might have API problems or EHR
    outages
  - System changes can help with accuracy and costs with incremental
    changes

## Results of AgentOps

Possible agent benefits in this use case using AgentOps metrics to
verify:

- Time reduction of 85%
- First pass approval of 50%
- Reduction in request costs
- People that did manual process can focus on complex cases that need
  human judgment and verifying agent output
