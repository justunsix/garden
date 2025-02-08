---
description: VB Macro to detect over use of bold styles
filetags: ":microsoft:word:macro:epubnote:"
id: 2709172c-00fb-4689-ab39-956a79b4eff0
title: Microsoft Word - VB Macro to find Bolded Language and Report
---

Source: [June Morrison](https://www.linkedin.com/in/jsmorrison/) shared
by correspondence

VB macro to detect over use of bold styles where another style like
heading styles are more appropriate

To test this macro:

1.  Open your source Word document.
2.  Press Alt + F11 to open the VBA editor.
3.  Insert a new module (Insert \> Module).
4.  Copy and paste the updated code into the module.
5.  Close the VBA editor.
6.  Run the macro (Alt + F8, select HighlightAndReportBoldText, and
    click Run).

`HighlightAndReportBoldText`

``` vb

Sub HighlightAndReportBoldText()
    Dim sourceDoc As Document
    Dim reportDoc As Document
    Dim para As Paragraph
    Dim rng As Range
    Dim word As Range
    Dim boldText As String
    Dim isPreviousBold As Boolean
    Dim table As Table
    Dim row As Row
    Dim pageNumber As Long
    Dim reportFileName As String

    ' Define the source document
    Set sourceDoc = ActiveDocument

    ' Generate a unique filename for the report
    reportFileName = "Bold_Text_Report_" & Format(Now, "yyyyMMdd_HHmmss") & ".docx"

    ' Create a new document for the report
    Set reportDoc = Documents.Add

    ' Set page margins to narrow
    With reportDoc.PageSetup
        .TopMargin = CentimetersToPoints(1.27)
        .BottomMargin = CentimetersToPoints(1.27)
        .LeftMargin = CentimetersToPoints(1.27)
        .RightMargin = CentimetersToPoints(1.27)
    End With

    ' Add header to the report document
    With reportDoc.Sections(1).Headers(wdHeaderFooterPrimary).Range
        .Text = "Path and Name of Source File: " & sourceDoc.FullName & vbCrLf & _
                "Job Run User: " & Environ("Username") & vbCrLf & _
                "Date and Time of Job Run: " & Format(Now, "yyyy-MM-dd HH:mm:ss") & vbCrLf & _
                "Report File Name: " & reportFileName
        .Font.Size = 8
        .ParagraphFormat.Alignment = wdAlignParagraphLeft
    End With

    ' Add footer with page numbering centered
    With reportDoc.Sections(1).Footers(wdHeaderFooterPrimary).Range
        .ParagraphFormat.Alignment = wdAlignParagraphCenter
        .Fields.Add .Paragraphs(1).Range, wdFieldPage
        .Font.Size = 8
    End With

    ' Add two lines before the Instructions section
    reportDoc.Content.InsertParagraphAfter
    reportDoc.Content.InsertParagraphAfter

    ' Add instructions before the table report as an itemized list with each numbered sentence on a new line
    With reportDoc.Content.Paragraphs.Add.Range
        .Text = "Instructions:" & vbCrLf & _
                "1. Review the Table results for use of Bolding and determine if where Normal Style text is shown whether the wording would be better presented as a Heading 2 or Heading 3 (and make use of Styles formatting) thereby meeting Accessibility requirements to aid Screen Readers." & vbCrLf & _
                "2. Review the other Normal Style results of bolding and determine the content to be used in a Glossary of Terms table to be inserted into the document with a preceding Caption identifying the Table as a Glossary of Terms." & vbCrLf & _
                "3. Review the bolding for 'over use' and remove bolding if the Word/Term or Word String/Phrase is not a Heading or not included in the Glossary of Terms.  Note:  Only need to bold a Glossary of Term Word/Term or Word String/Phrase once in the document to bring attention to fact it is inventoried and described in the referenced table." & vbCrLf & _
                "4. Where numbered lists exist (either manually or by using Styles) and bolding was used for the lead-in keywords, consider another approach to emphasize by defining a new Style or using Underline to set it apart from the Normal Style if there is a benefit in doing so." & vbCrLf & _
                "5. Review where there is no content in Column 1 Cell, but a line exists denoting the Style and other information.  This usually indicates an extra Line Return (Paragraph) that should be removed, and Before/After Paragraph Spacing modified to create the effect desired.  Check FIle Properties and Turn On Display ALL to see coding attributes to find and fix these instances." & vbCrLf & _
                "6. Where Tables exist to showcase columnar information, apart from the Heading Row and left-most Column that is used to identify the row's purpose, ensure that bolding is not misused or overused in the body of the Table (e.g., a keyword or dollar amount)." & vbCrLf & _
                "7. Once all document content fixes are applied in the Source Document, reset the Yellow Highlighted Bolded Instances to White."
        .Font.Size = 11
        .ParagraphFormat.Alignment = wdAlignParagraphLeft
        .ParagraphFormat.Space2
        .InsertParagraphAfter
    End With

    ' Add a table with four columns: Finding, Page Number, Style, Font
    Set table = reportDoc.Tables.Add(reportDoc.Range(reportDoc.Content.End - 1), 1, 4)
    table.Cell(1, 1).Range.Text = "Finding"
    table.Cell(1, 2).Range.Text = "Page Number"
    table.Cell(1, 3).Range.Text = "Style"
    table.Cell(1, 4).Range.Text = "Font"

    ' Set the table heading to repeat on each page
    table.Rows(1).HeadingFormat = True

    ' Set column widths
    table.Columns(1).Width = CentimetersToPoints(10) ' Adjust width for the first column to accommodate longer strings
    table.Columns(2).Width = CentimetersToPoints(2)  ' Adjust width for the second column (Page Number)
    table.Columns(3).Width = CentimetersToPoints(3)  ' Adjust width for the third column (Style)
    table.Columns(4).Width = CentimetersToPoints(3)  ' Adjust width for the fourth column (Font)

    boldText = ""
    isPreviousBold = False

    ' Loop through each paragraph in the source document
    For Each para In sourceDoc.Paragraphs
        Set rng = para.Range

        ' Loop through each word in the paragraph
        For Each word In rng.Words
            If word.Font.Bold = True Then
                ' Highlight the bold text in yellow
                word.HighlightColorIndex = wdYellow

                ' Collect bold text
                If isPreviousBold Then
                    boldText = boldText & word.Text
                Else
                    If boldText <> "" Then
                        pageNumber = word.Information(wdActiveEndPageNumber)
                        Set row = table.Rows.Add
                        row.Cells(1).Range.Text = boldText
                        row.Cells(2).Range.Text = pageNumber
                        row.Cells(3).Range.Text = word.Style.NameLocal
                        row.Cells(4).Range.Text = word.Font.Name
                    End If
                    boldText = word.Text
                End If
                isPreviousBold = True
            Else
                If isPreviousBold Then
                    pageNumber = word.Information(wdActiveEndPageNumber)
                    Set row = table.Rows.Add
                    row.Cells(1).Range.Text = boldText
                    row.Cells(2).Range.Text = pageNumber
                    row.Cells(3).Range.Text = word.Style.NameLocal
                    row.Cells(4).Range.Text = word.Font.Name
                    boldText = ""
                End If
                isPreviousBold = False
            End If
        Next word

        ' Handle the last bold text in the paragraph
        If isPreviousBold Then
            pageNumber = rng.Words.Last.Information(wdActiveEndPageNumber)
            Set row = table.Rows.Add
            row.Cells(1).Range.Text = boldText
            row.Cells(2).Range.Text = pageNumber
            row.Cells(3).Range.Text = rng.Words.Last.Style.NameLocal
            row.Cells(4).Range.Text = rng.Words.Last.Font.Name
            boldText = ""
        End If
    Next para

    ' Save the report document with the generated filename in the header section.
    reportDoc.SaveAs2 reportFileName

    MsgBox "The report has been created and saved as '" & reportFileName & "'."
End Sub

```
