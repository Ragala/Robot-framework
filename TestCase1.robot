*** Settings ***
Documentation    Suite description
Documentation  This is to test the google with Robot framework.
Library  Selenium2Library
Library  validateString

Suite Setup  Open browser with given url  ${Browser}
Suite Teardown  Close the browser


*** Variables ***
${Browser} =  chrome
${searchText} =  Robot Framework


*** Test Cases ***
Task one on the basics
    [Tags]    Task1
    Check google homepage is opened
    Search for a given text   ${searchText}
    Click on the search button
    Validate the search result
    Click on the images Tab
    Click on the Robot Framework Icon Image
    Wait for 3 seconds

*** Keywords ***
Open browser with given url
    [Arguments]  ${Browser}
    Open browser   https://www.google.com    ${Browser}
    maximize browser window

Check google homepage is opened
    wait until page contains element  xpath=.//*[@alt='Google']


Search for a given text
    [Arguments]  ${searchElement}
    input text  name=q   ${searchElement}


Click on the search button
    click element  xpath=//*[@value='Google Search']


Validate the search result
    wait until page contains  About
    ${searchText}=  get text    id=resultStats
    log  Search result contains is ${searchText}
    log to console  Search result contains is ${searchText}
    ${msg} =  validate string is empty  ${searchText}
    Run keyword if   ${msg}    Fail    the page didnt search for an text

Click on the images Tab
    click element  xpath=//*[text()='Images']

Click on the Robot Framework Icon Image
    click element  xpath=(//*[@class='rg_l']/img)[1]

Wait for 3 seconds
    sleep  3s

Close the browser
    close browser