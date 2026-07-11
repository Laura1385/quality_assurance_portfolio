*** Settings ***
Documentation         Happy Path tests for OpenCart Currency menu interaction.
Library               SeleniumLibrary
Resource              ../../resources/common.resource
Resource              ../../resources/locators.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp01_currency_menu.robot

*** Test Cases ***
Change Currency Using Keyboard
    [Documentation]  Verify that a keyboard user can change the website currency 
    ...              and that the selected currency remains applied during navigation.
    
    [tags]  hp01    currency

    Verify Home Page Loaded

    Navigate To Element Horizontal       ${CURRENCY_LINK}    @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER
    Wait Until Element Is Visible        ${CURRENCY_MENU} 
    Navigate To Element Arrow Down       ${EURO}             @{CURRENCY_MENU_ELEMENTS}
    Press Keys    None    ENTER
    Wait Until Element Is Not Visible    ${CURRENCY_MENU}
    
    Press Keys    None    TAB
    Element Should Be Visible            ${CURRENCY_LINK}
    Press Keys    None    ENTER
    Navigate To Element Arrow Down       ${POUND_STERLING}    @{CURRENCY_MENU_ELEMENTS}
    Press Keys    None    ENTER
    Wait Until Element Is Not Visible    ${CURRENCY_MENU}

    Navigate To Element                  ${TABLETS_LINK} 
    Press Keys    None    ENTER
    Element Should Contain               ${PRODUCT_PRICE}    £