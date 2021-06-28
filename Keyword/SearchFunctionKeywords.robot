*** Settings ***
Library    AppiumLibrary
Resource   ../Localized/TH/SearchFunctionLocalized.robot
Resource   ../Variables/SearchFunctionVariables.robot
Resource   ../Repository/SearchFunctionRepository.robot


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

Searh for Daily Hotel
    Input Text        ${hompageSearchbox}     ${pattaya}
    Press Keycode     ${enterKeycode} 

Verify Search list
    Wait Until Page Contains Element    ${dailyHotel}
    Wait Until Page Contains Element    ${monthlyHotel}
    Wait Until Page Contains Element    ${experienceActivity}
    sleep    5s
    # Element Text Should Be    ${dailyHotel}     ${findDailyHotel}
    # Element Text Should Be    ${monthlyHotel}   ${findMonthlyHotel}
    # Element Text Should Be    ${experienceActivity}    ${findexperienceActivity}

Select Search list
   [Arguments]    ${searchListItem}
   Click Element    ${searchListItem}

Verify Calendar
   Wait Until Page Contains       ${calendar} 
   Wait Until Page Contains       ${specificTime}
   Element Should Contain Text    ${btnNextDate}      ${btnNextDateTH}

Select Date
    # FOR	${index}	IN	RANGE    1     61
    #     ${AttrStatus}    Get Element Attribute  (${Date})[${index}]     aria-disabled
    #     Exit For Loop If     ${AttrStatus} == "false"
    #     Run Keyword If       ${AttrStatus} == "false"     Click Element    (${Date})[${index}]
    #     Run Keyword If       ${AttrStatus} == "false"     Click Element    ${btnNextDate}
    # END
    Click Element    ${Date}
    Click Element    ${btnNextDate}


Select Monthly Date
   Click Element    ${monthlyStartDate}
   Click Element    ${monthlyEndDate} 
   Click Element    ${btnNextDate}
Verify Visitor
    Wait Until Page Contains Element    ${btndecreaseAdults}
    Wait Until Page Contains Element    ${btnincreaseAdults}
    Wait Until Page Contains Element    ${adultValue}
    Wait Until Page Contains Element    ${btndecreaseChildren}
    Wait Until Page Contains Element    ${btnincreaseChildren}
    Wait Until Page Contains Element    ${childrenValue}
    Wait Until Page Contains Element    ${btndecreaseInfants}
    Wait Until Page Contains Element    ${btnincreaseInfants}
    Wait Until Page Contains Element    ${InfantsValue}

Select Visitor
    Click Element    ${btnincreaseAdults}
    ${increasedAdultResult}    Get Text    ${adultValue}
    Should Be Equal	 ${increasedAdultResult}	   ${adultincreaseNum}
    Click Element    ${btnfind}

Verify Hotels Search Result
    Wait Until Page Contains Element     ${firstpicture}
    Wait Until Page Contains        ${pattaya}
    
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