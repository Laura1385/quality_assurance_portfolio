*** Settings ***
Documentation         Happy Path tests for OpenCart My Account menu interaction.
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp03_my_account.robot

*** Test Cases ***
Access Register And Login Pages Using Keyboard
    [Documentation]  Verify that a keyboard user can access the Register and Login pages through the My Account menu.
    
    [tags]  hp03    my_account

    Verify Home Page Loaded

    Navigate To Element Horizontal       ${MY_ACCOUNT_LINK}     @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER
    
    Wait Until Element Is Visible        css:div.text-end div.dropdown > ul.dropdown-menu.show
    Press Keys    None    ENTER

    Navigate To Element Arrow Down       @{REGISTER}            @{MY_ACCOUNT_MENU}    
    Press Keys    None    ENTER
    Wait Until Element Is Visible        css:#content > h1
    Element Text Should Be               css:#content > h1      Register Account

    Navigate To Element Horizontal       ${MY_ACCOUNT_LINK}     @{HEADER_FORWARD_ELEMENTS}

    Navigate To Element Arrow Down       @{LOGIN}               @{MY_ACCOUNT_MENU}    
    Press Keys    None    ENTER
    Wait Until Element Is Visible        css:#content h2
    Element Text Should Be               css:#content h2        New Customer