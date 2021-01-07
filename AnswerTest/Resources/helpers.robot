*** Settings ***
Documentation  General helper keywords for test suites
Library  SeleniumLibrary  run_on_failure=Nothing
Library  String
Library  Collections

*** Keywords ***
Check Current URL
    [Arguments]  ${URL}
    ${currentURL} =  Get Location
    Should Be Equal As Strings  ${URL}  ${currentURL}

Change Field Value
    [Arguments]  ${fieldLocator}  ${fieldValue}
    Clear Element Text  ${fieldLocator}
    Input Text  ${fieldLocator}  ${fieldValue}

Check error message
    [Arguments]  ${errorMessage}
    Page Should Contain  ${errorMessage}

# generating different valid email for each test case
Generate Valid Test Email
    [Arguments]  ${counter}
    @{words} =  Split String  ${GMAIL}  @
    ${test} =  Set Variable  @{words}[0]+${counter}@@{words}[1]
    [return]  ${test}

# generating different invalid email with special characters combination

Generate Invalid Test Email
    @{words} =  Split String  ${GMAIL}  @
    ${specialChars} =  Generate Random String  5  $&*%^!#
    ${email} =  Set Variable  @{words}[0]${specialChars}@gmail.com
    [return]  ${email}

Open Web Browser
    [Arguments]  ${url}
    Open Browser  ${url}  ${BROWSER}
    Maximize Browser Window

Capture screenshot
    [Arguments]  ${folderName}
    Run Keyword If Test Failed  Capture Page Screenshot  ../Results/Screenshots/${folderName}/${TEST NAME}-Failed.png

Close Web Browser
    Close Browser
