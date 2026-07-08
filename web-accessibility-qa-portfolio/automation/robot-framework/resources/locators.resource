*** Settings ***
Library         SeleniumLibrary    

*** Variables ***
${CURRENCY_LINK}       css:form#form-currency a.dropdown-toggle
${TELEPHONE_LINK}      css:div.text-end a[href*="information/contact"]
${MY_ACCOUNT_LINK}     css:div.text-end div.dropdown a.dropdown-toggle
${WISH_LIST_LINK}      css:div.text-end a[href*="account/wishlist"]
${SHOPPING_CART_LINK}  css:div.text-end a[href*="checkout/cart"]
${CHECKOUT_LINK}       css:div.text-end a[href*="checkout/checkout"]