*** Settings ***
Documentation         Smoke tests for OpenCart header keyboard accessibility.
Library               SeleniumLibrary
Resource              ../../resources/common.resource
Resource              ../../resources/locators.resource

Test Setup           Begin Web Test    
Test Teardown        End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/1_smoke automation/robot-framework/tests/smoke/smoke_header.robot

*** Variables ***
@{HEADER_FORWARD_ELEMENTS}
...    ${CURRENCY_LINK}
...    ${TELEPHONE_LINK}
...    ${MY_ACCOUNT_LINK}
...    ${WISH_LIST_LINK}
...    ${SHOPPING_CART_LINK}
...    ${CHECKOUT_LINK}

@{HEADER_BACKWARD_ELEMENTS}
...    ${SHOPPING_CART_LINK}
...    ${WISH_LIST_LINK}
...    ${MY_ACCOUNT_LINK}
...    ${TELEPHONE_LINK}
...    ${CURRENCY_LINK}

*** Test Cases ***
Header Toolbar Is Keyboard Accessible
    [Documentation]  Verifies that header toolbar elements are reachable with Tab
    ...                and that Shift+Tab follows the same navigation order in reverse.
    Element Should Be Visible        id=logo
    FOR    ${element}    IN    @{HEADER_FORWARD_ELEMENTS}
        Press Keys    None    TAB
        Element Should Be Focused    ${element}
    END

    FOR    ${element}    IN    @{HEADER_BACKWARD_ELEMENTS}
        Press Keys    None    SHIFT+TAB
        Element Should Be Focused    ${element}
    END
