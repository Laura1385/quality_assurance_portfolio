*** Settings ***
Documentation         Happy Path tests for OpenCart telephone icon interaction.
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp02_telephone_icon.robot

*** Test Cases ***
Submit Contact Us Form Using Keyboard
    [Documentation]  Verify that a keyboard user can successfully submit the Contact Us form.
    
    [tags]  hp02    telephone

    Verify Home Page Loaded

    Navigate To Element Horizontal       ${TELEPHONE_LINK}    @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER

    Wait Until Element Is Visible        xpath://main//h1[normalize-space(.)='Contact Us']
    
    Navigate To Element                  id:input-name
    Input Text                           id:input-name        Test One
   
    Navigate To Element                  id:input-email
    Input Text                           id:input-email       test.one@test.com

    Navigate To Element                  id:input-enquiry
    Input Text                           id:input-enquiry     Lorem ipsum dolor sit amet?

    Navigate To Element                  ${CONTACT_US_SUBMIT_BUTTON} 
    Press Keys    None    ENTER

    Navigate To Element                  ${CONTACT_US_CONTINUE_LINK}
    Press Keys    None    ENTER

    Verify Home Page Is Displayed