*** Settings ***
Library         SeleniumLibrary    

*** Variables ***
${BASE_URL}    http://localhost:8888
${BROWSER}     chrome

*** Keywords ***
# Configure Selenium execution parameters
Initialize Selenium
    Set Selenium Speed        .2s               #adds a pause after each command
    Set Selenium Timeout      10s               #set how long to wait before failing

# Open the application before each test
Begin Web Test
    Initialize Selenium
    Open Browser              ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

# Close the browser after each test
End Web Test
    Close Browser

# Move the keyboard focus through a list using Tab.
Navigate To Element Horizontal
    [Arguments]    ${target_element}    @{elements}
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

    ${is_focused}=    Run Keyword And Return Status    Element Should Be Focused    ${target_element}
    RETURN    ${is_focused}

# Navigate through the page until the target element receives focus.
Navigate To Element
    [Arguments]    ${target_element}

    ${is_focused}=    Is Element Focused    ${target_element}

    WHILE    not ${is_focused}
        Press Keys    None    TAB
        ${is_focused}=    Is Element Focused    ${target_element}
    END

