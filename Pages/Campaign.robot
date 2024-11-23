*** Settings ***
Library        SeleniumLibrary
Library        ../TestData/ReadCampaignData.py
Resource        ../Resources/CampaignUserKeyword.robot
Resource       Resorces.robot

*** Variables ***


*** Test Cases ***
[Set up]    Start browser and maximize
    ${row}=        Read Number Of Rows        Sheet1
    
    FOR    ${i}        IN RANGE    1        ${row}+1
        ${campaignNameInput}=        Read Excel Data of Cell        Sheet1        ${i}        1
        ${selectCategory}=        Read Excel Data Of Cell        Sheet1        ${i}        2 
        ${submissionDateInput}=        Read Excel Data Of Cell        Sheet1        ${i}        3
        ${clientDateInput}=        Read Excel Data Of Cell        Sheet1        ${i}        4
        ${budgetInput}=        Read Excel Data Of Cell        Sheet1        ${i}        5
        
    
        # Open Campaign Form
   
        Click Element        ${campaign_button}
        Click Element        ${campaign_form_locator}

        # Input Campaign Name
        Input Text        ${campaign_name_locator}        ${campaignNameInput}

        # Select Category
        Select From List By Value        ${select_category_locator}        ${selectCategory}

        # Select Storyboard
        Click Element        ${select_storyboard_locator}

        # Input Submission Due Date
        Wait Until Element Is Visible        ${submission_due_date_locator}        timeout=10
        Click Element        ${submission_due_date_locator}
        Input Text        ${submission_due_date_locator}        ${submissionDateInput}

        # Input Client Due Date
        Wait Until Element Is Visible        ${client_due_date_locator}        timeout=10
        Input Text        ${client_due_date_locator}        ${clientDateInput}

        # Enter Budget
        Input Text        ${budget_locator}        ${budgetInput}

        # Select Creative Talent Managers

        Scroll Element Into View        ${creative_talent_locator}
        Click Element        ${creative_talent_locator}
        Wait Until Element Is Visible        ${SapTester_locator}        timeout=5
        Click Element        ${SapTester_locator}


        # Scroll and click the element of Account Managers

        Scroll Element Into View        ${account_manager_locator}
        Click Element        ${account_manager_locator}
        Wait Until Element Is Visible        ${AgentJ_locator}        timeout=5
        Click Element        ${AgentJ_locator}

    # Scroll and click the element of Creative Leads

        Scroll Element Into View        ${creative_leads_locator}
        Click Element        ${creative_leads_locator}
        Wait Until Element Is Visible        ${TesterKasuri_locator}        timeout=5
        Click Element        ${TesterKasuri_locator}


        # Scroll to Submit Button and Click
        Scroll Element Into View        ${submit_button} 
        Wait Until Element Is Visible        ${submit_button}        timeout=10
        Click Button        ${submit_button}

        # Verify the Created Campaign Name
        Wait Until Element Is Visible        xpath://a[contains(text(),'${campaignNameInput}')]        timeout=10
        ${actual_campaign_name}=        Get Text        xpath://a[contains(text(),'${campaignNameInput}')]
        Should Be Equal As Strings        ${actual_campaign_name}        ${campaignNameInput}
        Go To        ${campaign_url}
    END
    Close Browser