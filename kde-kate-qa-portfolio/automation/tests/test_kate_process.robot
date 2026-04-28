*** Settings ***
Documentation       TC-SM-AccessSettings-01 - Access language settings
Resource            ../resources/Kate.resource 
Resource            ../resources/CommonKate.resource 

# Run test:
# robot -d kde-kate-qa-portfolio/automation/results kde-kate-qa-portfolio/automation/tests/test_kate_process.robot

# See log file:
# chromium kde-kate-qa-portfolio/automation/results/log.html

*** Test Cases ***
Open Language Dialog
    [Documentation]    Smoke test where the focus is on verifying that the feature is accessible.
    [Tags]    Smoke
    Open Kate
    Open Configure Language
    Close Kate