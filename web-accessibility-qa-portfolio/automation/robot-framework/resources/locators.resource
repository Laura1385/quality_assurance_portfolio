*** Settings ***
Library                     SeleniumLibrary    

*** Variables ***
${CURRENCY_LINK}                    css:form#form-currency a.dropdown-toggle
${TELEPHONE_LINK}                   css:div.text-end a[href*="information/contact"]
${MY_ACCOUNT_LINK}                  css:div.text-end div.dropdown a.dropdown-toggle
${WISH_LIST_LINK}                   css:div.text-end a[href*="account/wishlist"]
${SHOPPING_CART_LINK}               css:div.text-end a[href*="checkout/cart"]
${CHECKOUT_LINK}                    css:div.text-end a[href*="checkout/checkout"]
${CURRENCY_MENU}                    css:form#form-currency ul.dropdown-menu.show a.dropdown-item
${EURO}                             css:form#form-currency ul.dropdown-menu.show a[href="EUR"]
${POUND_STERLING}                   css:form#form-currency ul.dropdown-menu.show a[href="GBP"]
${US_DOLLAR}                        css:form#form-currency ul.dropdown-menu.show a[href="USD"]
${TABLETS_LINK}                     xpath://a[normalize-space(.)='Tablets']
${PRODUCT_PRICE}                    css:div.price span.price-new
@{REGISTER}                         css:div.text-end div.dropdown a[href*="account/register"]       
@{LOGIN}                            css:div.text-end div.dropdown a[href*="account/login"]
${REGISTER_PAGE_TITLE}              css:#content > h1
${ACCOUNT_CREATED_TITLE}            css:#common-success div#content > h1
${FIRST_PRODUCT_WISHLIST_BUTTON}    css:#content div.row > div.col:first-child button[formaction*="account/wishlist"]
${SHOPPING_CART_TITLE}              css:#shopping-cart h1
${SHOPPING_CART_CONTINUE_LINK}      css:#shopping-cart div.text-end a[href*="common/home"]
${HOME_PAGE_CAROUSEL}               css:div.carousel-inner
${BREADCRUMB_HOME_LINK}             css:div.container > ul.breadcrumb a[href*="common/home"]
${MY_ACCOUNT_DROPDOWN_MENU}         css:div.text-end div.dropdown > ul.dropdown-menu.show
${CONTACT_US_SUBMIT_BUTTON}         css:div.text-end > button[type="submit"]
${CONTACT_US_CONTINUE_LINK}         css:div.text-end > a[href*="common/home"]
${REGISTER_PRIVACY_POLICY_SWITCH}   css:form#form-register input[name="agree"]


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

@{CURRENCY_MENU_ELEMENTS}
...    ${EURO}
...    ${POUND_STERLING}
...    ${US_DOLLAR}

@{MY_ACCOUNT_MENU}    
...    @{REGISTER} 
...    @{LOGIN}