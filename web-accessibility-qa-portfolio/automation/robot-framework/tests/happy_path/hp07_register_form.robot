*** Settings ***
Documentation         Happy Path tests for the OpenCart registration form
Library               SeleniumLibrary
Resource              ../../resources/common.resource
Resource              ../../resources/locators.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp07_register_form.robot

*** Variables ***
${REGISTER_PAGE_TITLE}                  css:#content > h1
${ACCOUNT_CREATED_TITLE}                css:#common-success div#content > h1

*** Test Cases ***

Complete Register Account Workflow Using Keyboard
    [Documentation]  Verify that a keyboard user can successfully complete the Register Account workflow using only the keyboard.
    
    [tags]  hp07    register_form

    Verify Home Page Loaded

    Navigate To Element Horizontal       ${MY_ACCOUNT_LINK}     @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER
    
    Wait Until Element Is Visible        css:div.text-end div.dropdown > ul.dropdown-menu.show
    Press Keys    None    ENTER

    Navigate To Element Arrow Down       @{REGISTER}            @{MY_ACCOUNT_MENU}    
    Press Keys    None    ENTER
    Wait Until Element Is Visible        ${REGISTER_PAGE_TITLE}
    Element Text Should Be               ${REGISTER_PAGE_TITLE}      Register Account

    Navigate To Element                  input-firstname
    Input Text                           input-firstname    Uncle   

    Navigate To Element                  input-lastname
    Input Text                           input-lastname     Scrooge

    Navigate To Element                  input-email
    ${test_email}=    Generate Unique Registration Email
    Input Text                           input-email        ${test_email}

    Navigate To Element                  input-password
    Input Text                           input-password     Topolino

    Navigate To Element                  input-newsletter
    Press Keys    None    SPACE
    Navigate To Element                  css:form#form-register a[href*="information/information.info"]
    Press Keys    None    ENTER
    Navigate To Element                  css:div.modal-header > button[type="button"]
    Press Keys    None    ENTER
   
    Wait Until Element Is Visible        ${REGISTER_PAGE_TITLE}
    Element Text Should Be               ${REGISTER_PAGE_TITLE}      Register Account

    Navigate To Element                  css:form#form-register input[name="agree"]
    Press Keys    None    SPACE
    Navigate To Element                  css:form#form-register button[type="submit"]
    Press Keys    None    ENTER
    
    Wait Until Element Is Visible        ${ACCOUNT_CREATED_TITLE}
    Element Text Should Be               ${ACCOUNT_CREATED_TITLE}      Your Account Has Been Created!

    Navigate To Element                  css:div#content a[href*="information/contact"]
    Press Keys    None    ENTER

    Wait Until Element Is Visible        css:#information-contact div#content > h1
    Element Text Should Be               css:#information-contact div#content > h1      Contact Us

    Textfield Value Should Be            input-name     Uncle
    Textfield Value Should Be            input-email    ${test_email}

    Navigate To Element                  css:textarea#input-enquiry
    Input Text                           css:textarea#input-enquiry    Lorem ipsum dolor sit amet?
    Navigate To Element                  css:div.text-end > button[type="submit"]
    Press Keys    None    ENTER
    Wait Until Element Is Visible        ${ACCOUNT_CREATED_TITLE}
    Element Should Contain               css:#common-success div#content        Your enquiry has been successfully sent to the store owner!

    Navigate To Element                  css:div.text-end > a[href*="common/home"]
    Element Text Should Be               css:#common-success div#content > h1      Contact Us
    Press Keys    None    ENTER

    Wait Until Element Is Visible        css:div.carousel-inner