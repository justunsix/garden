---
id: c6748d15-4042-4d28-9b3d-a0acbfbc4ce6
title: Power Fx Snippets
---

Sources: [10 PowerFX Snippets to Boost Your Power Apps
Development](https://www.linkedin.com/pulse/10-powerfx-snippets-boost-your-power-apps-development-marcel-broschk-8g0cf),
[GitHub - mathyousee/power-platform-snippets: A collection of snippets
and samples related to the Power
Platform](https://github.com/mathyousee/power-platform-snippets)

``` javascript

// Navigate in app and back using OnSelect property
Navigate(Details)
// Goes to Details screen
// Got to Details with a screen transition
Navigate(Details, ScreenTransition.Fade)

// Go back to previous screen
Back()

// Using OnVisible with a screen, make form editable
FormMode.Edit

// Get application's display attributes
App.Height
App.MinScreenHeight
App.Width

// Reference modern theme
// https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/controls/modern-controls/modern-theming
App.Theme

// Manually style a classic control with current
// modern theme
Button.Fill = App.Theme.Colors.Primary

// If statement to control visibility
If(Button.Pressed, true, false)

// Combine / Concatenate Strings
Concatenate("Welcome, ", User().FullName, "!")

// If statement to set default item in dropdown
If(UserLocation = "CA", "Canada", "Select a Country")

// Date difference calculation
DateDiff(Date1, Date2, Units)
// Calculate a user's age in years
DateDiff(BirthDate, Today(), Years)

// Sum data
Sum(Table, Expression)

// Reset form
SubmitForm(FeedbackForm); Reset(FeedbackForm)

// Get and set current logged in user information
Set(varCurrentUser, User());

Set(
    varCurrentUserID,
    LookUp(
        Users,
        'Primary Email' = User().Email
    )
);

// Filter data from https://learn.microsoft.com/en-us/power-platform/power-fx/reference/function-filter-lookup
// Filter gallery data
Filter(Products, StartsWith(ProductName, SearchInput.Text))
// Filter Items data where status is not equal to "Closed"
Filter(Items, Status <> "Closed")
// Filter data using search
Search(IceCream, "choc", Flavor)

// Using OnVisible with a screen, make changes to components
// Set data for use in components
ClearCollect(
    ButtonColorMapping,
    {Category: "WorkflowBtnColor", ButtonColor: RGBA(39, 67, 125, 1)},
    {Category: "AiPortalBtnColor", ButtonColor: RGBA(0, 128, 128, 1)},
    {Category: "DocMgmtBtnColor", ButtonColor: RGBA(4, 123, 193, 1)}
);

ClearCollect(
    ButtonData,
    {
        ID: 1,
        ButtonText: "Make Biscuits",
        Description: "Push paws up and down"
    },
    {
        ID: 2,
        ButtonText: "Chase",
        Description: "Find mouse and follow"
    },
);


// Set data depending on a condition
// If current user is the owner of record and it is in WIP Stage, allow editing, else set forms to read only
Set(
    varIsEditMode,
    If(
        varCurrentItem.Owner = varCurrentUserID  && varCurrentItem.Stage = 'Item'.WIP ,
        true,
        false
    )
);

// Notifications from https://www.powerplatformspace.com/snippets/read/8
// Display success notification
Notify("Operation completed successfully!", NotificationType.Success);

// Display error notification
Notify("An error occurred while processing your request.", NotificationType.Error);

// Display warning notification
Notify("Warning: Please check your inputs.", NotificationType.Warning);

// Notification displayed for 3 seconds
Notify("Your changes have been saved!", NotificationType.Success, 3000);

// Custom notification based on condition
If(
    IsBlank(TextInput1.Text),
    Notify("Please fill out the required field.", NotificationType.Warning),
    Notify("Form submitted successfully!", NotificationType.Success)
);

// Display a welcome notification with the user's full name, using the "Information" notification type.
Notify("Welcome back, " & User().FullName & "!", NotificationType.Information);

// User Defined Function, Supports Set, Collect, Reset, and Notify
// https://learn.microsoft.com/en-us/power-platform/power-fx/reference/object-app#user-defined-functions
Spend( Amount: Number ) : Void = {
    If( Amount > Savings,
        Error( $"{Amount} is more than available savings" ),
        Set( Savings, Savings - Amount );
        Set( Spent, Spent + Amount)
    );
}

```
