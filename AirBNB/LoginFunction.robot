*** Settings ***
Resource   Keyword/LoginFunctionKeywords.robot


*** Test Cases ***

Signup with blank field telephone number failed
    Open Chrome Application
    Open AirBNB Homepage
    Verify AirBNB Homepage
    Signup with no number input
    [Teardown]     Close Application
