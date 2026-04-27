*** Settings ***
Library    Process

# Run test:
# robot -d automation/results kde-kate-qa-portfolio/automation/tests/test_kate_process.robot

*** Test Cases ***
Kate Process Starts
    Start Process    kate    --new    /tmp/kate_smoke.txt    shell=False
#Sleep    1s
#${result}=    Run Process    pgrep    -af    kate    shell=False
#Should Be Equal As Integers    ${result.rc}    0    msg=Kate process not found. stdout=${result.stdout} stderr=${result.stderr}