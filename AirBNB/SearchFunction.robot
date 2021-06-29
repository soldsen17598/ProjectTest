*** Settings ***
Resource   Keyword/SearchFunctionKeywords.robot


*** Test Cases ***

Search Daily Hotels Success
    Open Chrome Application
    Open AirBNB Homepage
    Verify AirBNB Homepage
    Searh for Daily Hotel
    Verify Search list
    Select Search list     ${btndailyHotel}
    Verify Calendar
    Select Date
    Verify Visitor
    Select Visitor
    Verify Hotels Search Result
    [Teardown]     Close Application


Search Monthly Hotels Success
    Open Chrome Application
    Open AirBNB Homepage
    Verify AirBNB Homepage
    Searh for Daily Hotel
    Verify Search list
    Select Search list     ${btnmonthlyHotel}
    Verify Calendar
    Select Monthly Date
    Verify Visitor
    Select Visitor
    Verify Hotels Search Result
    [Teardown]     Close Application
