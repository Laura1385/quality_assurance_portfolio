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