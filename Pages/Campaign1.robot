*** Settings ***
Library        SeleniumLibrary
Resource       Resorces.robot

*** Variables ***
${CAMPAIGN_NAME}        Test Campaign for Automation2
${SUBMISSION_DUE_DATE}        2024-11-20
${CLIENT_DUE_DATE}        2024-11-20


*** Test Cases ***
[Set up]    Start browser and maximize
    # Open Campaign Form
    Click Element        ${campaign_button}
    Click Element        xpath://span[@id="select2-id_client_name-container"]

    # Input Campaign Name
    Input Text        xpath://input[@name="name"]        ${CAMPAIGN_NAME}

    # Select Category
    Select From List By Value        xpath://select[@name="client_category"]        TT

    # Select Storyboard
    Click Element        xpath://span[@id="select2-id_storyboard-container"]

    # Input Submission Due Date
    Wait Until Element Is Visible        xpath://input[@id='id_batch_due_date']        timeout=10
    Click Element        xpath://input[@id='id_batch_due_date']    # Open the date picker if required
    Input Text        xpath://input[@id='id_batch_due_date']        ${SUBMISSION_DUE_DATE}

    # Input Client Due Date
    Wait Until Element Is Visible        xpath://input[@id='id_due_date']        timeout=10
    Input Text        xpath://input[@id='id_due_date']        ${CLIENT_DUE_DATE}

    # Enter Budget
    Input Text        xpath://input[@name="budget"]        1000

     # Select Creative Talent Managers
     
    Scroll Element Into View        xpath://ul[@class="select2-selection__rendered"]
    Click Element        xpath://ul[@class="select2-selection__rendered"]
    Wait Until Element Is Visible        xpath://li[contains(text(), 'SapTester')]        timeout=5
    Click Element        xpath://li[contains(text(), 'SapTester')]     

    # Scroll and click the element of Account Managers

    Scroll Element Into View        xpath:(//ul[@class="select2-selection__rendered"])[2]
    Click Element        xpath:(//ul[@class="select2-selection__rendered"])[2]
    Wait Until Element Is Visible        xpath://li[contains(text(), 'Agent J')]        timeout=5
    Click Element        xpath://li[contains(text(), 'Agent J')]

    # Scroll and click the element of Creative Leads

    Scroll Element Into View        xpath:(//ul[@class="select2-selection__rendered"])[3]
    Click Element        xpath:(//ul[@class="select2-selection__rendered"])[3]
    Wait Until Element Is Visible        xpath://li[contains(text(), 'Tester Kasuri')]        timeout=5
    Click Element        xpath://li[contains(text(), 'Tester Kasuri')]


    # Scroll to Submit Button and Click
    Scroll Element Into View        xpath://button[@class="btn btn-primary"]
    Wait Until Element Is Visible        xpath://button[@class="btn btn-primary"]        timeout=10
    Click Button        xpath://button[@class="btn btn-primary"]

    # Verify the Created Campaign Name
    Wait Until Element Is Visible        xpath://a[contains(text(),'${CAMPAIGN_NAME}')]        timeout=10
    ${actual_campaign_name}=        Get Text        xpath://a[contains(text(),'${CAMPAIGN_NAME}')]
    Should Be Equal As Strings        ${actual_campaign_name}        ${CAMPAIGN_NAME}

