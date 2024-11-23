*** Settings ***
Library        SeleniumLibrary
Library        ../TestData/ReadData.py
Resource        Resorces.robot
Resource        ../Resources/UserKeywords.robot



*** Variables ***


*** Test Cases ***
Login with valid credentials
    Open Browser        ${url}        ${browser}
    Maximize Browser Window

    ${row}=        Read Number of Rows        Sheet1
    
    FOR    ${i}        IN RANGE    1        ${row}+1
        ${emailInput}=        Read Excel Data of Cell        Sheet1        ${i}        1
        ${passwordInput}=        Read Excel Data Of Cell        Sheet1        ${i}        2
        Input Text        ${email}        ${emailInput}
        Input Text        ${password}       ${passwordInput}
        Scroll Element Into View        ${login_button}        
        Wait Until Element Is Visible        ${login_button}        timeout=10s
        Click Element        ${login_button}
        Sleep        5 seconds
        Go To        ${url}
    END
    Close Browser


#Verify the Title of Login Page
    #Wait Until Page Contains Element        ${campaign_page}        timeout=10s
    # Verify the title of the new page
    #Title Should Be        ${expected_title}
    # Close the browser after verification
    #Close Browser
    
