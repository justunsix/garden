---
description: Training to build solution with generative AI, agents,
  natural language, computer vision, and information extraction using
  Azure AI services
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:"
id: dc608ccd-b4bc-4820-8bfa-e522c827e6f8
title: Develop AI solutions in Azure AI-102
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)

Course covers building solutions with generative AI, agents, natural
language, computer vision, and information extraction using Azure AI
services.

## Introduction

### Tips on Taking the Course

- Review the certification and its course material to check it suits
  you. Review the study guide for all topics the certification covers.
- Use of course material on Microsoft Learn like exercises, module
  assessments
- Create a study group, for example with other Python developers
- Search on Microsoft Learn on topics that interest you for other
  learning content or do a web search with Azure AI plus the specific
  topic

1.  Certifications

    Organizations where people do training and certification first
    before using something do best to understand good practices and know
    what areas you can improve during training.

    - Take the practice assessment
    - Go through the study guide. Questions will come from topics in the
      guide.

## Course Modules

- [Develop generative AI apps in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-generative) -
  [Generative AI in Azure AI
  Solutions](id:d5571956-346d-433d-8500-0b58a819fffb)
- [Develop AI agents on
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-agents) -
  [Agents in Azure AI
  Solutions](id:eae5da2e-f013-42af-8128-cc2ae5c28b0f)

### Former Cognitive Services

- [Develop natural language and Natural Language Processing (NLP)
  solutions in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-natural-language-nlp) -
  [Natural Language and Natural Language Processing (NLP) in Azure AI
  Solutions](id:97e2a0ac-74dd-40b0-bc77-5237767a4b9b)
- [Develop computer vision solutions in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-computer-vision) -
  [Computer Vision in Azure AI
  solutions](id:586c528a-cbe1-4d1d-9026-844ad393e82f)
- [Develop AI information extraction solutions in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-information-extraction) -
  [Information Extraction in Azure AI
  Solutions](id:ea3c4dff-d8c8-4fb6-ad75-82274983fc33)

### About Former Cognitive Services

Natural language, computer vision, and information extraction existed
before large language models. They use models from machine learning to
process information and can be trained with custom data. Their models
are smaller than LLMs. They are best used for specific use cases that
they solve due to their greater accuracy and lower cost compared to
LLMs, but costs depend on use. In Azure, they were formerly called Azure
Cognitive AI Services.

Depending on the need, generative AI and agents or cognitive services
are more suitable or combined to provide good user experience with
possibility for extending functionality.

Deployment options include AI Foundry, Azure AI Services or a specific
cognitive services resource.

### On Premise and Local Azure AI

