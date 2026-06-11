*** Settings ***
Documentation        TC-SM-HeaderKeyboardAccessibility-01 - Keyboard navigation of header
Library              SeleniumLibrary    

# Run the script:
# robot -d web-accessibility-qa-portfolio/robot-framework/automation/results/1_smoke web-accessibility-qa-portfolio/robot-framework/automation/tests/smoke/header_keyboard_accessibility.robot

# Run only the test with 'current' tag:
# robot -d results -i smoke1 tests/smoke   
# after -i - first word after tag
# "test" - the last word is the folder

*** Variables ***


*** Test Cases ***
User can search for products
    [Documentation]  Smoke Test: it open the demo.opencart site web and verifying the keyboard accessibility of the header toolbar
    [Tags]  smoke1

    Go to                                   http://www.https://demo.opencart.com/
    Wait Until Page Contains                id=top