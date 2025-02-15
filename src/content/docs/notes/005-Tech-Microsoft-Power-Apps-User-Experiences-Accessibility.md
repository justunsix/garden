---
filetags: ":power-app:power-platform:accessibility:epubnote:"
id: f004146f-09a8-4e65-823d-bfe51b52353c
title: Microsoft Power Apps User Experience and Accessibility
---

Source: My notes on Microsoft session with Sravani Seethi on 2023-02-27

## Background

- About 15% of the world's population have some form of disability and
  30% have vision impairements and less than 10% have hearing
  impairments
- Disability - mismatches human interactions
- Types of Accessibility Needs:
  - Permanent (body), Temporary (injuries), and Situation (during a job,
    family situation)
  - Touch, See, Hear, Speak
- Advantages of accessibility
  - More users
  - Inclusion
  - Save time for future development
  - It is kind

## Built-In Accessibility for Power App Makers

- Accessible app development like contrast, shortcuts

- Remember you have more responsibility of development when you have
  more control For example, high control and responsibilty for canvas
  apps and custom development and lower for packaged apps and model
  driven apps

- Best practices:

  - Use app templates
  - Use color contrast
  - Assistive technology like keyboard navigation
  - Use default theme - much research was done and that theme is the
    most accessible
  - Use accessibility checker
    - Under accessibility, common issues are missing accessible labels
  - Use [Accessibility Insights for
    Windows](https://accessibilityinsights.io/docs/windows/overview/) to
    scan app
    - For example, checks color contrast
  - Use solutions to test accessibility before deployments
  - Name screens in app as they will be used by screen readers
  - For controls, labels, components:
    - `Role` set to heading like fx:
      - `TextRole.Heading1`
    - Use `tooltip` and `AccessibileLabel` to describe controls on hover
      and screen readers
    - `Live` is Assertive, Off, Polite - sets whether a screen reader
      should be read by screen reader during field changes
  - Use HTML controls to custom development the screen
  - Check <https://pcf.gallery> for custom Typescript Power Platform
    controls
  - Control design:
    - Set control sizes based on app/parent control like fx
      `2*Parent.Height/3`
    - Use containers to control sizes of controls inside the containers
    - Use controls like flexible galleries which will scale based on
      items

- Known issues / gaps

  - Power Apps does not support accessible modals (messages in
    foreground like accept something)
  - Scroll bars not accessible with keyboard only
  - Date picker is fixed

## User Experience with Accessibility

- Users can use:
  - Screen readers
  - Scan mode: jump to different controls
  - Transcription
  - Keyboard shortcuts

## Demonstration

- Show different functions:
  - Change theme, font size
    - For example themes/font choices for a user can be stored in
      Dataverse to persist them
