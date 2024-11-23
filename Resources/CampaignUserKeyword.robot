*** Settings ***
Library        SeleniumLibrary
Library        ../TestData/ReadCampaignData.py

*** Variables ***

*** Keywords ***
Read Number of Rows
    [Arguments]        ${Sheetname}
    ${maxr}=        fetch_number_of_rows        ${Sheetname}
    [Return]        ${maxr}
    
Read Excel Data of Cell
    [Arguments]        ${Sheetname}        ${row}        ${cell}
    ${celldata}=        Fetch Cell Data        ${Sheetname}        ${row}        ${cell}
    [Return]        ${celldata}