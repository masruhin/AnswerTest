*** Settings ***
Documentation  Login Test Suite
Resource  ../Resources/common.robot
Resource  ../Resources/testData.robot
Resource  ../Resources/urls.robot
Resource  ../Resources/helpers.robot
Resource  ../Resources/PO/login.robot

Test Setup  Begin Login Test
Test Teardown  End Login Test

*** Test Cases ***
Verify user login successfully with valid data
    [Documentation]  Login user with valid email and password
    [Tags]  Smoke
    login.Input Login Form Fields  ${validEmail}  @{validpassword}[0]
    login.Click On Login
    helpers.Check Current URL  ${accountPage}

Verify all mandatory fields gives error when left blank or filled with spaces
    [Documentation]  Login with blank/space fields
    login.Click On Login
    login.Check mandatory fields errors

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[0]
    helpers.Change Field Value  ${loginPasswordField}  @{invalidPassword}[0]
    login.Click On Login
    login.Check mandatory fields errors

Verify not accepting a non registered email address
    [Documentation]  Login with a non registered email address
    ${validEmail} =  helpers.Generate Valid Test Email  100
    login.Input Login Form Fields  ${validEmail}  @{validpassword}[0]
    login.Click On Login
    helpers.Check error message  ${loginFaliure}

Verify not accepting login with wrong password
    [Documentation]  Login with wrong password
    login.Input Login Form Fields  ${validEmail}  @{validpassword}[1]
    login.Click On Login
    helpers.Check error message  ${loginFaliure}

Verify allowing only Gmail email addresses
    [Documentation]  Login with a non Gmail email address
    login.Input Login Form Fields  @{nonGmail}[0]  @{validpassword}[0]
    login.Click On Login
    helpers.Check error message  ${nonGmailError}

    helpers.Change Field Value  ${loginEmailField}  @{nonGmail}[1]
    login.Click On Login
    helpers.Check error message  ${nonGmailError}

Verify not accepting invalid email address formats
    [Documentation]  Login with invalid format for email address
    ${specialCharsEmail} =  helpers.Generate Invalid Test Email
    login.Input Login Form Fields  ${specialCharsEmail}  @{validPassword}[0]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    login.Input Login Form Fields  @{invalidEmail}[1]  @{validPassword}[0]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[2]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[3]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[4]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[5]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[6]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[7]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[8]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${loginEmailField}  @{invalidEmail}[9]
    login.Click On Login
    helpers.Check error message  ${invalidMailError}

     helpers.Change Field Value  ${loginEmailField}  ${invalidEmail}
     login.Click On Login
     helpers.Check error message  ${invalidMailError}

Verify not accepting invalid format for password field value
    [Documentation]  Login with invalid password field
    login.Input Login Form Fields  ${validEmail}  @{invalidPassword}[4]
    login.Click On Login
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${loginPasswordField}  @{invalidPassword}[5]
    login.Click On Login
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${loginPasswordField}  @{invalidPassword}[6]
    login.Click On Login
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${loginPasswordField}  @{invalidPassword}[7]
    login.Click On Login
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${loginPasswordField}  @{invalidPassword}[8]
    login.Click On Login
    helpers.Check error message  ${invalidPasswordError}

Verify not accepting less than 6 characters for password field value
    [Documentation]  Login with short length password field
    login.Input Login Form Fields  ${validEmail}  @{invalidPassword}[1]
    login.Click On Login
    helpers.Check error message  ${shortPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[2]
    login.Click On Login
    helpers.Check error message  ${shortPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[3]
    login.Click On Login
    helpers.Check error message  ${shortPasswordError}

Verify checking Remember me keeps user logged in
    [Documentation]  Login with valid email and password and checking Remember me checkbox and navigating to login page should redirect user to his account page
    login.Input Login Form Fields  ${validEmail}  @{validPassword}[0]
    login.Check "Remember Me"
    login.Click On Login
    helpers.Close Web Browser
    helpers.Open Web Browser  ${loginPage}
    helpers.Check Current URL  ${accountPage}
