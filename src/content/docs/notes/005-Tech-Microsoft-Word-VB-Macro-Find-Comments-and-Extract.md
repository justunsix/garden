---
filetags: ":microsoft:word:macro:epubnote:"
id: 0fd58dd8-1b91-4564-b1be-b596fe7350ca
title: Microsoft Word - VB Macro to find comments and extractor for them
---

Source: Macro by [Lene Fredborg, see license notice in
macro](https://www.thedoctools.com/word-macros-tips/word-macros/extract-comments-to-new-document/),
Correspondence with June M at work

Extracts comments and meta information of comments like author for
review

To use:

- Add developer tab in Word
- Add macro below and run

``` vb

Public Sub ExtractCommentsToNewDoc()

    '=========================
    'Macro created 2007 by Lene Fredborg, DocTools - www.thedoctools.com
    'Revised October 2013 by Lene Fredborg: Date column added to extract
    'THIS MACRO IS COPYRIGHT. YOU ARE WELCOME TO USE THE MACRO BUT YOU MUST KEEP THE LINE ABOVE.
    'YOU ARE NOT ALLOWED TO PUBLISH THE MACRO AS YOUR OWN, IN WHOLE OR IN PART.
    '=========================

    'The macro creates a new document
    'and extracts all comments from the active document
    'incl. metadata

    'Minor adjustments are made to the styles used
    'You may need to change the style settings and table layout to fit your needs
    '=========================


    Dim oDoc As Document
    Dim oNewDoc As Document
    Dim oTable As Table
    Dim nCount As Long
    Dim n As Long
    Dim Title As String


    Title = "Extract All Comments to New Document"
    Set oDoc = ActiveDocument
    nCount = ActiveDocument.Comments.Count


    If nCount = 0 Then
        MsgBox "The active document contains no comments.", vbOKOnly, Title
        GoTo ExitHere
    Else
        'Stop if user does not click Yes
        If MsgBox("Do  you want to extract all comments to a new document?", _
                vbYesNo + vbQuestion, Title) <> vbYes Then
            GoTo ExitHere
        End If
    End If


    Application.ScreenUpdating = False
    'Create a new document for the comments, base on Normal.dotm
    Set oNewDoc = Documents.Add
    'Set to landscape
    oNewDoc.PageSetup.Orientation = wdOrientLandscape
    'Insert a 5-column table for the comments
    With oNewDoc
        .Content = ""
        Set oTable = .Tables.Add _
            (Range:=Selection.Range, _
            NumRows:=nCount + 1, _
            NumColumns:=5)
    End With


    'Insert info in header - change date format as you wish
    oNewDoc.Sections(1).Headers(wdHeaderFooterPrimary).Range.Text = _
        "Comments extracted from: " & oDoc.FullName & vbCr & _
        "Created by: " & Application.UserName & vbCr & _
        "Creation date: " & Format(Date, "MMMM d, yyyy")

    'Adjust the Normal style and Header style
    With oNewDoc.Styles(wdStyleNormal)
        .Font.Name = "Arial"
        .Font.Size = 10
        .ParagraphFormat.LeftIndent = 0
        .ParagraphFormat.SpaceAfter = 6
    End With


    With oNewDoc.Styles(wdStyleHeader)
        .Font.Size = 8
        .ParagraphFormat.SpaceAfter = 0
    End With


    'Format the table appropriately
    With oTable
        .Range.Style = wdStyleNormal
        .AllowAutoFit = False
        .PreferredWidthType = wdPreferredWidthPercent
        .PreferredWidth = 100
        .Columns.PreferredWidthType = wdPreferredWidthPercent
        .Columns(1).PreferredWidth = 5
        .Columns(2).PreferredWidth = 23
        .Columns(3).PreferredWidth = 42
        .Columns(4).PreferredWidth = 18
        .Columns(5).PreferredWidth = 12
        .Rows(1).HeadingFormat = True
    End With


    'Insert table headings
    With oTable.Rows(1)
        .Range.Font.Bold = True
        .Cells(1).Range.Text = "Page"
        .Cells(2).Range.Text = "Comment scope"
        .Cells(3).Range.Text = "Comment text"
        .Cells(4).Range.Text = "Author"
        .Cells(5).Range.Text = "Date"
    End With


    'Get info from each comment from oDoc and insert in table
    For n = 1 To nCount
        With oTable.Rows(n + 1)
            'Page number
            .Cells(1).Range.Text = _
                oDoc.Comments(n).Scope.Information(wdActiveEndPageNumber)
            'The text marked by the comment
            .Cells(2).Range.Text = oDoc.Comments(n).Scope
            'The comment itself
            .Cells(3).Range.Text = oDoc.Comments(n).Range.Text
            'The comment author
            .Cells(4).Range.Text = oDoc.Comments(n).Author
            'The comment date in format dd-MMM-yyyy
            .Cells(5).Range.Text = Format(oDoc.Comments(n).Date, "dd-MMM-yyyy")
        End With
    Next n

    Application.ScreenUpdating = True
    Application.ScreenRefresh

    oNewDoc.Activate
    MsgBox nCount & " comments found. Finished creating comments document.", vbOKOnly, Title


ExitHere:

    Set oDoc = Nothing
    Set oNewDoc = Nothing
    Set oTable = Nothing


End Sub

```
