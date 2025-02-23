---
filetags: ":snippets:mermaid:tech:epubnote:"
id: 50c2d4f2-8613-4b6b-a6ef-12f43376e2d6
title: Mermaid Diagrams Snippets
---

## Graphs

### Basic and Decision Flow

``` mermaid
graph LR
    id1[This is the text in the box]

    sq[Square shape] --> ci((Circle shape))

    subgraph one
        A[Start] --> B{Is it?};
        B ---->|No| E[End];
        B -->|Yes| C[OK];
        C --> D[Rethink];
        D --> B;
    end
```

### Formatting

``` mermaid
graph LR
    subgraph two
        b1-->b2;
    end

    subgraph three
        od>Odd shape]-- Two line<br/>edge comment --> ro
        di{Diamond with <br/> line break} -.-> ro(Rounded<br>square<br>shape)
        di==>ro2(Rounded square shape)
    end

    %% Notice that no text in shape are added here instead that is appended further down
    e --> od3>Really long text with linebreak<br>in an Odd shape]

    %% Comments after double percent signs
    e((Inner / circle<br>and some odd <br>special characters)) --> f(,.?!+-*ز)

    cyr[Cyrillic]-->cyr2((Circle shape Начало));

     classDef green fill:#9f6,stroke:#333,stroke-width:2px;
     classDef orange fill:#f96,stroke:#333,stroke-width:4px;
     class sq,e green
     class di red
```

## Flowchart

``` mermaid

flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
    one --> two
    three --> two
    two --> c2
```

## Deployment Diagram using Flowchart

``` mermaid
graph TD
    subgraph Figure 2 ArcGIS Enterprise in Document with Possible other Deployment Components
        A>ArcGIS Web Adaptor 1] --- B(ArcGIS Portal) --- C{ArcGIS Server};
        G>ArcGIS Web Adaptor 2] --- C
        C --- E[(ArcGIS Data Store)];
        C --- GEODB[(ArcGIS Geodatabase)]
        U1{{Internal Users}} --- A
        U2{{External Users}} --- R[Reverse Proxy] --- A
        U3{{External Users via ArcGIS Online}} --- R
        Workflow[Workflow Manager] --- SMTP[SMTP Server]
        B --- Workflow
        Workflow --- GEODB
    end
```

### Flowchart with Decisions

Symptoms of thrombosis or bleeding:

- headache
- vision issues
- back pain
- shortness of breath
- chest or abdominal pain

``` mermaid

graph TD
    Symptoms[As stated above] --> Onset{Symptom onset between 4 and 28 days after vaccination}
    Onset --> |Yes| CBC[Order CBC]
    Onset --> |No| VITTu[VITT unlikely - Do not process to HIT testing. Work up alternate diagonoses, including non-VITT thrombosis...]
    CBC --> CBCcount[CBC shows platelets<150 x 10e9/L]
    CBCcount --> |No| VITTu
    CBCcount --> |Yes| Order[Order D-dimer, blood film imaging based on clinical suspicion]
    Order --> Result[D-dimer: elevated, Blood film: normal apart from low platelets, Imaging/testing based on clinical suspicion: blood clot or bleeding]
    Result --> |No| VITTu
    Result --> |Yes| VITT[Presumptive diagnosis of VITT Consult hematology immediately locally and externally and proceed to HIT ELISA testing, NB Rapid HIT assays are not sensitive and may have false negative results]
```

Source: [Vaccine-Induced Immune Thrombotic Thrombocytopenia (VITT)
Following Adenovirus Vector COVID-19
Vaccination](https://covid19-sciencetable.ca/sciencebrief/vaccine-induced-immune-thrombotic-thrombocytopenia-vitt-following-adenovirus-vector-covid-19-vaccination/)

### Goal Setting

``` mermaid

graph LR

        id1[Short Term, 3m] --> id2[Medium Term 3-12m] --> id3[Long Term 1-20y]
        A[Weekly Reminders] --> B[Physical health goals & metrics] --> C[Improvement in report card every 3 years]

        F[Vision boards] --> B

        D[Meditate, mindful, rhythmic exercise] --> E[Improved mental health through surveys] --> C
```

``` mermaid
graph LR

        A1[Review plans monthly] --> B1[Mantras: I'm sorry please forgive me, I forgive you, Thank you, I love you. Let Nature takes its course.]
        C1[Visit a spiritual places weekly] --> B1

```
