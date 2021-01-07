*** Settings ***
Documentation  Registration Test Suite
Resource  ../Resources/common.robot
Resource  ../Resources/testData.robot
Resource  ../Resources/urls.robot
Resource  ../Resources/helpers.robot
Resource  ../Resources/PO/register.robot

Test Setup  Begin Registration Test
Test Teardown  End Registration Test

*** Test Cases ***
Verify user register successfully with valid data
    [Documentation]  Register user with valid data
    [Tags]  Smoke
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${validEmail}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check Current URL  ${loginPage}

Verify email is unique for each user
    [Documentation]  Register with an existing email address
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${validEmail}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${existedEmailError}

Verify allowing only Gmail email addresses
    [Documentation]  Register with a non Gmail email address
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  @{nonGmail}[0]  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${nonGmailError}

    helpers.Change Field Value  ${emailField}  @{nonGmail}[1]
    register.Click On Sign Up
    helpers.Check error message  ${nonGmailError}

Verify not accepting invalid email address formats
    [Documentation]  Register with invalid format for email address
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  @{invalidEmail}[1]  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[2]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[3]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[4]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[5]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[6]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[7]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[8]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

    helpers.Change Field Value  ${emailField}  @{invalidEmail}[9]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

Verify not accepting special characters in email format before domain name
    [Documentation]  Register with invalid email with special characters before domain name
    ${invalidEmail} =  helpers.Generate Invalid Test Email
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${invalidEmail}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMailError}

Verify not accepting invalid first name field value
    [Documentation]  Register with invalid first name field
    ${validEmailValue} =  helpers.Generate Valid Test Email  1
    register.Input Registeration Form Fields  @{invalidFirstName}[1]  @{validlastName}[0]  ${validMobileNumber}  ${validEmailValue}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${invalidFirstNameError}

    helpers.Change Field Value  ${firstNameField}  @{invalidFirstName}[2]
    register.Click On Sign Up
    helpers.Check error message  ${invalidFirstNameError}

    helpers.Change Field Value  ${firstNameField}  @{invalidFirstName}[3]
    register.Click On Sign Up
    helpers.Check error message  ${invalidFirstNameError}

    helpers.Change Field Value  ${firstNameField}  @{invalidFirstName}[4]
    register.Click On Sign Up
    helpers.Check error message  ${invalidFirstNameError}

Verify not accepting invalid last name field value
    [Documentation]  Register with invalid last name field
    ${validEmailValue} =  helpers.Generate Valid Test Email  2
    register.Input Registeration Form Fields  ${validFirstName}  @{invalidLastName}[1]  ${validMobileNumber}  ${validEmailValue}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${invalidLastNameError}

    helpers.Change Field Value  ${lastNameField}  @{invalidLastName}[2]
    register.Click On Sign Up
    helpers.Check error message  ${invalidLastNameError}

    helpers.Change Field Value  ${lastNameField}  @{invalidLastName}[3]
    register.Click On Sign Up
    helpers.Check error message  ${invalidLastNameError}

    helpers.Change Field Value  ${lastNameField}  @{invalidLastName}[4]
    register.Click On Sign Up
    helpers.Check error message  ${invalidLastNameError}

Verify not accepting equal values for first and last name fields
    [Documentation]  Register with equal values for first and last name fields
    ${validEmailValue} =  helpers.Generate Valid Test Email  3
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[1]  ${validMobileNumber}  ${validEmailValue}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${firstNameEqualLastNameError}

Verify not accepting invalid password field value
    [Documentation]  Register with invalid password field
    ${validEmailValue} =  helpers.Generate Valid Test Email  4
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${validEmailValue}  @{invalidPassword}[4]  @{invalidConfirmPassword}[4]
    register.Click On Sign Up
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[5]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[5]
    register.Click On Sign Up
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[6]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[6]
    register.Click On Sign Up
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[7]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[7]
    register.Click On Sign Up
    helpers.Check error message  ${invalidPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[8]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[8]
    register.Click On Sign Up
    helpers.Check error message  ${invalidPasswordError}

Verify not accepting less than 6 characters for password field value
    [Documentation]  Register with short length password field
    ${validEmailValue} =  helpers.Generate Valid Test Email  5
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${validEmailValue}  @{invalidPassword}[1]  @{invalidConfirmPassword}[1]
    register.Click On Sign Up
    helpers.Check error message  ${shortPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[2]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[2]
    register.Click On Sign Up
    helpers.Check error message  ${shortPasswordError}

    helpers.Change Field Value  ${passwordField}  @{invalidPassword}[3]
    helpers.Change Field Value  ${confirmPasswordField}  @{invalidConfirmPassword}[3]
    register.Click On Sign Up
    helpers.Check error message  ${shortPasswordError}

Verify not accepting different values for password and confirm password fields
    [Documentation]  Register with different values for password and confirm password fields
    ${validEmailValue} =  helpers.Generate Valid Test Email  6
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  ${validMobileNumber}  ${validEmailValue}  @{validPassword}[0]  @{validConfirmPassword}[1]
    register.Click On Sign Up
    helpers.Check error message  ${passwordsNotMatchError}

Verify not accepting invalid mobile format
    [Documentation]  Register with invalid mobile number field
    ${validEmailValue} =  helpers.Generate Valid Test Email  7
    register.Input Registeration Form Fields  ${validFirstName}  @{validLastName}[0]  @{invalidMobileNumber}[1]  ${validEmailValue}  @{validPassword}[0]  @{validConfirmPassword}[0]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMobileError}

    helpers.Change Field Value  ${mobileNumberField}  @{invalidMobileNumber}[2]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMobileError}

    helpers.Change Field Value  ${mobileNumberField}  @{invalidMobileNumber}[3]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMobileError}

    helpers.Change Field Value  ${mobileNumberField}  @{invalidMobileNumber}[4]
    register.Click On Sign Up
    helpers.Check error message  ${invalidMobileError}

Verify all mandatory fields gives error when left blank or filled with spaces
    [Documentation]  Register with blank/space fields
    register.Click On Sign Up
    register.Check mandatory fields errors

    register.Input Registeration Form Fields  @{invalidFirstName}[0]  @{invalidLastName}[0]  @{invalidMobileNumber}[0]  @{invalidEmail}[0]  @{invalidPassword}[0]  @{invalidConfirmPassword}[0]
    register.Click On Sign Up
    register.Check mandatory fields errors

