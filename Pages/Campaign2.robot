*** Settings ***
Library        SeleniumLibrary
Resource       Resorces.robot

*** Variables ***
${CAMPAIGN_NAME}        Test Campaign for Automation2
${SUBMISSION_DUE_DATE}  2024-11-20
${CLIENT_DUE_DATE}      2024-11-20
${CREATIVE_TALENT}      CreativeTalent1

*** Test Cases ***
[Set up]    Start browser and maximize
    # Open Campaign Form
    Click Element        ${campaign_button}
    Click Element        xpath://span[@id="select2-id_client_name-container"]

    # Input Campaign Name
    Input Text           xpath://input[@name="name"]        ${CAMPAIGN_NAME}

    # Select Category
    Select From List By Value    xpath://select[@name="client_category"]        TT

    # Select Storyboard
    Click Element                xpath://span[@id="select2-id_storyboard-container"]

    # Input Submission Due Date
    Wait Until Element Is Visible    xpath://input[@id='id_batch_due_date']    timeout=10
    Input Text                      xpath://input[@id='id_batch_due_date']    ${SUBMISSION_DUE_DATE}

    # Input Client Due Date
    Wait Until Element Is Visible    xpath://input[@id='id_due_date']         timeout=10
    Input Text                      xpath://input[@id='id_due_date']         ${CLIENT_DUE_DATE}

    # Enter Budget
    Input Text                      xpath://input[@name="budget"]            1000

    # Select Creative Talent Managers
    Scroll Element Into View        xpath://ul[@class="select2-selection__rendered"]
    Click Element                   xpath://ul[@class="select2-selection__rendered"]
    Input Text                      xpath://input[@class="select2-search__field"]    ${CREATIVE_TALENT}
    Press Key                       xpath://input[@class="select2-search__field"]    ENTER
    Sleep                           1  # Allow time for the selection to process
    ${selected_value}=              Get Text    xpath://ul[@class="select2-selection__rendered"]
    Log To Console                  Selected Value: ${selected_value}
    Should Contain                  ${selected_value}    ${CREATIVE_TALENT}

    # Scroll to Submit Button and Click
    Scroll Element Into View        xpath://button[@class="btn btn-primary"]
    Wait Until Element Is Visible   xpath://button[@class="btn btn-primary"]    timeout=10
    Click Button                    xpath://button[@class="btn btn-primary"]

    # Handle Unexpected Alert
    Wait Until Alert Is Present     timeout=5
    ${alert_text}=                  Handle Alert
    Log To Console                  Alert Message: ${alert_text}

    # Verify the Created Campaign Name
    Wait Until Element Is Visible   xpath://a[contains(text(),'${CAMPAIGN_NAME}')]    timeout=10
    ${actual_campaign_name}=        Get Text        xpath://a[contains(text(),'${CAMPAIGN_NAME}')]
    Should Be Equal As Strings      ${actual_campaign_name}        ${CAMPAIGN_NAME}