See [Use Azure AI containers on-premises - Azure AI services \|
Microsoft
Learn](https://learn.microsoft.com/en-us/azure/ai-services/cognitive-services-container-support)
for ability to run containers on premise and locally. Not all Azure AI
services are available, but many are available.

``` text

User --> Container with Azure AI services hosted on premise
Container on premise --> Azure via Internet for billing usage

```

## DevOps with Azure AI

Q: What is guidance on implementing a CI/CD process in Azure Foundry for
AI projects that include applications, Agents, and LLMs? Looking for
practices on:

- Environment separation: How to effectively separate development, user
  acceptance testing (UAT), and production environments
- Roles and responsibilities: Recommended responsibilities for
  developers, operations teams, and business users
- Security considerations: Key security practices for each role,
  especially in the context of handling sensitive AI components and data
- Resources

### Environments Management

Example Azure environment with more details in Dev/Test Subscription.
Environments are deployed like dev/test subscription. Besides dev/test,
good practice is the environments are managed with Infrastructure as
Code (IAC)

``` plantuml
@startuml
title DevOps with Azure AI resources

rectangle "Dev/Test Subscription" as devsub {

    card "Virtual Machine 1" as vm1 {
        component app [
                Application
        ]
    }
    card "AI Foundry" as aifoundry1 {
        card "Hub" as hub1 {
          card "AI Project" as aiproject1 {
             component endpoint1 [
                                Endpoint for Deployed model
             ]
          }
        }
    }

}

rectangle "QA Subscription" as qasub {

    card "Virtual Machine 2" as vm2 {
        component app [
                Application
        ]
    }

    card "AI Foundry" as aifoundry2
}

rectangle "Production Subscription" as prodsub {

    card "Virtual Machine 3" as vm3 {
        component app [
                Application
        ]
    }
    card "AI Foundry" as aifoundry3
}

rectangle "Azure shared resources" as azureshared {

    card "OpenAI services in region 1" as aiserviceregion1 {
                [gpt-4o 1]
    }

    card "OpenAI services in region 2" as aiserviceregion2 {
                [gpt-4o 2]
    }

}

Developers -down-> devsub : changes, deployments with DevOps
Developers -down-> qasub : access, test deployments with DevOps
"QA Users" -right-> qasub : testing
endpoint1 --> aiserviceregion1 : LLMs are hosted external to a user subscription
"IAC, DevOps" -up-> devsub : manage resources
"IAC, DevOps" -up-> qasub: manage resources
"IAC, DevOps" -up-> prodsub : manage resources

```

Various tools can be used like Azure DevOps pipelines, Terraform which
translates to Microsoft ARM deployment templates, GitLab, Jenkins. AI
Foundry resources like hub, projects, and endpoints can be created and
managed using those DevOps tools.

When adding or modifying things like endpoints, agents and other
resources inside projects are additional asset managed by IAC.

Additional assets may include: monitoring, storage accounts.

### Roles and Responsibilities, Security

In AI Foundry, there are default user roles of Owner, Contributor (like
Owner except no security settings) and reader. The [role
documentation](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/rbac-azure-ai-foundry)
explains use with projects.

When setting up an AI Foundry:

- Restrict the network access for expected use.
- Set people and identities with access
- Encryption: keys for data encryption used can be self or Microsoft
  managed

### SDK and Application Security

Q: What is the difference of using keys and Entra authentication as
shown in the exercises?

The SDK in the exercises can be called using endpoints and keys or
endpoints with Entra authentication (logged in identity of a user or
application for example using `az login`). The recommended way is to use
Entra authentication as it is more secure. When development
applications, a recommended way is use Application Registrations which
allow Entra authentication.

## Azure AI Monitoring

Q: What is a good way to monitor model outputs in Azure AI for solutions
we build? or set up monitors? for example to troubleshoot user reports
of responses that have issues and monitor for safety

Need to balance monitoring responses and avoid capturing sensitive data.
Course can use more content on monitoring and governance.

See [Monitor your Generative AI Applications - Azure AI Foundry \|
Microsoft
Learn](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/monitor-applications)

### Azure Portal

In Azure portal, look at monitoring blade for alerts, metrics,
diagnostic settings for logging and logs. For example, in diagnostic
settings enable Azure OpenAI Request Usage, traces and send it to a Log
Analytics workspace.

Microsoft Defender for Cloud: look at vulnerabilities and resources with
potential cyber security improvements. There is a data and AI security
blade.

### Application Insights

Application Insights can capture logs for application solutions.

In diagram below, Application Insights can log browser, web app, and API
traffic in each component. All Application Insights logs go to one place
for querying.

``` plantuml
@startuml

card Browser [
User on browser
]

card WebApp [
Web application with Application Insights
also monitors browser interactions
]

card API_1 [
API 1 with Application Insights
]

card API_2 [
API 2 with Application Insights
]

Browser --> WebApp
API_2 --> Database
API_1 --> AI_Foundry
WebApp --> API_1
WebApp --> API_2

@enduml
```

### AI Foundry

In Azure AI Foundry, the Observe and optimize \> Monitoring blade shows
a dashboard for resource usage like Total requests, token use. The
Observe and optimize \> Tracing blade integrates with Application
Insights.

In Protect and Govern blade, use:

- Guardrails + controls for filtering and monitoring content
- Governance with Purview for information protection, audit, recommended
  settings

In prompts, you could add for users to report responses.

## See Also

### Resources

- [Course AI-102T00-A: Develop AI solutions in Azure - Microsoft
  Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
- Labs:
  - [Exercises for Develop generative AI solutions in
    Azure](https://microsoftlearning.github.io/mslearn-ai-studio/)
  - [Exercises for Develop AI Agents in
    Azure](https://microsoftlearning.github.io/mslearn-ai-agents/)
  - [Exercises for Azure AI Language
    Exercises](https://microsoftlearning.github.io/mslearn-ai-language/)
  - [Exercises for Develop vision solutions in
    Azure](https://microsoftlearning.github.io/mslearn-ai-vision/)
  - [Exercises for Develop AI-powered information extraction solutions
    in
    Azure](https://microsoftlearning.github.io/mslearn-ai-information-extraction/)
- [Microsoft Certified: Azure AI Engineer
  Associate](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-engineer/?practice-assessment-type=certification)
- [Study guide for Exam AI-102: Designing and Implementing a Microsoft
  Azure AI Solution \| Microsoft
  Learn](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-102)
- [Use the Azure libraries (SDK) for Python - Python on Azure \|
  Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/developer/python/sdk/azure-sdk-overview)

1.  Videos

    - [Microsoft Instructor led training for
      AI-102](https://learn.microsoft.com/en-gb/shows/on-demand-instructor-led-training-series/?terms=AI-102) -
      note for more recent content, see Microsoft Learn content material
    - [AI-102 Study Cram - Azure AI Engineer Associate Certification -
      John Savill on
      YouTube](https://www.youtube.com/watch?v=I7fdWafTcPY)

2.  Exercise Repositories

    - [GitHub - MicrosoftLearning/mslearn-ai-agents: This repo contains
      instructions and assets for building agents on
      Azure](https://github.com/MicrosoftLearning/mslearn-ai-agents)
    - [GitHub - MicrosoftLearning/mslearn-ai-document-intelligence: Lab
      files for Azure AI Document Intelligence
      modules](https://github.com/MicrosoftLearning/mslearn-ai-document-intelligence)
    - [GitHub - MicrosoftLearning/mslearn-ai-information-extraction: Lab
      exercises on AI-powered information
      extraction](https://github.com/microsoftlearning/mslearn-ai-information-extraction)
    - [GitHub - MicrosoftLearning/mslearn-ai-language: Lab files for
      Azure AI Language
      modules](https://github.com/MicrosoftLearning/mslearn-ai-language)
    - [GitHub - MicrosoftLearning/mslearn-ai-studio: Practical exercises
      for Azure AI Foundry
      training](https://github.com/MicrosoftLearning/mslearn-ai-studio)
    - [GitHub - MicrosoftLearning/mslearn-ai-vision: Lab files for Azure
      AI Vision
      modules](https://github.com/MicrosoftLearning/mslearn-ai-vision)
