*** Settings ***
Documentation  Login Page
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../testData.robot
Resource  ../helpers.robot

*** Keywords ***
Click On Login
    Click Button  xpath=${loginButton}
    Sleep  10s

Input Login Form Fields
    [Arguments]  ${emailValue}  ${passwordValue}
    Input Text  ${LoginEmailField}  ${emailValue}
    Input Text  ${LoginPasswordField}  ${passwordValue}

Check mandatory fields errors
    helpers.Check error message  ${emptyEmailError}
    helpers.Check error message  ${emptyPasswordError}

Check "Remember Me"
    Select Checkbox  ${rememberMeField}