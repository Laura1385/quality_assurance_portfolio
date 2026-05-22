Biot (FR), 2026-04-28

# Test Plan – Web Accessibility UI Automation Project

## 1. Project Objective
Verify the Keyboard Compatibility, on selected user flows, of the https://demo.opencart.com/ site web.

---

## 2. Application Under Test
The https://demo.opencart.com/ is a publicly available demo web application that represents a typical e-commerce application.

---

## 3. Scope
This test plan covers keyboard compatibility testing for the following user flows:
- form interaction during user registration
- search input and results navigation
- cart interaction (add/remove/update quantity)
- checkout flow including the payment 

### Accessibility Reference
**Keyboard Compatibility** means:
*"Users can access and navigate between links, buttons, forms, and other controls using the Tab key and other keystrokes. The website should not require a mouse"
(source: Guide line of the WAI - Web Accessibility Initiative)

---

## 4. Out of Scope
The following are explicitly excluded from this test plan:
- Use of mouse, voice commands, and gestures
- Other categories of accessibility testing, such as:
  - Layout, design, and color contrast
  - Audio and media accessibility
  - Content readability and understandability

---

## 5. Test Strategy
Keyboard Compatibility testing is performed using a combination of structured and exploratory approaches through the test types described in the 6. Test Types section below.

The flows, specified in the Scope section, must be tested only via the Keyboard navigation (web) main commands:
• Next → Tab
• Back → Shift + Tab
• Activate / enter → Enter 
• Exit / close → Esc
• Move (lists, menus, dropdowns) → Up arrow / Down arrow

For each tested flow, the following will be verified:
- visibility of the focused element
- logical navigation order 
- reachability of each element
- absence of keyboard traps

### Test Case Naming Convention
Test cases follow this format: 
TC-[TYPE]-[SHORT-DESCRIPTION]-[SEQUENTIAL NUMBER]

Where:
- TYPE: SM (Smoke), HP (Happy Path), EXP (Exploratory)
- SHORT-DESCRIPTION: concise functional identifier
- SEQUENTIAL NUMBER: incremental identifier within the same type

---

## 6. Test Types
- **Smoke testing** is used to verify basic keyboard accessibility of the website.
- **Happy path testing** validates standard user workflows and expected behavior under normal conditions.
- **Exploratory testing** is conducted when unexpected or unstable behavior is observed during execution of structured test cases, in order to investigate root causes and identify interaction-dependent issues.

---

## 7. Tools
- Browser (Google Chrome)
- Keyboard (primary input device)

---

## 8. Risks
- Test result inconsistencies when using different browsers.
- Changes in the website design that may affect test validity or alter the tested flows.
- Ambiguity in result interpretation, especially regarding:
  - visibility of the focused element
  - logical navigation order
  - reachability of interactive elements

---

## 9. Entry Criteria
Testing can start when:
- the website https://demo.opencart.com/ is accessible
- the selected page is fully loaded
- the selected browser is correctly installed and usable
- it is possible to interact with the pages using the keyboard

---

## 10. Exit Criteria
Testing is considered complete when:
- all planned test cases have been executed
- test results have been recorded
- identified issues have been documented and refined

---

## 11. Known Issues During Testing
- Temporary interruptions of the demo website were observed during execution (HTTP Error 522).
- The demo environment temporarily blocked repeated requests during testing activities (Cloudflare Error 1015).

---

## 12. Additional Test Scenarios Identified
- TC-ED-ContactFormValidation-XX – Invalid Contact Form Input
- TC-ED-RegisterAccountFormValidation-XX – Invalid Register Account Form Input
- TC-HP-ShoppingCartIconInteraction-XX – Open Shopping Cart with Product
- TC-HP-CheckoutIconInteraction-XX – Access Checkout with Product
- TC-HP-MyAccountMenuInteraction-XX – Login Page New Customer Navigation
- TC-HP-MyAccountMenuInteraction-XX – Submit Returning Customer Form
- TC-HP-MyAccountMenuInteraction-XX – Login Page Navigate Sidebar Links

---

## 13. Potential Issues Identified During Testing
- Keyboard navigation flow becomes temporarily unclear before reaching the first product actions in the *Featured* section.
Possible focus visibility issue near the homepage carousel/slideshow controls.

- A PHP warning message related to the Wish List feature was observed after adding the first product to the Wish List.
The warning persists after adding additional products.
```text
Warning: Undefined array key "stock_status" in /var/www/opencart.com/web/catalog/controller/account/wishlist.php on line 98
```

---

## Traceability Matrix 

Feature: Keyboard compatibility

| Test area                                   | Test Case ID                                  | Test Type       |
|---------------------------------------------|-----------------------------------------------|-----------------|
| Header keyboard navigation                  | TC-SM-HeaderKeyboardAccessibility-01          | Smoke           | 
| Currency menu interaction                   | TC-HP-CurrencyMenuInteraction-01              | Happy Path      |
| Telephone icon interaction                  | TC-HP-TelephoneIconInteraction-02             | Happy Path      |
| My Account menu interaction                 | TC-HP-MyAccountMenuInteraction-03             | Happy Path      |
| Wish List icon interaction                  | TC-HP-WishListIconInteraction-04              | Happy Path      |
| Shopping cart icon interaction              | TC-HP-ShoppingCartIconInteraction-05          | Happy Path      |
| Checkout icon interaction                   | TC-HP-CheckoutIconInteraction-06              | Happy Path      |
| Register account form                       | TC-HP-RegisterAccountFormInteraction-07       | Happy Path      |
| Wish List page interaction                  | TC-HP-WishListPageInteraction-08              | Happy Path      |
| Featured section keyboard navigation        | TC-EXP-FeaturedProductKeyboardNavigation-01   | Exploratory     |