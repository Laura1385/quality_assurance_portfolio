Biot (FR), 2026-01-28

# Mini Test Plan – Kate Language Selection

## 1. Scope
This test plan covers the **language selection feature inside the Kate UI**.

The scope includes:
- Accessing language settings from Kate
- Display of available languages in the dropdown menu
- Ability to scroll the language list when it exceeds the visible area
- Selection of a language from the list
- Visual confirmation of the selected language

Expected scope:
Menus, dialogs, and settings UI labels should reflect the selected language
(immediately or after restart, depending on design).

---

## 2. Out of Scope
The following areas are explicitly excluded from this test plan:
- System-wide language changes
- Translation correctness or linguistic quality
- Persistence of language settings after system reboot
- Localization of plugins or external components

---

## 3. Test Strategy
Testing of the Language Selection feature is performed using a combination of structured and exploratory approaches:

- **Smoke testing** is used to verify basic accessibility of the feature and confirm that the configuration screen is reachable.
- **Happy path testing** validates standard user workflows and expected behavior under normal conditions.
- **Edge testing** evaluates boundary conditions and abnormal scenarios that may affect stability or consistency.
- **Exploratory testing** is conducted when unexpected or unstable behavior is observed during execution of structured test cases, in order to investigate root causes and identify interaction-dependent issues.

### Test Case Naming Convention

Test cases follow this format:
TC-[TYPE]-[SHORT-DESCRIPTION]-[SEQUENTIAL NUMBER]

Where:
- TYPE: SM (Smoke), HP (Happy Path), ED (Edge), EXP (Exploratory)
- SHORT-DESCRIPTION: concise functional identifier
- SEQUENTIAL NUMBER: incremental identifier within the same type

---

## 4. Test Environment
- Host OS: macOS Ventura 13.7.8
- Virtualization Tool: UTM (QEMU)
- Guest OS: Kubuntu 26.04 (Snapshot – Dec 2025)
- Desktop Environment: KDE Plasma
- Application Under Test: Kate
- Version: 25.12.1
- UI Language: English

---

## 5. Entry Criteria
Testing can start when:
- Kate launches correctly
- The Settings menu is accessible
- The Language configuration screen is reachable

---

## 6. Exit Criteria
Testing is considered complete when:
- All planned test cases have been executed
- Test results have been recorded
- Identified issues have been documented and refined

---

## Traceability – Feature to Test Cases

Feature: Language selection in Kate UI

| Feature area                                | Test Case ID                          | Test Type       |
|---------------------------------------------|---------------------------------------|-----------------|
| Access language settings                    | TC-SM-AccessSettings-01               | Smoke           | 
| Access language settings                    | TC-SM-AccessSettings-GH-01            | Smoke (Gherkin) | 
| Change UI language                          | TC-HP-ChangeUILang-01                 | Happy Path      | 
| Language persistence after restart          | TC-HP-PersistAfterRestart-02          | Happy Path      | 
| Cancel language change                      | TC-HP-CancelChange-03                 | Happy Path      |
| Add fallback language                       | TC-HP-AddFallback-04                  | Happy Path      |
| Remove fallback language                    | TC-HP-RemoveFallback-05               | Happy Path      |
| Suppress restart confirmation message       | TC-HP-SuppressRestartMsg-06           | Happy Path      |
| Restore default language                    | TC-HP-RestoreDefault-07               | Happy Path      | 
| Dropdown scroll behavior                    | TC-ED-DropdownScroll-01               | Edge            | 
| Fallback identical to Primary not persisted | TC-ED-FallbackEqualsPrimary-02        | Edge            |
| Dropdown scroll behavior investigation      | TC-EXP-DropdownScroll-01              | Exploratory     |

---

## Test Inventory – Language Selection Feature

| ID                                   | Title                                           | Type         | Priority | Feature Area        |
|--------------------------------------|-------------------------------------------------|--------------|----------|---------------------|
| TC-SM-AccessSettings-01              | Access language settings                        | Smoke        | High     | Settings → Language |
| TC-HP-ChangeUILang-01                | Change UI language                              | Happy Path   | High     | Settings → Language |
| TC-HP-PersistAfterRestart-02         | Language persists after restart                 | Happy Path   | High     | Settings → Language |
| TC-HP-CancelChange-03                | Cancel language change                          | Happy Path   | Medium   | Settings → Language |
| TC-HP-AddFallback-04                 | Add fallback language                           | Happy Path   | High     | Settings → Language |
| TC-HP-RemoveFallback-05              | Remove fallback language                        | Happy Path   | Medium   | Settings → Language |
| TC-HP-SuppressRestartMsg-06          | Suppress restart confirmation message           | Happy Path   | Low      | Settings → Language |
| TC-HP-RestoreDefault-07              | Restore default language                        | Happy Path   | Medium   | Settings → Language |
| TC-ED-DropdownScroll-01              | Dropdown scroll instability                     | Edge         | Medium   | Settings → Language |
| TC-ED-FallbackEqualsPrimary-02       | Fallback identical to Primary not persisted     | Edge         | Medium   | Settings → Language |
| TC-EXP-DropdownScroll-01             | Dropdown scroll behavior investigation          | Exploratory  | Medium   | Settings → Language |


---
