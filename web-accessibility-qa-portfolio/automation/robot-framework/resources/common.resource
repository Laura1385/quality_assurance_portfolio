*** Settings ***
Library         SeleniumLibrary    
Library         DateTime
Resource        locators.resource

*** Variables ***
${BASE_URL}    http://localhost:8888
${BROWSER}     chrome

*** Keywords ***
# Configure Selenium execution parameters.
Initialize Selenium
    Set Selenium Speed        .1s               #adds a pause after each command
    Set Selenium Timeout      7s               #set how long to wait before failing


# Open the application before each test.
Begin Web Test
    Initialize Selenium
    Open Browser              ${BASE_URL}    ${BROWSER}
    Maximize Browser Window


# Close the browser after each test.
End Web Test
    Close Browser

# Verify that the OpenCart home page is ready for interaction.
Verify Home Page Loaded
    Element Should Be Visible    id=logo


# Move the keyboard focus through a list using Tab.
Navigate To Element Horizontal
    [Arguments]    ${target_element}    @{elements}

    ${target_is_focused}=    Run Keyword And Return Status
    ...    Element Should Be Focused    ${target_element}

    IF    ${target_is_focused}
        RETURN
    END

    FOR    ${element}    IN    @{elements}
        Press Keys    None    TAB
        Element Should Be Focused    ${element}

        IF    '${element}' == '${target_element}'
            BREAK
        END
    END


# Move the keyboard focus through a list using Arrow Down.
Navigate To Element Arrow Down
    [Arguments]    ${target_element}    @{elements}
    FOR    ${element}    IN    @{elements}
        Press Keys    None    ARROW_DOWN	
        Element Should Be Focused    ${element}
        IF    '${element}' == '${target_element}'
            BREAK
        END
    END


# Check whether the target element currently has focus.
# "Run Keyword And Return Status" converts the result of a verification keyword 
# into True/False instead of failing the test immediately.
Is Element Focused
    [Arguments]    ${target_element}

    # Prevent screenshot spam during focus polling.
    ${previous_keyword}=    Register Keyword To Run On Failure    NONE

    ${is_focused}=    Run Keyword And Return Status    Element Should Be Focused    ${target_element}
    Register Keyword To Run On Failure    ${previous_keyword}

    RETURN    ${is_focused}


# Navigate through the page until the target element receives focus.
Navigate To Element
    [Arguments]    ${target_element}

    ${is_focused}=    Is Element Focused    ${target_element}

    WHILE    not ${is_focused}
        Press Keys    None    TAB
        ${is_focused}=    Is Element Focused    ${target_element}
    END


# Accept the Privacy Policy
Accept Privacy Policy
    Navigate To Element    ${REGISTER_PRIVACY_POLICY_SWITCH}
    Press Keys             None    SPACE


# Generate a unique email address to avoid duplicate registrations
Generate Unique Registration Email
    ${email_suffix}=          Get Current Date    result_format=%Y%m%d%H%M%S%f
    ${registration_email}=    Set Variable        uncle.scrooge${email_suffix}@gmail.com
    RETURN                    ${registration_email}


# Register a new user for tests requiring an authenticated session
Register New User
    ${test_email}=    Generate Unique Registration Email

    Navigate To Element Horizontal    ${MY_ACCOUNT_LINK}    @{HEADER_FORWARD_ELEMENTS}
    Press Keys    None    ENTER

    Wait Until Element Is Visible     ${MY_ACCOUNT_DROPDOWN_MENU}
    Press Keys    None    ENTER

    Navigate To Element Arrow Down    @{REGISTER}    @{MY_ACCOUNT_MENU}
    Press Keys    None    ENTER

    Input Text    input-firstname     Uncle
    Input Text    input-lastname      Scrooge
    Input Text    input-email         ${test_email}
    Input Text    input-password      Topolino

    Accept Privacy Policy
    
    Press Keys    css:form#form-register button[type="submit"]    ENTER

    Wait Until Element Is Visible    ${ACCOUNT_CREATED_TITLE}

    Wait Until Element Is Visible    ${ACCOUNT_CREATED_TITLE}
    Element Text Should Be           ${ACCOUNT_CREATED_TITLE}      Your Account Has Been Created!

    Navigate To Element              css:#content div.text-end > a[href*="account/account"]
    Press Keys    None    ENTER

    Navigate To Element              ${BREADCRUMB_HOME_LINK} 
    Press Keys    None    ENTER

    #RETURN    ${test_email}


# Add the first product to the Wish List
Add Product To Wish List

    Navigate To Element    ${FIRST_PRODUCT_WISHLIST_BUTTON}
    Press Keys    None    ENTER

    Wait Until Element Contains        css:#alert .alert        Success: You have added


# Verify the OpenCart home page is displayed
Verify Home Page Is Displayed
    Wait Until Element Is Visible    ${HOME_PAGE_CAROUSEL}
