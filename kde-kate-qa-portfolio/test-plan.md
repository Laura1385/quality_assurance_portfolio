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

## 3. Test Types
The following test types are planned:
- **Smoke tests** – basic validation of the feature availability
- **Happy path tests** – standard user flows
- **Edge tests** – boundary conditions and abnormal behaviors

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

| Feature area                                | Test Case ID    | Test Type       |
|---------------------------------------------|-----------------|-----------------|
| Access language settings                    | TC-SMOKE-01     | Smoke           | 
| Access language settings                    | TC-SMOKE-01-GH  | Smoke (Gherkin) | 
| Change UI language                          | TC-HAPPY-01     | Happy Path      | 
| Language persistence after restart          | TC-HAPPY-02     | Happy Path      | 
| Cancel language change                      | TC-HAPPY-03     | Happy Path      |
| Add fallback language                       | TC-HAPPY-04     | Happy Path      |
| Remove fallback language                    | TC-HAPPY-05     | Happy Path      |
| Suppress restart confirmation message       | TC-HAPPY-06     | Happy Path      |
| Restore default language                    | TC-HAPPY-07     | Happy Path      | 
| Dropdown scroll behavior                    | TC-EDGE-01      | Edge            | 
| Fallback identical to Primary not persisted | TC-EDGE-02      | Edge            |
| Dropdown scroll behavior investigation      | TC-EXP-01       | Exploratory     |

---

## Test Inventory – Language Selection Feature

| ID            | Title                                           | Type         | Priority | Feature Area        |
|---------------|------------------------------------------------|-------------|----------|---------------------|
| TC-SMOKE-01   | Access language settings                       | Smoke        | High     | Settings → Language |
| TC-HAPPY-01   | Change UI language                             | Happy Path   | High     | Settings → Language |
| TC-HAPPY-02   | Language persists after restart                | Happy Path   | High     | Settings → Language |
| TC-HAPPY-03   | Cancel language change                         | Happy Path   | Medium   | Settings → Language |
| TC-HAPPY-04   | Add fallback language                          | Happy Path   | High     | Settings → Language |
| TC-HAPPY-05   | Remove fallback language                       | Happy Path   | Medium   | Settings → Language |
| TC-HAPPY-06   | Suppress restart confirmation message          | Happy Path   | Low      | Settings → Language |
| TC-HAPPY-07   | Restore default language                       | Happy Path   | Medium   | Settings → Language |
| TC-EDGE-01    | Dropdown scroll instability                    | Edge         | Medium   | Settings → Language |
| TC-EDGE-02    | Fallback identical to Primary not persisted    | Edge         | Medium   | Settings → Language |
| TC-EXP-01     | Dropdown scroll behavior investigation         | Exploratory  | Medium   | Settings → Language |

---

## Draft / Notes (for Phase 3 – Execution & Bug Analysis)

Feature: Language selection in Kate UI

| Feature area                               | Test Case ID   | Test Type     | Notes |
|--------------------------------------------|---------------|--------------|-------|
| Dropdown scroll behavior                   | TC-EDGE-01    | Edge         | Intermittent scroll issue observed in both Primary and Fallback dropdowns. Conditions not fully isolated. |
| Dropdown scroll behavior investigation     | TC-EXP-01     | Exploratory  | Intermittent behavior observed; further investigation required to isolate root cause. |
| Fallback identical to Primary not persisted| TC-EDGE-02    | Edge         | Fallback identical to Primary is not persisted after restart; restart message still displayed. Design intent unclear. |
