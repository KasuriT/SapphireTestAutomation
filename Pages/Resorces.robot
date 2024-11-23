*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}        https://testing.sapphireapps.com/authentication/login/
${campaign_url}        https://testing.sapphireapps.com/agency/htmx/campaigns/
${browser}        Chrome
${expected_title}        Login - Sapphire Studios
# Locators of Login Page
${email}        xpath://input[@name="username"]
${password}        xpath://input[@name="password"]
${login_button}        xpath://button[@id="login-button"]

# Locators of Campaign Page
${campaign_button}        xpath://span[@class="ml-2 text-white"]
${campaign_form_locator}        xpath://span[@id="select2-id_client_name-container"]
${campaign_name_locator}        xpath://input[@name="name"]
${select_category_locator}        xpath://select[@name="client_category"]
${select_storyboard_locator}        xpath://span[@id="select2-id_storyboard-container"]
${submission_due_date_locator}        xpath://input[@id='id_batch_due_date']
${client_due_date_locator}        xpath://input[@id='id_due_date']
${budget_locator}        xpath://input[@name="budget"]
${creative_talent_locator}        xpath://ul[@class="select2-selection__rendered"]
${account_manager_locator}        xpath:(//ul[@class="select2-selection__rendered"])[2]
${creative_leads_locator}        xpath:(//ul[@class="select2-selection__rendered"])[3]
${submit_button}        xpath://button[@class="btn btn-primary"]
${SapTester_locator}        xpath://li[contains(text(), 'SapTester')]
${AgentJ_locator}        xpath://li[contains(text(), 'Agent J')]
${TesterKasuri_locator}        xpath://li[contains(text(), 'Tester Kasuri')]
       



*** Keywords ***
Start browser and maximize
    Open Browser        ${url}        ${browser}
    Maximize Browser Window
    Input Text        ${email}        agency@sapphireapps.com
    Input Password        ${password}        j*1N7iEF7T%O
    Scroll Element Into View        ${login_button}
    Wait Until Element Is Visible        ${login_button}        timeout=10s
    Click Button        ${login_button}
