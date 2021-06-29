*** Settings ***
Library    AppiumLibrary
Resource   ../Localized/TH/LoginFunctionLocalized.robot
Resource   ../Variables/LoginFunctionVariables.robot
Resource   ../Repository/LoginFunctionRepository.robot


*** Keywords ***

Open Chrome Application
    Open Application    ${HOST}    	platformName=${platformName}	  platformVersion=${platformVersion}    deviceName=${deviceName}    appPackage=${appPackage}    appActivity=${appActivity}     noReset=${noReset}    language=${language}    locale=${locale}    chromedriverExecutable=${ChromeDriverPATH}

Open AirBNB Homepage
    Go To Url           ${airbnbURL}
    Switch Native to Webview

Verify AirBNB Homepage
    URL Should Match Regex     ${airbnbURLTH} 
    Wait Until Element Is Visible      ${hompageSearchbox}
    Wait Until Page Contains    ${explore}
    Wait Until Page Contains    ${wishlist}
    Wait Until Page Contains    ${login}

Signup with no number input
    Click Element    ${btnlogin}
    sleep   3s
    Wait Until Page Contains Element     ${txtphoneNumber}
    Wait Until Page Contains Element     ${btnSignup}
    Wait Until Page Contains Element     ${btnauthFacebook}
    Wait Until Page Contains Element     ${btnauthGoogle} 
    Wait Until Page Contains Element     ${btnauthApple} 
    Click Element    ${btnSignup}
    Element Should Contain Text    ${errorNotFillNumber}     ${errorMgs}
    
URL Should Match Regex
    [Arguments]   ${Arg1}
    ${CURURL}     execute script  return window.top.location.href.toString()
    log    ${CURURL}
    Should Match Regexp   ${CURURL}     ${Arg1}

Switch Native to Webview
    Sleep     5s
    ${all_contexts}=     get contexts
    Log Many     ${all_contexts}
    Switch To Context   ${WEBVIEW_chrome}