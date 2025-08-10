---
date: 2025-07-21
filetags: ":microsoft:power:automate:power-platform:epubnote:"
id: ddd4e445-43f4-4886-99f8-d2082717976d
title: Power Automate - Extracting Data from Files
---

## Extract text from Word Docx files - Options

Power Automate flows can get data stored in Microsoft Word documents and
extract data, for example processing forms and storing their field data
to the Dataverse.

These options look at getting the document content as text and writing
matching logic. Each approach is similar by differs in how to get the
content and extracting data. Details in the options are in the citation
links.

1.  Use the docx zip format, get xml, then use xpath [^1] [^2].
2.  Tachytelic has an API [^3].
3.  Convert the document to PDF and use text recognition. The
    recognition looks at the structure of the document and matching can
    use [Azure Logic Apps and Power Automate
    expressions](https://learn.microsoft.com/en-us/azure/logic-apps/expression-functions-reference)
    which in idea are similar to xpath.

Option 1 is recommended for those who do not want to use premium
services and API calls. The approach of option 1 would also work with
programming languages to extract the document and parse XML content.

Option 3 allows image processing or mix of scanned/PDF/Word documents
being processed.

[^1]: [Power Automate - Extract text from Word Docx files (no premium or
    AI modal) - YouTube](https://www.youtube.com/watch?v=G3JZFvwlTjk)

[^2]: [Extract text from Word docx files with Power
    Automate](https://tachytelic.net/2021/05/power-automate-extract-text-from-word-docx-file/)

[^3]: [Extract text from Word docx files with Power
    Automate](https://tachytelic.net/2021/05/power-automate-extract-text-from-word-docx-file/)
