*** Settings ***
Documentation         Happy Path tests for OpenCart Checkout icon interaction with an empty cart
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp06_checkout.robot

*** Test Cases ***

Access Checkout Using Keyboard
    [Documentation]    Verify that a keyboard user is redirected to the Shopping Cart page
    ...                when activating the Checkout icon with an empty cart, and can return to the Home page.
    
    [tags]  happy_path checkout

    Verify Home Page Loaded
    
    Navigate To Element Horizontal         ${CHECKOUT_LINK}     @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER

    Wait Until Element Is Visible          ${SHOPPING_CART_TITLE}
    Element Text Should Be                 ${SHOPPING_CART_TITLE}    Shopping Cart

    Navigate To Element                    ${SHOPPING_CART_CONTINUE_LINK}  
    Press Keys    None    ENTER
    
    Verify Home Page Is Displayed