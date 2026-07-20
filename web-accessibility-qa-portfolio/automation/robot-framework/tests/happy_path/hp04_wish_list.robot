*** Settings ***
Documentation         Happy Path tests for OpenCart Wish List interaction.
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp04_wish_list.robot

*** Test Cases ***
Access Wish List Using Keyboard
    [Documentation]  Verify that a guest user is redirected to the login page 
    ...    when attempting to add a product to the Wish List using the keyboard.
    
    [tags]  happy_path wishlist

    Verify Home Page Loaded
    
    Navigate To Element Horizontal         ${WISH_LIST_LINK}     @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER

    Wait Until Element Is Visible          css:#content h2
    Element Text Should Be                 css:#content h2       New Customer

    Navigate To Element                    ${BREADCRUMB_HOME_LINK}  
    Press Keys    None    ENTER

    Verify Home Page Is Displayed

    Navigate To Element                    css:#content div.row > div.col:first-child button[formaction*="account/wishlist"]
    Press Keys    None    ENTER

    Wait Until Element Contains            css:#alert .alert    You must login or create an account to save    3s