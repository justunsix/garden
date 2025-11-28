---
filetags: ":accessibility:standards:epubnote:web:testing:a11y:"
id: 7d7f92a9-10e2-405a-aa80-407b8b3dc0c5
title: Using Bookmarklets for Accessibility Testing
---

I was inspired to use JavaScript for testing by the presentation
[Automated Accessibility Audits by Pamela Fox, North Bay Python
2023](https://pamelafox.github.io/my-py-talks/automate-a11y/) which sets
up accessibility testing automation in Python using accessibility and
web testing libraries.

Source: [Bookmarklets for Better Accessibility
Testing](https://youtu.be/25bZsYaKRPg) with Natalie MacLees for a
hands-on walkthrough of accessibility bookmarklets - simple, powerful
tools you can run right in your browser to test for common accessibility
issues.

## Use case and example usage

Run custom accessibility tests or assist in manual testing in your
browser. Select from your bookmarks to run like check specific [Web
Content Accessibility Guidelines
(WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/) criteria or
change what you see to make check easier.

An example is running a bookmarklet to change the size of your cursor to
a box that matches accessible height of text per WCAG.

**What is a bookmarklet?** a JavaScript program/function you can run
from your browser. It can do things like analyze a page, open sites, and
anything Javascript can do.

## Getting Started and Setting up Bookmarklets

You must only get bookmarklets from a trusted source or write them
yourself and verify their function. Running bookmarklets would have
access to the web page data and can also execute other functions.

Recommended site: [GitHub - oaa-tools/bookmarklets: Web Accessibility
Bookmarklets](https://github.com/oaa-tools/bookmarklets) to highlight
classes of elements on a web page like landmarks (navigation, header,
others), and HTML elements.

Once you have the bookmarklet, go to the page for testing and click on
the bookmarklet. Refresh the page to clear any applied bookmarklets.

## Creating bookmarklets

To create a bookmarklet, create a new bookmark in your browser. Name it
and in the URL field, paste the JavaScript. The bookmarklet will be
available in the browser.

Another way if available in a website is to drag or copy the bookmark to
your browser.

For code samples, see section on Bookmarklets in [JavaScript
Snippets](/garden/notes/005-computer-snippets-javascript) - [JavaScript
Snippets](id:9d66cc02-f8c7-46e0-8f92-da79b107f1c7)

## Examples of Using Bookmarklets in Manual Web Accessibility Testing

- Check specific WCAG items like font sizes, text spacing, grouped
  fields
- Checking all landmarks, headings, images, links on page
- Colour contrast, check contrast on hover of links
- See where Accessible Rich Internet Applications (ARIA) is use and
  generate report for inspection like unnecessary roles
- Verify elements have focus styles, correct focus order

## ANDI

[Accessible Name & Description Inspector
(ANDI)](https://www.ssa.gov/accessibility/andi/help/howtouse.html) is a
US Section 508 accessibility compliance tool, by United States Social
Security Administration - [GitHub
Repository](https://github.com/SSAgov/ANDI). It helps tests
automatically detect accessibility issues, make improvement suggestions,
and shows what a screen reader says for interactive elements.

### Example usage

ANDI will scan elements on page and show a tester features like:

- Arrows: navigate to next, previous elements
- Accessibility Alert: Possible problems on page
- "ANDI Output": Display what a screen reader would read out

Advanced settings show element highlights, linearize page

1.  Focusable Elements

    - Go through order of elements

2.  Graphics and Images

    - Find images
    - See alerts
    - Hide, find background images

3.  Links and Buttons

    Find elements

4.  Structures

    Works on headings, lists, landmarks, live regions, reading order,
    page title, page language, role attribute

5.  Colour Contrast

    Find contrast issues like showing colours and suggestions on
    accessible colours or warn on background images that require manual
    checks.

6.  Hidden Content

    Reveal all hidden content for checks and determine hiding technique
    (display, overflow, absolute positions), and find ARIA hidden true
    elements.

## See Also

### Resources

- [Accessibility
  Bookmarklets](https://accessibility-bookmarklets.org/install.html) -
  highlights and allows test of Landmarks, Headings, Lists, Images,
  Forms
- [JavaScript Bookmarklets](http://pauljadam.com/bookmarklets/) -
  supported on browsers and mobile phones and allows testing of many
  elements
- [Diagnostic.css](http://www.karlgroves.com/2013/09/07/diagnostic-css-super-quick-web-accessibility-testing/)﻿ -
  CSS (cascading style sheet) files to help with accessibility issues
- [HTML Codesniffer](https://squizlabs.github.io/HTML_CodeSniffer/) -
  checks HTML code for violations against WCAG 2.1 at all three levels
  (A, AA, AAA)
- [Text Spacing Bookmarklet](https://s.codepen.io/stevef/debug/YLMqbo)﻿ -
  tests [WCAG 2.1 Success Criterion 1.4.12 Text
  Spacing](https://www.w3.org/TR/WCAG21/#text-spacing)
- [ANDI](https://www.ssa.gov/accessibility/andi/help/install.html) -
  show what screen readers say for interactive elements
