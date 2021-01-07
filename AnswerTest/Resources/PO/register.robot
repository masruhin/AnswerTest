*** Settings ***
Documentation  Registration Page
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../testData.robot
Resource  ../helpers.robot

*** Keywords ***
Click On Sign Up
    Click Button  xpath=${registerButton}
    Sleep  10s

Input Registeration Form Fields
    [Arguments]  ${firstNameValue}  ${lastNameValue}  ${mobileNumberValue}  ${emailValue}  ${passwordValue}  ${confirmPasswordValue}
    Input Text  ${firstNameField}  ${firstNameValue}
    Input Text  ${lastNameField}  ${lastNameValue}
    Input Text  ${mobileNumberField}  ${mobileNumberValue}
    Input Text  ${emailField}  ${emailValue}
    Input Text  ${passwordField}  ${passwordValue}
    Input Text  ${confirmPasswordField}  ${confirmPasswordValue}

Check mandatory fields errors
    helpers.Check error message  ${emptyEmailError}
    helpers.Check error message  ${emptyFirstNameError}
    helpers.Check error message  ${emptyLastNameError}
    helpers.Check error message  ${emptyPasswordError}
    helpers.Check error message  ${emptyMobileError}
