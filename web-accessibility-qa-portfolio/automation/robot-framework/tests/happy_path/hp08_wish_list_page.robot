*** Settings ***
Documentation         Happy Path tests for OpenCart Wish List interaction.
Library               SeleniumLibrary
Resource              ../../resources/common.resource

Test Setup            Begin Web Test    
Test Teardown         End Web Test      


# Run from the project root:
# robot -d automation/robot-framework/results/2_happy_path automation/robot-framework/tests/happy_path/hp08_wish_list_page.robot

*** Test Cases ***
Remove Product from Wish List Using Keyboard
    [Documentation]  Verify that a logged-in user can remove a product from the Wish List using the keyboard.
    
    [tags]  hp08    wish_list_page

    Verify Home Page Loaded

    Register New User
    Add Product To Wish List

    Wait Until Element Is Visible        css:a[href*="common/home"]
    Navigate To Element                  ${WISH_LIST_LINK} 
    Press Keys    None    ENTER

    Wait Until Element Is Visible        css:#content h1
    Element Text Should Be               css:#content h1       My Wishlist
    Navigate To Element                  css:div.d-grid a[href*="remove"]  
    Press Keys    None    ENTER
    Wait Until Element Contains          css:#alert .alert     Success: You have removed an item from your wishlist

    Wait Until Element Is Visible        css:#content h1
    Wait Until Element Contains          css:#content           Your wish list is empty.    3s

    Navigate To Element                  xpath://a[normalize-space(.)="Continue"]
    Press Keys    None    ENTER
    
    Navigate To Element                  css:div.container > ul.breadcrumb a[href*="common/home"]
    Press Keys    None    ENTER
    
    Wait Until Element Is Visible        css:div.carousel-inner