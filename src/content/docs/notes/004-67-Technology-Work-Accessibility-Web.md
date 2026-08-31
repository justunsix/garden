---
filetags: ":accessibility:web:epubnote:"
id: 82ac2036-798e-4cce-b71a-7cf2a7621040
title: Web Accessibility
---

## Web Accessibility - General 2011-12-14

### Legislation

Human Rights Code = "The Code", HRC = "No discrimination for anyone"

Integrated Accessibility Standards Regulation = IASR

Accessibility for Ontarians with Disabilities Act = AODA

IASR section 12 and 14 Accessible formats and communication supports
<http://www.e-laws.gov.on.ca/html/source/regs/english/2011/elaws_src_regs_r11191_e.htm#BK13>

Accessible websites and web content
<http://www.e-laws.gov.on.ca/html/source/regs/english/2011/elaws_src_regs_r11191_e.htm#BK15>

### Accessibility and CSS classes

Audible headings that will not be visible to users. Accessible class can
be used to put headers and labels with text off to the side or labels
that will still be audible/read by screen reader.

``` css


.accessible, h1.accessible, h2.accessible {

height: 1px;

left: -10000px;

overflow: hidden;

position: absolute;

top: auto;

width: 1px;

}

h1.accessible, h2.accessible {

height: 1px;

left: -10000px;

overflow: hidden;

position: absolute;

top: auto;

width: 1px;

}

```

### Accessibility Info and Tools

Firefox: WAVE toolbar, FAE

Compliance Sheriff

WebAIM checklist -
[http://webaim.org/standards/wcag/checklist](http://webaim.md/standards/wcag/checklist)

WCAG 2.0, W3C Recommendation 11 December 2008 -
[http://www.w3.org/TR/WCAG/](http://www.w3.md/TR/WCAG/)

Accessible Digital Office Document (ADOD) Project -
<http://adod.idrc.ocad.ca/>

## I&IT Technology Town Hall on Accessibility 2012-02-29

Source: Training from work

“Enabling Accessibility with I&IT – Today’s Responsibilities and
Considerations for the Future”

- Physical accessibility: water stations for docs, closed captions and
  sign language, spots at end of chair rows for wheelchairs

### Overview from the Regulator

- 1.85 million Ontarians have disabilities = 15.5% of Ontario

- Accessible Ontario by 2025

- Ontario is first in world to mandate accessibility instead of react to
  complaints

- Accessibility Standards areas:

  - information and communications

    - WCAG 2.0 Level AA by January 2020

  - Employment

    - Employment Standard

    - Provision of accessibility throughout employee life cycle,
      posting/application of jobs, workplace accommodations

  - Transportation

#### Public Education Strategy (Public Relations Strategy)

1.  **Goal:** raise awareness and build relationships with organizations
    needing to comply or be aware of regulation and practices.

2.  **Research**:

    1.  Focus groups, consultations with private sector

    2.  Slogan accepted: "*It's the right thing to do*"

3.  \*Planning:\* Less than \$2 million budget. Rely on technology and
    partnerships.

4.  **Communications:**

    1.  AODA Contact Centre (ServiceOntario) - searchable databases for
        use by in person CRMs

    2.  Partnerships with communications and organizations

        1.  Global Alliance on Accessible Technologies and Environments
            (GAATE), plain language guides of WCAG for small businesses

        2.  OCAD Inclusive Design research center
            - <http://idrc.ocad.ca/>

    3.  15 minute electronic accessibility training for business with
        tracking for their employees

    4.  Ontario.ca/accesson

    5.  Partner websites, newsletters, publications

    6.  Events, conferences, webcasts (maximizes reach on internet)

    7.  ACATS applications for reporting, client interaction (with
        compliance officers and obligated organizations), obligated
        organizations tracking

### Expectations for the OPS

- Ontario has responsibility to model and lead in accessibility (*beyond
  compliance*)

- Ontario Government:

  - 65,000 employees, 11% of OPS self identifies as having a disability

  - Service provider to province

- IASR 2012 impacts to I&IT: procurements, emergency/public safety, new
  internet/intranets, self service kiosks

- Think in personas, individuals with specific disabilities that have
  barriers.

- Closing story: [history of curb
  cuts](http://en.wikipedia.md/wiki/Curb_cut) where an improvement aimed
  as disability improved usability for everyone.

### Accessibility Design &Technologies: “A State of the Nation Perspective”

#### Disability Scenarios

- People with disability = 16 % of world

- By 2025, 20% of industrialized world will be over age 65. Many of
  these people will have a disability

- Non-native speakers and globalization

- Low ICT literacy

- Temporary disability: e.g. driving, sunlight, multi-tasking,
  noisy/quiet environment restrictions)

#### Trends

- Greater number of IT accessibility lawsuits

- Accessibility (as an IT requirement) is not free. Two IBM case studies
  show between 5% (planned early) - 15% (planned late) increase in cost.

- Technology innovation can help accessibility: voice activation,
  gesturing, touch interaction

#### General accessibility

- Accessibility testing can have 3 components: automated testing,
  assisted technology, manual inspection

### Implementing Accessibility in an Enterprise: The Real-World Experience at the University of Ottawa

- Comparison of two approaches to accessibility and inclusion

- Inclusion is essential for people to interact

|  |  |
|----|----|
| \*\* Old Model | \*\* New Model |
| :PROPERTIES: | :PROPERTIES: |
| :CUSTOM<sub>ID</sub>: old-model | :CUSTOM<sub>ID</sub>: new-model |
| :END: | :END: |
| \- Accommodations | \- Inclusion of <sub>all</sub> people\_, accessibility, AODA |
|  |  |
| \- Individual approach | \- Systemic approach |
|  |  |
| \- Like medical model (person has the disability) | \- Social model where people's well-being are considered, Person is in a disabling situation |
|  |  |
| \- Reactive and ad hoc | \- Proactive and sustainable |
|  |  |
| \- Expert centered | \- Person centered - collaborative |
