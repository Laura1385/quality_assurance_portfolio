*** Settings ***
Documentation         Happy Path tests for OpenCart Shopping Cart icon interaction
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp05_shopping_cart.robot

*** Test Cases ***
Access Shopping Cart Using Keyboard
    [Documentation]  Verify that a keyboard user can navigate to the Shopping Cart page,
    ...     through the Shopping Cart icon, and return to the Home page.
    
    [tags]  happy_path shopping_cart

    Verify Home Page Loaded
    
    Navigate To Element Horizontal         ${SHOPPING_CART_LINK}     @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER

    Wait Until Element Is Visible          ${SHOPPING_CART_TITLE}
    Element Text Should Be                 ${SHOPPING_CART_TITLE}    Shopping Cart

    Navigate To Element                    ${SHOPPING_CART_CONTINUE_LINK}  
    Press Keys    None    ENTER

    Verify Home Page Is Displayed