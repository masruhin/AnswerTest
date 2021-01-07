*** Settings ***
Documentation  Tests setup and Teardown
Library  SeleniumLibrary  run_on_failure=Nothing
Resource  ../Resources/urls.robot
Resource  ../Resources/helpers.robot

*** Keywords ***
Begin Registration Test
    helpers.Open Web Browser  ${registerPage}

End Registration Test
    helpers.Capture screenshot  register
    helpers.Close Web Browser

Begin Login Test
    helpers.Open Web Browser  ${loginPage}

End Login Test
    helpers.Capture screenshot  login
    helpers.Close Web Browser
