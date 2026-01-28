# Test Cases – Kate Language Selection

## TC-HAPPY-01 – Change UI language (dropdown scroll)

**Type:** Happy Path  
**Priority:** High  
**Related area:** Settings → Language

### Preconditions
- Kubuntu VM is running and responsive
- Kate is opened
- Settings menu is accessible

### Steps (User)
1. In Kate, open **Settings → Configure Language…**
2. Locate **Primary Language**.
3. Open the **Primary Language dropdown**.
4. If the list is longer than the visible area, attempt to **scroll** inside the dropdown
   - Use mouse wheel / trackpad scroll
   - (Optional) Use keyboard navigation (Down arrow / PageDown)
5. Select a language that is **not currently selected** (e.g., Danish).
6. Confirm / apply changes (if an Apply/OK button is present).
7. Info Message appear

### Expected Result (What system does)
- The dropdown list **scrolls correctly** when languages exceed the visible area.
- The user can **reach and select any language** (including those not initially visible).
- After selecting a new language:
  - An informational message is displayed indicating that the language change will take effect after restarting the application (**message content is informational and non-blocking**).
  - The selected language is saved.
- The UI language is applied **after restart**
- No UI elements become unreachable or unresponsive.