*** Settings ***
Documentation  All test data used in test suites
Library  SeleniumLibrary  run_on_failure=Nothing

*** Variables ***
# form fields test values
${validFirstName} =  Mas
@{validLastName} =  Ruhin
${validEmail} =  ${GMAIL}
@{validPassword} =  Masruhin#  Testing$
@{validConfirmPassword} =  Nihursam170594#  
${validMobileNumber} =  082323679226

@{invalidFirstName} =  ${SPACE}  mas  sa#$  mas  @#$^&
@{invalidLastName} =  ${SPACE}  ruhin$%^  masruhin  $%^*&
@{nonGmail} =  ${HOTMAIL}  ${YAHOO}
@{invalidEmail} =  ${SPACE}  masruhin15201029@gmail.com  masruhin15201029@$%^&.com  mas$%  mas  masruhin15201029@gmail  masruhin15201029@.com  masruhin15201029.com  $%&*#*!  masruhin15201029()@gmail.com
@{invalidPassword} =  ${SPACE}  123  !@#$  test  test12  test1&  teStss  TESTING  $%^&!#
@{invalidConfirmPassword} =  ${SPACE}  123  !@#$  test  test12  test1&  teStss  TESTING  $%^&!#
@{invalidMobileNumber} =  ${SPACE}  test  test123  010  123$%

# error messages
${existedEmailError}=  Email Already Exists
${nonGmailError}=  Only Gmail email addresses are allowed
${invalidMailError}=  The Email field must contain a valid email address
${emptyEmailError}=  The Email field is required

${invalidFirstNameError}=  The First Name field must start with a capital letter and can't contain spaces or special characters
${emptyFirstNameError}=  The First name field is required

${invalidLastNameError}=  The Last Name field must start with a capital letter and can't contain spaces or special characters
${emptyLastNameError}=  The Last Name field is required

${firstNameEqualLastNameError}=  First Name and Last Name fields can't be equal

${invalidPasswordError}=  The Password field must have a capital letter, a small letter and a special character
${shortPasswordError}=  The Password field must be at least 6 characters in length
${passwordsNotMatchError}=  Password not matching with confirm password
${emptyPasswordError}=  The Password field is required

${invalidMobileError}=  Please enter a valid mobile number
${emptyMobileError}=  The Mobile Number field is required

${loginFaliure} =  Invalid Email or Password

# Registration form fields locators
${firstNameField} =  firstname
${lastNameField} =  lastname
${emailField} =  email
${mobileNumberField} =  phone
${passwordField} =  password
${confirmPasswordField} =  confirmpassword
${registerButton} =  //*[@id="headersignupform"]/div[9]/button

# Login form fields locators
${loginEmailField} =  username
${loginPasswordField} =  password
${rememberMeField} =  //*[@id="remember-me"]
${loginButton} =  //*[@id="loginfrm"]/button