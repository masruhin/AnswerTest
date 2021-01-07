*** Settings ***
Documentation  All website urls used in test suites
Library  SeleniumLibrary  run_on_failure=Nothing

*** Variables ***
${registerPage} =  https://www.phptravels.net/register
${loginPage} =  https://www.phptravels.net/login
${accountPage} =  https://www.phptravels.net/account/